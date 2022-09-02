import '../../../models/api-client/auth/auth_api_client_urls.dart';

/// Endpoints de Autenticación en modo Live.
class AuthApiClientURLsLive extends AuthApiClientURLs {
  // Establecimiento de propiedades de AuthApiClientURLsLive
  static const AuthApiClientURLs authApiClientLiveURLSLive =
      AuthApiClientURLsLive(
    login: "/api/auth/login",
    user: "/api/auth/user",
    logout: "/api/auth/logout",
    signUp: "/api/auth/sign-up",
  );

  const AuthApiClientURLsLive({
    required String login,
    required String user,
    required String logout,
    required String signUp,
  }) : super(
          login: login,
          user: user,
          logout: logout,
          signUp: signUp,
        );
}
