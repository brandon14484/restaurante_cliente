import 'package:flutter/material.dart';
import './ui_text_form_decoration.dart';
import '../../../../theme/my_colors.dart';

/// Campo de texto con espacio abajo usando [Padding].
class UiTextFormWidget extends StatelessWidget {
  /// Controlador que permite obtener el contenido del texto.
  final TextEditingController? controller;
  /// Texto que explica para qué es el campo.
  final String labelText;
  /// Texto que se mostrará cuando el campo de texto esté vacio.
  final String hintText;
  /// Estado para mostrar el texto (por ejemplo contraseñas).
  final bool obscureText;
  /// Estado para ver si se deben mostrar sugerencias en el teclado cuando
  /// el usuario escribe.
  final bool enableSuggestions;
  final bool autocorrect;
  /// Icono que se mostrará al lado derecho del campo (dentro del mismo).
  final Widget? suffixIcon;
  /// Función para validar el campo, que se ejecuta cuando un formulario valida.
  final FormFieldValidator<String>? validator;
  /// [bool] que valida si debería enfocar este campo apenas esté disponible en
  /// la pantalla. Por defecto es **false**.
  final bool shouldFocus;

  const UiTextFormWidget({
    Key? key,
    this.controller,
    required this.labelText,
    required this.hintText,
    this.obscureText = false,
    this.enableSuggestions = true,
    this.autocorrect = true,
    this.suffixIcon,
    this.validator,
    this.shouldFocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: _buildTextField(theme: theme),
          ),
        ],
      ),
    );
  }


  Widget _buildTextField({required ThemeData theme}) {
    const lightGrey = MyColors.lightGrey;
    return TextFormField(
      autofocus: shouldFocus,
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      decoration: uiTextFormDecoration(
        labelText: labelText,
        hintText: hintText,
        theme: theme,
        suffixIcon: suffixIcon,
      ),
      style: theme.textTheme.bodyText1?.copyWith(color: lightGrey),
      enableSuggestions: enableSuggestions,
      autocorrect: autocorrect,
    );
  }
}
