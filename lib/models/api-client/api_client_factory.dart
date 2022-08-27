import '../../api-client/live/api_client_live.dart';
import './api_client.dart';

/// Retorna distintos [ApiClient] dependiendo del ambiente, mediante la función
/// estática [getClient]
class ApiClientFactory{
  static ApiClient getClient() {
    return ApiClientFactory._buildLiveClient();
    // TODO Debería llamar una versión de desarrollo también
  }

  /// Retorna Cliente en producción [ApiClientLive].
  static ApiClient _buildLiveClient() {
    return ApiClientLive.apiClientLive;
  }
}