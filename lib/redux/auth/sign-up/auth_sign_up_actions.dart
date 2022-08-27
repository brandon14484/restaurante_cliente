/// Acciones de Redux relacionadas con el registro de cuenta.

import 'dart:async';
import '../auth_middleware.dart';

import '../../../models/api-client/auth/payloads/auth_sign_up_payload.dart';

/// Acción cuando se intenta registrar una cuenta.
class AuthSignUpAction {
  /// Datos requeridos para registrar una cuenta.
  final AuthSignUpPayload payload;
  /// Función que mostrará el estado actual de la acción.
  /// Será modificada en el [createAuthMiddleware].
  final Completer<String> completer;

  AuthSignUpAction({
    required this.payload,
    Completer<String>? completer,
  }) : completer = completer ?? Completer<String>();
}

/// Acción cuando se completa el registro de cuenta.
class AuthSignUpSucceededAction {}
