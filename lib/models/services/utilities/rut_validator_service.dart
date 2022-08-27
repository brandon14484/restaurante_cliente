import './rut_service.dart';

/// Servicio que valida un RUT.
class RUTValidatorService {
  static String? isValidWithError(String rut){
    if (isValid(rut)) return null;
    return "RUT no válido.";
  }

  /// Valida RUT en base al cálculo de su dígito verificador.
  static bool isValid(String rut) {
    final String formattedRUT = RUTService.format(rut);
    final List<String> rutElements =
        formattedRUT.split('.').join('').split('-');

    if (rutElements.length != 2) return false;

    final numbers = rutElements[0];
    final dv = rutElements[1];

    final calculatedDV = calculateDvWithModule11(int.parse(numbers));

    if (dv == "k" || dv == "K") return calculatedDV == "0";
    return calculatedDV == dv;
  }

  /// Obtiene el digito verificador del RUT utilizando el
  /// [cálculo de módulo 11](https://es.wikipedia.org/wiki/C%C3%B3digo_de_control).
  static String calculateDvWithModule11(int numbers) {
    String strNumbers = numbers.toString();

    final List<int> factors = [3, 2, 7, 6, 5, 4, 3, 2];
    int indexFactor = factors.length - 1;
    int calc = 0;

    for (int i = strNumbers.length - 1; i >= 0; i--) {
      calc += (factors[indexFactor] * int.parse(strNumbers[i]));
      indexFactor--;
    }
    int result = 11 - (calc % 11);

    return (result == 11 || result == 10) ? '0' : result.toString();
  }
}
