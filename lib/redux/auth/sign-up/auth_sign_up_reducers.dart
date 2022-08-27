/// Reducers del estado de registro de cuenta.

import './auth_sign_up_actions.dart';
import '../auth_state.dart';

/// Reducer cuando se lanza la acción [AuthSignUpAction].
///
/// Este actualiza el estado `isLoadingSignUp` a "verdadero", lo que
/// indica que se registrando la cuenta.
AuthState authSignUpReducer(AuthState state, AuthSignUpAction action) {
  return AuthState(
    currentUser: state.currentUser,
    isLoadingAuthentication: false,
    isLoadingLogout: false,
    isLoadingSignUp: true,
  );
}

/// Reducer cuando se lanza la acción [AuthSignUpSucceededAction].
///
/// Este actualiza el estado `isLoadingSignUp` a "falso", lo que
/// indica que se terminó el registro de cuenta.
AuthState authSignUpSucceededReducer(
  AuthState state,
  AuthSignUpSucceededAction action,
) {
  return AuthState(
    currentUser: state.currentUser,
    isLoadingAuthentication: false,
    isLoadingLogout: false,
    isLoadingSignUp: false,
  );
}
