/// Clase abstracta que representa a los modelos del Backend.
///
/// Los que la heredan deben implementar la función [ApiModel.fromJson] para
/// transformar un objeto JSON (un **Map** en Dart) en la Clase.
abstract class ApiModel {
  ApiModel.fromJson(
    Map<String, dynamic> json,
  );
}
