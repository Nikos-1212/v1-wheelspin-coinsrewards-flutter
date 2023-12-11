import 'dart:convert';
import 'package:framework_contracts_flutter/authentication/login_response.dart';
import 'package:manage_game_micro_service_sdk/model/GameMediatorInboundPayload.dart';
import 'package:manage_game_micro_service_sdk/model/GameMediatorOutboundPayload.dart';
import 'package:manage_game_micro_service_sdk/service/ManageGameservice.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/repositories/extended_http_client.dart';
import 'package:http/src/client.dart';
import 'package:http/http.dart' as http;
import 'package:test_app/values/constants.dart';
/// APPS AND DEVICES REPOSITORY CLASS CONTAINS REST APIS
class Repository {
  static String basicURL = "https://dev.vitalitydeveloper.com/api/";
  static String userAgent =
      'VitalityActive/1.4.2.35481/0.0 (SM-G973F; Android 10)';
  final Future<SharedPreferences> _sharedPreferences =
      SharedPreferences.getInstance();

  Future<LoginResponse> login(String username, String password) async {
    var headers = {
      'Authorization':
          'Basic RnFncWVnNGw5NktteEZQQndvUnR2UnB3MWc4YTo0MXJzRHpVdUJ5SHRVVFhIcDFQRVNkUERvSzRh',
      'correlation-id': 'b5f4af1d-4116-45e0-a183-5106fb72741e',
      'locale': 'en_US',
      'session-id': 'aead99f4-1659-4c63-a2e7-207a704bc87d',
      'User-Agent':
          'VitalityActive/1.4.2.35481/0.0 (Android SDK built for x86; Android 11)',
      'Content-Type': 'application/json',
      'Cookie':
          'dtCookie=v_4_srv_1_sn_6DB65293B46926B74E595759054DA0AC_perc_100000_ol_0_mul_1_app-3Aea7c4b59f27d43eb_1; incap_ses_49_2431393=XmKpJN8KG3P4mYQxVxWuABKWwmQAAAAAeVfPS9zP69nvcE6YnXYnnw==; nlbi_2431393=zKJxHg1KCCRMBJxIXXGvWgAAAAB6r+mHDgOyKRoPJWAU85Bd; visid_incap_2431393=/SKk3U5HSZGnk6uSlcVJ+07Lt2QAAAAAQUIPAAAAAACo7/jmeho7W778hvPRDI88; visid_incap_2431428=UbKK2Gx4R0qTR08YHjURR+XLt2QAAAAAQUIPAAAAAAA3ACgAYkqpKyjm67oboDuz'
    };
    var body = json.encode({
      "loginRequest": {"password": password, "username": username}
    });
    final response = await http.post(
        Uri.parse(
            '${basicURL}tstc-integration-platform-services-service-v1/1.0/login'),
        headers: headers,
        body: body);
    if (response.statusCode == 200) {
      return LoginResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to login${response.body}');
    }
  }

Future _gameMediator()async
{
      // GameOrchestrationService

  //      try {
  //     var newClient = ExtendedHttpClient(Client(), true);
  //     ManageGameService(
  //       newClient,
  //       'https://dev.vitalitydeveloper.com/api/',
  //       'VitalityActive/2.0.1.1513/1.1.0.000 (x86_64; iOS 16.4)',
  //     );

  //     final Future<SharedPreferences> sharedPreferences0 =SharedPreferences.getInstance();
  //     final sharedPreferences = await sharedPreferences0;
  //     final lgResponse = sharedPreferences.getString(AppConstants.loginResponse) ?? "";
  //     final loginResponse = LoginResponse.fromJson(json.decode(lgResponse));
      
  //     GameMediatorInboundPayload reqPayload =GameMediatorInboundPayload.fromJson({
  //       "instruction": '43',
  //       "agreementId": 62193627,
  //       "changeFlag": false,
  //       "playerId": loginResponse.
  //   });
      
  //     GameMediatorOutboundPayload  res = await ManageGameService.shared
  //         .gameMediator(accessToken, tenantNumber, reqPayload);
          
  //         // (accessToken, tenantNumber, body) maintainGameFromBonusReward(accessToken, tenantNumber, reqPayload);
  //     print(accessToken);
  //     if (res == null) {
  //       final result = res;
  //       // VALog().simple().d(result.toString(), 'Result');
  //     }
  //     return res;
  //   } catch (e) {
  //     if (kDebugMode) {
  //       var authError = e as ManageContentSDKError;
  //       print('result: ${authError.description}');
  //     }
  //   }
  //   return GetPageContentOutboundPayload();
  }

}
