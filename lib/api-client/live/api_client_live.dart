import 'package:restaurante_cliente/api-client/live/table/tables_api_client_live.dart';

import './auth/auth_api_client_live.dart';
import '../../models/api-client/api_client.dart';

/// [ApiClient] que en modo Live que se comunicará con el Backend
class ApiClientLive extends ApiClient {
  // Establecimiento de propiedades de ApiClientLive
  static const ApiClient apiClientLive = ApiClientLive(
    auth: AuthApiClientLive.authApiClientLive,
    table: TablesApiClientLive.tablesApiClientLive
  );

  const ApiClientLive({required auth, required table}) : super(auth: auth, table: table);
}
