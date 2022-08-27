/// Clase que representa una respuesta general de la API backend.
///
/// Está basada en [una respuesta genérica de API de StackOverflow](https://stackoverflow.com/questions/64595975/dart-flutter-generic-api-response-class-dynamic-class-data-type)
class ApiResponse<T> {
  String? message;
  T data;

  ApiResponse({
    required this.data,
    required this.message,
  });

  ApiResponse.fromJson({
    required Map<String, dynamic> json,
    Function(Map<String, dynamic>)? converter,
  })  : message = json['message'],
        data = (json['data'] != null && converter != null)
            ? converter(json['data'])
            : null;
}
