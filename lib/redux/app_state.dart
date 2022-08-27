import './auth/auth_state.dart';

/// Estado global de la aplicación.
class AppState {
  /// Estado del módulo de autenticación.
  final AuthState authState;

  AppState({required this.authState});

  /// Estado inicial
  factory AppState.initialState() => AppState(
    authState: AuthState.initialState(),
  );
}
