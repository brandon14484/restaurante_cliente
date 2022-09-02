import 'package:restaurante_cliente/models/api-client/tables/tables_api_client.dart';

import './auth/auth_api_client.dart';

/// Conjunto de funciones que consumirán la API.
abstract class ApiClient {
  final AuthApiClient auth;
  final TablesApiClient table;

  // Constructor
  const ApiClient({required this.auth, required this.table});
}
