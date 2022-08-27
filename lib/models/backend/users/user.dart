import '../../api-client/api_model.dart';

/// Recurso que representa los usuarios
class User implements ApiModel {
  /// RUT sin puntos ni guión, y con K mayúscula si la tiene.
  final String? rut;
  /// RUT con puntos y guión, y con K mayúscula si la tiene.
  final String? rutFormatted;
  /// Primer nombre.
  final String firstName;
  /// Segundo nombre.
  final String? middleName;
  /// Apellido paterno.
  final String? lastName;
  /// Apellido materno.
  final String? motherLastName;
  /// Nombre completo separado por espacios.
  final String fullName;
  /// Correo electrónico.
  final String? email;
  /// Número de celular.
  final int? phone;
  /// Número de teléfono.
  final int? landlineNumber;

  User({
    this.rut,
    this.rutFormatted,
    required this.firstName,
    this.middleName,
    this.lastName,
    this.motherLastName,
    required this.fullName,
    this.email,
    this.phone,
    this.landlineNumber,
  });

  User.fromJson(Map<String, dynamic> json)
      : rut = json['rut'],
        rutFormatted = json['rut_formatted'],
        firstName = json['first_name'],
        middleName = json['middle_name'],
        lastName = json['last_name'],
        motherLastName = json['mother_last_name'],
        fullName = json['full_name'],
        email = json['email'],
        phone = json['phone'],
        landlineNumber = json['landline_number'];

  static List<User> fromJsonList(List<dynamic> jsonList) {
    List<User> objects = [];
    for (var json in jsonList) {
      objects.add(User.fromJson(json));
    }
    return objects;
  }

  @override
  String toString() {
    return 'User{rut: $rutFormatted, nombre: $fullName}';
  }
}
