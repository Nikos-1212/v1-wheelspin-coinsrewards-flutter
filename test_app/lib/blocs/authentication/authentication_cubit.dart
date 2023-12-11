import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/values/constants.dart';
import 'authentication_interface_for_login.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationStatus>
    implements AuthenticationInterfaceForLogin {
  final Future<SharedPreferences> _sharedPreferences =
      SharedPreferences.getInstance();

  AuthenticationCubit() : super(AuthenticationStatus.unauthenticated) {
    _checkAuthenticationStatus();
  }

  Future<void> _checkAuthenticationStatus() async {
    final sharedPreferences = await _sharedPreferences;
    final String? token = sharedPreferences.getString(AppConstants.authIdToken);
    final bool isAuthenticated = token != null && token.isNotEmpty;

    if (isAuthenticated) {
      emit(AuthenticationStatus.authenticated);
    } else {
      emit(AuthenticationStatus.unauthenticated);
    }
  }

  Future<void> logIn(
      {required String token,
      required int partyId,
      required int tenantId,
      required String email}) async {
    final sharedPreferences = await _sharedPreferences;
    await sharedPreferences.setString(AppConstants.authIdToken, token);
    await sharedPreferences.setInt(AppConstants.partyId, partyId);
    await sharedPreferences.setInt(AppConstants.tenantId, tenantId);
    await sharedPreferences.setString(AppConstants.email, email);
    emit(AuthenticationStatus.authenticated);
  }

  Future<void> logOut() async {
    final sharedPreferences = await _sharedPreferences;
    await sharedPreferences.clear();
    emit(AuthenticationStatus.unauthenticated);
    Modular.to.pushReplacementNamed(Modular.initialRoute);
  }

  @override
  onLogout() async {
    await logOut();
  }

  @override
  onLogin(
      {required String token,
      required int partyId,
      required int tenantId,
      required String email}) async {
    // TODO: implement onLogin
    await logIn(
        token: token, partyId: partyId, tenantId: tenantId, email: email);
  }
}
