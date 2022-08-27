/// Clase abstracta que representa los datos a enviar en una solicitud HTTP.
///
/// Cada clase que la herede debe implementar la función [toMap] que transforma
/// las propiedades de la clase en un [Map<String, String>].
abstract class ApiPayload{
  Map<String, String> toMap();
}