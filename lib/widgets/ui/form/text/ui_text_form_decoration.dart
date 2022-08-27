/// Funciones que generan el diseño de un campo de texto.

import 'package:flutter/material.dart';
import '../../../../theme/my_colors.dart';

/// Genera el diseño de un campo de texto.
InputDecoration uiTextFormDecoration({
  required String labelText,
  required String hintText,
  required ThemeData theme,
  Widget? suffixIcon,
}) {
  const lightGrey = MyColors.lightGrey;
  const lightGreyFocused = MyColors.lightGreyFocused;

  return InputDecoration(
    labelText: labelText,
    labelStyle: theme.textTheme.bodyText1?.copyWith(color: lightGrey),
    hintText: hintText,
    hintStyle: theme.textTheme.bodyText1?.copyWith(color: lightGrey),
    enabledBorder: uiTextFormDecorationOutlineBorder(lightGreyFocused),
    focusedBorder: uiTextFormDecorationOutlineBorder(lightGreyFocused),
    filled: true,
    fillColor: Colors.white,
    contentPadding:
        const EdgeInsetsDirectional.only(start: 16, top: 24, bottom: 24),
    suffixIcon: suffixIcon,
    errorBorder:
        uiTextFormDecorationOutlineBorder(theme.colorScheme.errorContainer),
    focusedErrorBorder:
        uiTextFormDecorationOutlineBorder(theme.colorScheme.error),
  );
}

/// Genera el borde de un campo de texto según el [Color] entregado.
uiTextFormDecorationOutlineBorder(Color color) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: color, width: 2),
    borderRadius: BorderRadius.circular(8),
  );
}
