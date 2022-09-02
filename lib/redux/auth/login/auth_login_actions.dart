/// Acciones de Redux relacionadas con el inicio de sesión.

import 'dart:async';
import '../../../models/backend/users/user.dart';

/// Acción cuando se intenta iniciar sesión.
class AuthLoginAction {
  final String username;
  final String password;
  final Completer completer;

  AuthLoginAction({
    required this.username,
    required this.password,
    Completer? completer
  }): completer = completer ?? Completer();
}

/// Acción cuando se inicia sesión correctamente.
class AuthLoginSucceededAction {
  final User user;

  AuthLoginSucceededAction({
    required this.user,
  });
}
