/// Acciones de Redux relacionadas con la validación de cuenta (por Token).

import '../../../models/backend/users/user.dart';

/// Acción cuando se intenta validar una cuenta.
class AuthValidateAction {}

/// Acción cuando se logra validar una cuenta.
class AuthValidateSucceededAction {
  final User user;

  AuthValidateSucceededAction({required this.user});
}

/// Acción cuando la validación de una cuenta falla.
class AuthValidateFailedAction {
  final Exception error;

  AuthValidateFailedAction(this.error);
}
