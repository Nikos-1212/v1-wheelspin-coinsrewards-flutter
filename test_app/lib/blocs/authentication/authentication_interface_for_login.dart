abstract class AuthenticationInterfaceForLogin {
  onLogout();

  onLogin(
      {required String token,
      required int partyId,
      required int tenantId,
      required String email});
}
