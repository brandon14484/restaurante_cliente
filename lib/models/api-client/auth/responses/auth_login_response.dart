import '../../api_model.dart';

/// Respuesta que se obtendra al iniciar sesión.
class AuthLoginResponse implements ApiModel {
  /// Token que presenta la sesión del usuario.
  final String token;

  AuthLoginResponse({required this.token});

  AuthLoginResponse.fromJson(Map<String, dynamic> json) : token = json['token'];
}
