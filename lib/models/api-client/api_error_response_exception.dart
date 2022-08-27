import './api_response.dart';

/// [Exception] que se llamará cuando falle la consulta API.
class ApiErrorResponseException implements Exception {
  final int statusCode;
  final ApiResponse response;

  ApiErrorResponseException({
    required this.response,
    required this.statusCode,
  });

  ApiErrorResponseException.responseFromJson(
    Map<String, dynamic> json,
    this.statusCode,
  ) : response = ApiResponse.fromJson(json: json);

  @override
  String toString() {
    return response.message ?? "ApiErrorResponseException";
  }
}
