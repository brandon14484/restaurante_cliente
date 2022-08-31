import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import '../environment/environment_factory.dart';
import '../http-client/http_methods.dart';
import 'package:http/http.dart' as http;
import '../http-client/http_timeout_exception.dart';
import '../repositories/auth_token_repository.dart';

/// Clase HTTP que se comunica con servicios externos.
///
/// Está construida para llamar sus propias funciones en modo cascada.
///
/// Ejemplo:
///   ```dart
///   var result = await HttpClient
///     .toBaseURL("postman-echo.com")
///     .toRoute("get")
///     .secure()
///     .withMethodGet()
///     .call();
///
///   print(result["url"]); // Imprime "https://postman-echo.com/get"
///   ```
class HttpClient {
  String _baseUrl = "";
  String _route = "";
  dynamic _data = {};
  final Map<String, String> _headers = {};
  bool _isSecure = false;
  HttpMethods _method = HttpMethods.get;
  bool _withToken = false;
  int _timeOutSeconds = 30;
  String _timeOutMessage = "La solicitud tardó demasiado en completarse";

  /// Llama a la URL con los parametros definidos.
  ///
  /// Arroja [TimeoutException] Si la solicitud tarda demasiado.
  Future<http.Response> call() async {
    // Todo: optimizar

    if (_withToken) await setToken();

    debugPrint("Headers: $_headers");
    debugPrint("Contenido de la petición: $_data");
    debugPrint("URL: [$_baseUrl / $_route]");

    bool methodIsGet = _method == HttpMethods.get;
    Map<String, String>? queryData = methodIsGet ? Map.from(_data) : null;

    var uri = _isSecure
        ? Uri.https(_baseUrl, _route, queryData)
        : Uri.http(_baseUrl, _route, queryData);

    var encodedData = jsonEncode(_data);

    Future<http.Response> response;
    switch (_method) {
      case HttpMethods.get:
        response = http.get(uri, headers: _headers);
        break;
      case HttpMethods.post:
        response = http.post(uri, body: encodedData, headers: _headers);
        break;
      case HttpMethods.put:
        response = http.put(uri, body: encodedData, headers: _headers);
        break;
      case HttpMethods.delete:
        response = http.delete(uri, body: encodedData, headers: _headers);
        break;
    }

    // Asigna limite para obtener la respuesta
    response = response.timeout(
      Duration(seconds: _timeOutSeconds),
      onTimeout: () => throw HttpTimeoutException(_timeOutMessage),
    );

    return response;
  }

  /// Llama al Backend de la aplicación MPH
  HttpClient toBackend() {
    var configuration = EnvironmentFactory.getConfiguration();
    var backendURL = configuration.backendURL;
    toBaseURL(backendURL);

    return this;
  }

  HttpClient toBaseURL(String url) {
    _baseUrl = url;
    return this;
  }

  HttpClient toRoute(String route) {
    _route = route;
    return this;
  }

  /// Establece que la llamada sea bajo el certificado seguro HTTPS
  HttpClient secure() {
    _isSecure = true;
    return this;
  }

  /// Define los datos a enviar
  HttpClient withData(dynamic data) {
    _data = data;
    return this;
  }

  /// Establece que la petición requiere el Token
  HttpClient withToken() {
    _withToken = true;
    return this;
  }

  /// Define el método como GET
  HttpClient withMethodGet() {
    _method = HttpMethods.get;
    return this;
  }

  /// Define el método como POST
  HttpClient withMethodPost() {
    _method = HttpMethods.post;
    return this;
  }

  /// Define el método como DELETE
  HttpClient withMethodDelete() {
    _method = HttpMethods.delete;
    return this;
  }

  /// Define el método como DELETE
  HttpClient withMethodPut() {
    _method = HttpMethods.put;
    return this;
  }

  /// Establece el tipo de llamada y respuesta esperada como JSON
  HttpClient sendJson() {
    headers({
      'Content-Type': 'application/json',
    });
    return this;
  }

  HttpClient receiveJson() {
    headers({
      'Accept': 'application/json',
    });
    return this;
  }

  /// Agrega el Token al header de la llamada
  Future<void> setToken() async {
    final String? token = await AuthTokenRepository().getToken();
    if (token == null) {
      // Todo actualizar por otra excepcion
      throw Exception("No se encontró el Token");
    }

    headers({
      'Authorization': 'Bearer $token',
    });
  }

  /// Establece las cabeceras HTTP
  HttpClient headers(Map<String, String> headers) {
    _headers.addAll(headers);
    return this;
  }

  HttpClient timeOutSeconds(int seconds) {
    _timeOutSeconds = seconds;
    return this;
  }

  HttpClient timeOutMessage(String message) {
    _timeOutMessage = message;
    return this;
  }
}
