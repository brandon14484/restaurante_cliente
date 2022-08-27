/// Servicio que modifica un RUT chileno.
class RUTService {
  /// Formatea un RUT con puntos y guiones.
  static String format(String rut) {
    String cleanRUT = cleanUpper(rut);
    return cleanRUT.length <= 8
        ? shortVersionFormat(cleanRUT)
        : longVersionFormat(cleanRUT);
  }

  /// Elimina los puntos y guiones de un RUT, y transforma la letra "K"
  /// a mayúscula si la tiene.
  static String cleanUpper(String rut){
    return clean(rut).toUpperCase();
  }


  /// Elimina el contenido de un RUT que no sea número ni las letras "K" o "k".
  static String clean(String rut) {
    return rut.replaceAll(RegExp(r'[^0-9Kk]'), '');
  }

  /// Agrega puntos y guión a un RUT de 8 o menos dígitos.
  static String shortVersionFormat(String input) {
    List<String> output = [];
    Map<int, String> mp = {1: '.', 4: '.', 7: '-'};

    for (int i = 0; i < input.length; i++) {
      if (mp.containsKey(i)) output.add(mp[i]!);
      output.add(input[i]);
    }

    return output.join('');
  }

  /// Agrega puntos y guión a un RUT de 9 dígitos.
  static String longVersionFormat(String text) =>
      '${text[0]}${text[1]}.${text[2]}${text[3]}'
          '${text[4]}.${text[5]}${text[6]}${text[7]}'
          '-${text[8]}';
}
