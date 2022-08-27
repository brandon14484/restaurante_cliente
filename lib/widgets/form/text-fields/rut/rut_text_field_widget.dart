import 'package:flutter/material.dart';
import './rut_text_field_validation.dart';
import '../../../ui/ui.dart' show UiTextFormWidget;

/// Campo de texto con RUT.
class RutTextFieldWidget extends StatelessWidget {
  /// Función que se ejecuta cuando se valida un el campo en un formulario.
  final FormFieldValidator<String>? validator;
  /// Controlador para obtener el contenido del campo.
  final TextEditingController? controller;
  /// [bool] que valida si debería enfocar este campo apenas esté disponible en
  /// la pantalla. Por defecto es **false**.
  final bool shouldFocus;

  const RutTextFieldWidget({
    super.key,
    this.controller,
    this.validator,
    this.shouldFocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return UiTextFormWidget(
      validator: validator ?? (value) => rutTextFieldValidation(value),
      controller: controller,
      labelText: "RUT",
      hintText: "Ingresa tu RUT...",
      shouldFocus: shouldFocus,
    );
  }
}
