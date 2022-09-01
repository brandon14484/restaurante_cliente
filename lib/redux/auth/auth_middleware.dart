/// Funciones que se activan cuando se llaman las acciones de autenticación.

import 'package:flutter/material.dart';
import '../../screens/home/home_screen.dart';
import '../../models/repositories/repositories.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import '../app_state.dart';
import '../../screens/login/login_screen.dart';
import './auth_actions.dart';

/// Listado que asocia las funciones que se llamarán con las primeras acciones
/// de autenticación.
List<Middleware<AppState>> createAuthMiddleware() {
  return [
    TypedMiddleware<AppState, AuthValidateAction>(_authValidate()),
    TypedMiddleware<AppState, AuthLoginAction>(_authLogin()),
    TypedMiddleware<AppState, AuthLogoutAction>(_authLogout()),
    TypedMiddleware<AppState, AuthSignUpAction>(_authSignUp()),
  ];
}

/// Función que trata de obtener la sesión de usuario mediante el Token local
/// cuando se lanza la acción [AuthValidateAction].
///
/// Si logra obtener el usuario lanzará la acción [AuthValidateSucceededAction].
/// Si no, lanzará [AuthValidateFailedAction].
void Function(
  Store<AppState> store,
  AuthValidateAction action,
  NextDispatcher next,
) _authValidate() {
  return (store, action, next) async {
    next(action);

    try {
      final user = await UserRepository().getAuthUser();

      debugPrint("Usuario autenticado: ${user.rut}");
      store.dispatch(AuthValidateSucceededAction(user: user));
      debugPrint("TODO - Navigate to HomeScreen");
      // store.dispatch(NavigateToAction.push(HomeScreen.routeName));
    } catch (e) {
      debugPrint("Error autenticando usuario ${e.toString()}");

      store.dispatch(AuthValidateFailedAction(e as Exception));
      store.dispatch(NavigateToAction.replace(LoginScreen.routeName));
    }
  };
}

/// Función que trata de iniciar la sesión de usuario mediante los datos
/// entregados. Se ejecuta cuando se lanza la acción [AuthLoginAction].
///
/// Si logra obtener el usuario lanzará la acción [AuthLoginSucceededAction], y
/// actualiza [AuthLoginAction.completer] a completado.
/// Si no, actualizará [AuthLoginAction.completer] como completado con Error.
void Function(
  Store<AppState> store,
  AuthLoginAction action,
  NextDispatcher next,
) _authLogin() {
  return (store, action, next) async {
    next(action);

    try {
      final user = await UserRepository().login(
        username: action.rut,
        password: action.password,
      );

      debugPrint("Usuario autenticado: ${user.rut}");

      store.dispatch(AuthLoginSucceededAction(user: user));
      store.dispatch(NavigateToAction.replace(HomeScreen.routeName));
      action.completer.complete();
    } catch (e) {
      debugPrint("Error autenticando usuario ${e.toString()}");
      action.completer.completeError(e);
    }
  };
}

/// Función que trata de cerrar la sesión actual del usuario cuando se lanza
/// la acción [AuthLogoutAction].
///
/// Si logra cerrar la sesión, lanzará la acción [AuthLogoutSucceededAction].
/// Si no, lanzará [AuthLogoutFailedAction].
void Function(
    Store<AppState> store,
    AuthLogoutAction action,
    NextDispatcher next,
    ) _authLogout() {
  return (store, action, next) async {
    next(action);
    try {
      // await UserRepository().logout(); // TODO Habilitar
      store.dispatch(AuthLogoutSucceededAction());
      store.dispatch(NavigateToAction.replace(LoginScreen.routeName));
    } catch (e) {
      store.dispatch(AuthLogoutFailedAction(e as Exception));
      debugPrint("Error cerrando sesión ${e.toString()}");
    }
  };
}

/// Función que trata de registrar una cuenta mediante los datos
/// entregados. Se ejecuta cuando se lanza la acción [AuthSignUpAction].
///
/// Si logra registrar una cuenta, lanzará la acción [AuthLoginSucceededAction],
/// y actualiza [AuthSignUpAction.completer] a completado.
/// Si no, actualizará [AuthSignUpAction.completer] como completado con Error.
void Function(
    Store<AppState> store,
    AuthSignUpAction action,
    NextDispatcher next,
    ) _authSignUp()  {
  return (store, action, next) async {
    next(action);
    try {
      final message = await UserRepository().signUp(action.payload);
      store.dispatch(AuthSignUpSucceededAction());
      store.dispatch(NavigateToAction.replace(LoginScreen.routeName));
      action.completer.complete(message);
    } catch (e) {
      debugPrint("Error autenticando usuario ${e.toString()}");
      action.completer.completeError(e);
    }
  };
}
