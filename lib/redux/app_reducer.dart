import './auth/auth_reducer.dart';
import './app_state.dart';

/// Conjunto de asociación entre todas las actions y los reducers para
/// modificar el estado de Redux.
AppState appStateReducer(AppState state, action) => AppState(
  authState: authReducer(state.authState, action),
);
