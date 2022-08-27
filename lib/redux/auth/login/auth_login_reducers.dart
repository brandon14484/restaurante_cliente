/// Reducers del estado de inicio de sesión.

import './auth_login_actions.dart';
import '../auth_state.dart';

/// Reducer cuando se lanza la acción [AuthLoginAction].
///
/// Este actualiza el estado `AuthState` a "verdadero", lo que
/// indica que se está iniciando la sesión.
AuthState authLoginReducer(AuthState state, AuthLoginAction action) {
  return AuthState(
    currentUser: state.currentUser,
    isLoadingAuthentication: true,
    isLoadingLogout: false,
    isLoadingSignUp: false,
  );
}

/// Reducer cuando se lanza la acción [AuthLoginSucceededAction].
///
/// Este actualiza el estado `isLoadingAuthentication` a "falso", lo que
/// indica que se terminó el inicio de sesión.
///
/// Además, actualiza el estado del `currentUser` al usuario obtenido.
AuthState authLoginSucceededReducer(
  AuthState state,
  AuthLoginSucceededAction action,
) {
  return AuthState(
    currentUser: action.user,
    isLoadingAuthentication: false,
    isLoadingLogout: false,
    isLoadingSignUp: false,
  );
}
