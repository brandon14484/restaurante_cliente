import 'dart:async';
import './http_client.dart';

/// [TimeoutException] que se lanzará cuando a [HttpClient] se le acabe el tiempo
/// para completar una solicitud.
class HttpTimeoutException extends TimeoutException{
  HttpTimeoutException(String? message) : super(message);

  @override
  String toString() {
    return message ?? "HttpTimeoutException";
  }
}
