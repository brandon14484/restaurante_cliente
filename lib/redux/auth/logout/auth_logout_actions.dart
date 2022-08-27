/// Acciones de Redux relacionadas con el cierre de sesión.


/// Acción cuando se intenta cerrar la sesión.
class AuthLogoutAction {}

/// Acción cuando se logra cerrar la sesión correctamente.
class AuthLogoutSucceededAction {}

/// Acción cuando el cierre de sesión falla.
class AuthLogoutFailedAction {
  final Exception error;

  AuthLogoutFailedAction(this.error);
}
