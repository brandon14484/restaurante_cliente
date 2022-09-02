import 'dart:async';
import 'dart:convert';
import '../../../utilities/device/device.dart';
import './payloads/payloads.dart';
import '../api_error_response_exception.dart';
import '../api_response.dart';
import './auth_api_client_urls.dart';
import './responses/auth_login_response.dart';
import '../../backend/users/user.dart';
import '../../http-client/http_client.dart';

/// Conjunto de funciones relacionadas con el estado de autenticación del
/// usuario en el servidor.
abstract class AuthApiClient {
  final AuthApiClientURLs urls;

  // Constructor
  const AuthApiClient({required this.urls});

  /// Inicia sesión y obtiene [AuthLoginResponse] como respuesta.
  ///
  /// Arroja [ApiErrorResponseException] si las credenciales son incorrectas.
  ///
  /// Arroja [TimeoutException] Si la solicitud tarda demasiado en responder.
  Future<ApiResponse<AuthLoginResponse>> login(
      String username, String password) async {
    var deviceName = await Device.getName();
    dynamic requestData = {
      'username': username,
      'password': password,
      'device': deviceName,
    };

    final response = await HttpClient()
        .toBackend()
        .toRoute(urls.login)
        .withMethodPost()
        .withData(requestData)
        .sendJson()
        .receiveJson()
        .call();

    Map<String, dynamic> result = jsonDecode(response.body);

    if (response.statusCode != 200) {
      throw ApiErrorResponseException.responseFromJson(
        result,
        response.statusCode,
      );
    }

    return ApiResponse<AuthLoginResponse>.fromJson(
      json: result,
      converter: (data) => AuthLoginResponse.fromJson(data),
    );
  }

  /// Obtiene datos del usuario.
  ///
  /// Arroja [ApiErrorResponseException] si el token es inválido.
  ///
  /// Arroja [TimeoutException] Si la solicitud tarda demasiado en responder.
  Future<ApiResponse<User>> user() async {
    final response = await HttpClient()
        .toBackend()
        .toRoute(urls.user)
        .withToken()
        .withMethodGet()
        .sendJson()
        .receiveJson()
        .call();

    Map<String, dynamic> result = jsonDecode(response.body);

    if (response.statusCode != 200) {
      throw ApiErrorResponseException.responseFromJson(
        result,
        response.statusCode,
      );
    }

    return ApiResponse<User>.fromJson(
      json: result,
      converter: (data) => User.fromJson(data),
    );
  }

  /// Cierra Sesión.
  Future<ApiResponse> logout() async {
    final response = await HttpClient()
        .toBackend()
        .toRoute(urls.logout)
        .withToken()
        .withMethodPost()
        .sendJson()
        .receiveJson()
        .call();

    Map<String, dynamic> result = jsonDecode(response.body);

    if (response.statusCode != 200) {
      throw ApiErrorResponseException.responseFromJson(
        result,
        response.statusCode,
      );
    }

    return ApiResponse.fromJson(json: result);
  }

  /// Registra cuenta.
  ///
  /// Arroja [ApiErrorResponseException] si el token es inválido.
  ///
  /// Arroja [TimeoutException] Si la solicitud tarda demasiado en responder.
  Future<ApiResponse> signUp(AuthSignUpPayload payload) async {
    final response = await HttpClient()
        .toBackend()
        .toRoute(urls.signUp)
        .withData(payload.toMap())
        .withMethodPost()
        .sendJson()
        .receiveJson()
        .call();

    Map<String, dynamic> result = jsonDecode(response.body);

    if (response.statusCode >= 400) {
      throw ApiErrorResponseException.responseFromJson(
        result,
        response.statusCode,
      );
    }

    return ApiResponse.fromJson(json: result);
  }
}
