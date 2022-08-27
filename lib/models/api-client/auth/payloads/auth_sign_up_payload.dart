import '../../api_payload.dart';

/// Datos requeridos para registrarse como usuario.
class AuthSignUpPayload extends ApiPayload {
  final String rut;
  final String firstName;
  final String middleName;
  final String lastName;
  final String motherLastName;
  final int townId;
  final String email;
  final String password;

  AuthSignUpPayload({
    required this.rut,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.motherLastName,
    required this.townId,
    required this.email,
    required this.password,
  });

  @override
  Map<String, String> toMap() {
    // Todo
    throw UnimplementedError();
  }
}
