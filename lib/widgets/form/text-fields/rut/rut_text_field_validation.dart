import '../../../../models/services/utilities/rut_validator_service.dart';

/// Valida que un RUT no esté vacio, y sea correcto.
rutTextFieldValidation(String? value) {
  if (value == null || value.isEmpty) return 'Ingresa tu RUT';
  return RUTValidatorService.isValidWithError(value);
}
