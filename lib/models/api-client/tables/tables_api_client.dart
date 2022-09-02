import 'dart:convert';

import 'package:restaurante_cliente/models/api-client/api_error_response_exception.dart';
import 'package:restaurante_cliente/models/api-client/api_response.dart';
import 'package:restaurante_cliente/models/api-client/tables/responses/tables_index_response.dart';
import 'package:restaurante_cliente/models/api-client/tables/tables_api_client_urls.dart';
import 'package:restaurante_cliente/models/http-client/http_client.dart';

abstract class TablesApiClient {
  final TablesApiClientUrls urls;

  // Constructor
  const TablesApiClient({required this.urls});

  Future<ApiResponse<TablesIndexResponse>> index() async {
    final response = await HttpClient()
        .toBackend()
        .toRoute(urls.index)
        .withToken()
        .withMethodGet()
        .sendJson()
        .receiveJson()
        .call();

    Map<String, dynamic> result = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return ApiResponse<TablesIndexResponse>.fromJson(
        json: result,
        converter: (data) => TablesIndexResponse.fromJson(data),
      );
    }

    throw ApiErrorResponseException.responseFromJson(
      result,
      response.statusCode,
    );
  }
}