import '../../../models/api-client/tables/tables_api_client_urls.dart';

/// Endpoints de Autenticación en modo Live.
class TableApiClientUrlsLive extends TablesApiClientUrls {
  // Establecimiento de propiedades de AuthApiClientURLsLive
  static const TablesApiClientUrls tablesApiClientLiveUrlsLive =
      TableApiClientUrlsLive(index: 'api/tables');

  const TableApiClientUrlsLive({
    required String index,
  }) : super(
          index: index,
        );
}
