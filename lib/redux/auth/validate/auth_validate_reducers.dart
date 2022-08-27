/// Reducers del estado de validación de una cuenta.

import './auth_validate_actions.dart';
import '../auth_state.dart';

/// Reducer cuando se lanza la acción [AuthValidateAction].
///
/// Este actualiza el estado `isLoadingAuthentication` a "verdadero", lo que
/// indica que está intentando iniciar sesión.
AuthState authValidateReducer(AuthState state, AuthValidateAction action) {
  return AuthState(
    currentUser: state.currentUser,
    isLoadingAuthentication: true,
    isLoadingLogout: false,
    isLoadingSignUp: false,
  );
}

/// Reducer cuando se lanza la acción [AuthValidateSucceededAction].
///
/// Este actualiza el estado `isLoadingAuthentication` a "falso", lo que
/// indica que se completó el inicio de sesión correctamente.
///
/// Además, actualiza el estado del `currentUser` al usuario obtenido.
AuthState authValidateSucceededReducer(AuthState state, AuthValidateSucceededAction action) {
  return AuthState(
    currentUser: action.user,
    isLoadingAuthentication: false,
    isLoadingLogout: false,
    isLoadingSignUp: false,
  );
}

/// Reducer cuando se lanza la acción [AuthValidateFailedAction].
///
/// Este actualiza el estado `isLoadingAuthentication` a "falso", lo que
/// no se logró iniciar sesión.
AuthState authValidateFailedReducer(AuthState state, AuthValidateFailedAction action) {
  return AuthState(
    currentUser: null,
    isLoadingAuthentication: false,
    isLoadingLogout: false,
    isLoadingSignUp: false,
  );
}

