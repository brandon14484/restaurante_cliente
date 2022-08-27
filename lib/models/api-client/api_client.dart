import './auth/auth_api_client.dart';

/// Conjunto de funciones que consumirán la API.
abstract class ApiClient {
  final AuthApiClient auth;

  // Constructor
  const ApiClient({required this.auth});
}
