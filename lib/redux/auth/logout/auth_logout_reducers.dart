/// Reducers del estado de cierre de sesión.

import './auth_logout_actions.dart';
import '../auth_state.dart';


/// Reducer cuando se lanza la acción [AuthLogoutAction].
///
/// Este actualiza el estado `isLoadingLogout` a "verdadero", lo que
/// indica que se está cerrando la sesión.
AuthState authLogoutReducer(AuthState state, AuthLogoutAction action) {
  return AuthState(
    currentUser: state.currentUser,
    isLoadingAuthentication: false,
    isLoadingLogout: true,
    isLoadingSignUp: false,
  );
}

/// Reducer cuando se lanza la acción [AuthLogoutSucceededAction].
///
/// Este actualiza el estado `isLoadingAuthentication` a "falso", lo que
/// indica que se terminó el proceso de cierre de sesión.
///
/// Además, elimina el `currentUser`.
AuthState authLogoutSucceededReducer(
  AuthState state,
  AuthLogoutSucceededAction action,
) {
  return AuthState(
    currentUser: null,
    isLoadingAuthentication: false,
    isLoadingLogout: false,
    isLoadingSignUp: false,
  );
}

/// Reducer cuando se lanza la acción [AuthLogoutFailedAction].
///
/// Este actualiza el estado `isLoadingAuthentication` a "falso", lo que
/// indica que se terminó el proceso de cierre de sesión.
AuthState authLogoutFailedReducer(
  AuthState state,
  AuthLogoutFailedAction action,
) {
  return AuthState(
    currentUser: state.currentUser,
    isLoadingAuthentication: false,
    isLoadingLogout: false,
    isLoadingSignUp: false,
  );
}
