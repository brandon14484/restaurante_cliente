import './auth_actions.dart';
import './auth_state.dart';
import './login/auth_login_reducers.dart';
import './validate/auth_validate_reducers.dart';
import './logout/auth_logout_reducers.dart';
import 'package:redux/redux.dart';

/// Conjunto de asociación entre `auth_actions` y `auth_reducers` para
/// modificar el estado de autenticación.
Reducer<AuthState> authReducer = combineReducers([
  TypedReducer<AuthState, AuthLoginAction>(authLoginReducer),
  TypedReducer<AuthState, AuthLoginSucceededAction>(
    authLoginSucceededReducer,
  ),
  TypedReducer<AuthState, AuthValidateAction>(authValidateReducer),
  TypedReducer<AuthState, AuthValidateSucceededAction>(
    authValidateSucceededReducer,
  ),
  TypedReducer<AuthState, AuthValidateFailedAction>(authValidateFailedReducer),
  TypedReducer<AuthState, AuthLogoutAction>(authLogoutReducer),
  TypedReducer<AuthState, AuthLogoutSucceededAction>(
    authLogoutSucceededReducer,
  ),
  TypedReducer<AuthState, AuthLogoutFailedAction>(authLogoutFailedReducer),
]);
