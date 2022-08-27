/// Endpoints de Autenticación.
abstract class AuthApiClientURLs {
  final String login;
  final String user;
  final String logout;
  final String signUp;

  // Constructor
  const AuthApiClientURLs({
    required this.login,
    required this.user,
    required this.logout,
    required this.signUp,
  });
}