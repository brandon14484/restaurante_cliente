import '../../models/backend/users/user.dart';

/// Estado de autenticación.
class AuthState {
  /// Usuario actual.
  final User? currentUser;
  /// Muestra si está iniciando sesión.
  final bool isLoadingAuthentication;
  /// Muestra si está cerrando sesión.
  final bool isLoadingLogout;
  /// Muestra si está registrando una cuenta.
  final bool isLoadingSignUp;

  AuthState({
    required this.isLoadingAuthentication,
    required this.currentUser,
    required this.isLoadingLogout,
    required this.isLoadingSignUp,
  });

  /// Estado inicial
  factory AuthState.initialState() => AuthState(
    currentUser: null,
    isLoadingAuthentication: false,
    isLoadingLogout: false,
    isLoadingSignUp: false,
  );
}
