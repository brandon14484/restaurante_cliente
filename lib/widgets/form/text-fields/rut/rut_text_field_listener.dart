/// Función que inyecta un **listener** en el [TextEditingController].
///
/// Esta función modificará el contenido del RUT y le agregará puntos y guión.
library rut_text_field_listener;

import 'package:flutter/material.dart';
import '../../../../models/services/utilities/rut_service.dart';

rutAddTextFieldListener(TextEditingController rutController) {
  rutController.addListener(() {
    String finalValue = RUTService.format(rutController.text);
    rutController.value = rutController.value.copyWith(
      text: finalValue,
      selection: TextSelection(
        baseOffset: finalValue.length,
        extentOffset: finalValue.length,
      ),
      composing: TextRange.empty,
    );
  });
}
