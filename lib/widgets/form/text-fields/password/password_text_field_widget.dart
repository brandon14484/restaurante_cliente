/// Campo de contraseña.
///
/// Permite reutilizar un campo con texto oculto y con el estado
/// "mostrar contraseña".
import 'package:flutter/material.dart';
import '../../../../theme/my_colors.dart';
import '../../../ui/ui.dart' show UiTextFormWidget;

class PasswordTextFieldWidget extends StatefulWidget {
  /// Función que se ejecuta cuando se valida un el campo en un formulario.
  final FormFieldValidator<String>? validator;
  /// Controlador para obtener el contenido del campo.
  final TextEditingController? controller;
  /// Texto que explica para qué es el campo.
  final String labelText;
  /// Texto que se mostrará cuando el campo de texto esté vacio.
  final String hintText;

  const PasswordTextFieldWidget({
    super.key,
    this.validator,
    this.controller,
    this.labelText = "Contraseña",
    this.hintText = "Ingresa tu contraseña...",
  });

  @override
  PasswordTextFieldWidgetState createState() => PasswordTextFieldWidgetState();
}

class PasswordTextFieldWidgetState extends State<PasswordTextFieldWidget> {
  /// Estado para mostrar la contraseña. Por defecto será **false**.
  bool passwordVisibility = false;

  @override
  Widget build(BuildContext context) {
    return UiTextFormWidget(
      controller: widget.controller,
      validator: widget.validator ?? (value) => _buildDefaultValidation(value),
      labelText: widget.labelText,
      hintText: widget.hintText,
      obscureText: !passwordVisibility,
      enableSuggestions: false,
      autocorrect: false,
      suffixIcon: InkWell(
        onTap: () => setState(
          () => passwordVisibility = !passwordVisibility,
        ),
        focusNode: FocusNode(skipTraversal: true),
        child: Icon(
          passwordVisibility
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          color: MyColors.lightGrey,
          size: 22,
        ),
      ),
    );
  }

  /// Validación por defecto que aparecerá si no se ingresó otra validación en
  /// el [widget].
  ///
  /// Solo verifica que el campo no esté vacío.
  _buildDefaultValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingresa tu contraseña';
    }
    return null;
  }
}
