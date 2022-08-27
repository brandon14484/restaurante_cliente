import '../api-client/api_client.dart';
import '../api-client/api_client_factory.dart';
import 'package:meta/meta.dart';

/// Clase general los repositorios que hagan llamadas API.
///
/// Su propiedad [apiClient] solo puede ser accedida por sus hijos
/// (`@protected`), y por defecto, corresponde al [ApiClient] generado
/// por [ApiClientFactory].
class ApiRepository {
  /// Cliente que se comunicará con el Backend
  late ApiClient _apiClient;

  @protected
  ApiClient get apiClient => _apiClient;

  @protected
  set apiClient(ApiClient value) => _apiClient = value;

  /// Establece el cliente según la configuración de [ApiClientFactory]
  ApiRepository(): _apiClient = ApiClientFactory.getClient();
}
