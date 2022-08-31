import '../api-client/auth/payloads/payloads.dart';
import '../backend/users/user.dart';
import './api_repository.dart';
import './auth_token_repository.dart';

/// Repositorio que permite manejar la sesión del usuario.
class UserRepository extends ApiRepository {
  /// Inicia sesión usando el [username] y [password],
  /// y retorna el usuario como objeto [User].
  Future<User> login({
    required String username,
    required String password,
  }) async {
    // Obtiene TOKEN
    final tokenResponse = await apiClient.auth.login(username, password);
    // Establece TOKEN
    await AuthTokenRepository().saveToken(tokenResponse.data.token);
    // Obtiene datos de usuario
    return getAuthUser();
  }

  /// Obtiene la sesión de usuario mediante el Token local.
  Future<User> getAuthUser() async {
    final userResponse = await apiClient.auth.user();
    return userResponse.data;
  }

  /// Cierra sesión y elimina Token local.
  Future<void> logout() async {
    await apiClient.auth.logout();
    await AuthTokenRepository().deleteToken();
  }

  /// Registra usuario y retorna el mensaje del que da el servidor.
  Future<String> signUp(AuthSignUpPayload payload) async {
    return "Registrado exitosamente. Antes de iniciar sesión valida tu correo electrónico.";
    // Todo registrar en el backend
    final response = await apiClient.auth.signUp(payload);
    return response.message!;
  }
}
