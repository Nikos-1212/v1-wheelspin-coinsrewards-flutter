import 'dart:convert';
import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:http/http.dart' as http;

import 'package:logging/logging.dart';

/// Adds logging and cookie storage for [http.BaseClient]

class ExtendedHttpClient extends http.BaseClient {
  /// The [http.Client] used for HTTP communication

  final http.Client _delegate;

  /// Used for logging all network request and responses sent and received

  /// from the networking library

  final Logger _logger = Logger('http_request');

  /// Cookie storage helper. The setup stores the cookies to a temporary file

  final CookieJar _cookieJar = CookieJar();

  /// Allows for control of logs

  final bool shouldShowLogs;

  /// The regex pattern for splitting the set-cookie header.

  static final _regexSplitSetCookies = RegExp(
    r"""(?<!expires=\w{3}|"|')\s*,\s*(?!"|')""",
    caseSensitive: false,
  );

  /// Inject the [http.Client] used for HTTP communication

  ExtendedHttpClient(this._delegate, this.shouldShowLogs);

  /// Disposal of resources

  @override
  void close() => _delegate.close();

  /// Clear all cookies

  Future<void> reset() async {
    await _cookieJar.deleteAll();

    _logger.info("cookies cleared");
  }

  /// Debugging on the network requests

  void _logRequest(http.BaseRequest request) {
    if (!shouldShowLogs) return;

    String log = "----> ${request.method} ${request.url} ----";

    log += request.headers.entries
        .map((e) => "    ${e.key}: ${e.value}")
        .join("\n");

    if (request is http.Request && request.body.isNotEmpty) {
      log += "\n    Body:\n      ${request.body}";
    }

    _logger.info(log);
  }

  /// Debugging on network responses

  Future<http.StreamedResponse> _logResponse(
      http.BaseRequest request, http.StreamedResponse response) async {
    if (!shouldShowLogs) return response;

    String log = "<---- ${request.method} ${request.url} ----";

    log += response.headers.entries
        .map((e) => "    ${e.key}: ${e.value}")
        .join("\n");

    // Simple request

    if (request is http.Request) {
      final List<int> bytes = await response.stream.toBytes();

      log += "\n    Body:\n      ${utf8.decode(bytes)}";

      _logger.info(log);

      return http.StreamedResponse(
          http.ByteStream.fromBytes(bytes), response.statusCode,
          contentLength: response.contentLength,
          request: request,
          headers: response.headers,
          isRedirect: response.isRedirect,
          persistentConnection: response.persistentConnection,
          reasonPhrase: response.reasonPhrase);
    }

    _logger.info(log);

    return response;
  }

  /// "Intercept" the sending of [http.BaseRequest]s for logging

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    _logRequest(request);

    var response = await _delegate.send(request);

    _storeCookies(response);

    response = await _logResponse(request, response);

    return response;
  }

  /// Construct a cookie string to be used for adding to [http.BaseRequest]

  /// headers if any cookies are present for the [Uri]

  Future<String?> cookiesHeaderString(
    Uri uri, {
    Set<Cookie>? replacingCookies,
  }) async {
    List<Cookie> cookies = await _cookieJar.loadForRequest(uri);

    if (cookies.isEmpty) return null;

    return cookies.map((cookie) {
      if (replacingCookies == null) return cookie;

      Cookie validCookie = replacingCookies.firstWhere(
        (replace) => replace.name == cookie.name,
        orElse: () => cookie,
      );

      return "${validCookie.name}=${validCookie.value}";
    }).join(";");
  }

  /// Filter out set-cookie headers to save from the [http.StreamedResponse]

  List<Cookie> _filterCookies(http.StreamedResponse response) {
    List<Cookie> cookies = [];

    response.headers.entries
        .where((e) => e.key.toLowerCase().contains("set-cookie"))
        .forEach((e) => e.value
            .split(_regexSplitSetCookies)
            .forEach((e) => cookies.add(Cookie.fromSetCookieValue(e))));

    return cookies;
  }

  /// Filters through a response headers for "set-cookie" entries and stores

  /// all to the [_cookieJar]  Future<void>

  _storeCookies(http.StreamedResponse response) async {
    List<Cookie> cookies = _filterCookies(response);

    if (cookies.isEmpty) return;

    _cookieJar.saveFromResponse(response.request!.url, cookies);
  }
}
