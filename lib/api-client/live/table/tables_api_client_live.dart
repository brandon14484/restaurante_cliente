import 'package:restaurante_cliente/api-client/live/table/tables_api_client_urls_live.dart';
import 'package:restaurante_cliente/models/api-client/tables/tables_api_client.dart';
import 'package:restaurante_cliente/models/api-client/tables/tables_api_client_urls.dart';

/// Cliente de Autenticación en modo Live.
class TablesApiClientLive extends TablesApiClient {
  // Establecimiento de propiedades de AuthApiClientLive
  static const TablesApiClient tablesApiClientLive = TablesApiClientLive(
    urls: TableApiClientUrlsLive.tablesApiClientLiveUrlsLive,
  );

  // Constructor
  const TablesApiClientLive({required TablesApiClientUrls urls}) : super(urls: urls);
}
