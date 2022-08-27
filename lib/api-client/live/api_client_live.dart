import './auth/auth_api_client_live.dart';
import '../../models/api-client/api_client.dart';

/// [ApiClient] que en modo Live que se comunicará con el Backend
class ApiClientLive extends ApiClient {
  // Establecimiento de propiedades de ApiClientLive
  static const ApiClient apiClientLive = ApiClientLive(
    auth: AuthApiClientLive.authApiClientLive,
  );

  const ApiClientLive({required auth}) : super(auth: auth);
}
