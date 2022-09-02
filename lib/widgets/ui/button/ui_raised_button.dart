import 'package:flutter/material.dart';

/// Botón con sombra que hace parecer que está levantado.
///
/// Usa el esquema de [Color] primario definido en el [ColorScheme] del [Theme].
class UiRaisedButton extends StatelessWidget {
  /// Texto que mostrará el botón. Solo debería usarse si
  /// [customChild] es `null`.
  final String? text;
  /// Componente que debería mostrarse en el botón. Solo debería usarse si
  /// [text] es `null`.
  final Widget? customChild;
  /// Acción que se ejecuta cuando se presiona el botón.
  final Function onPressed;

  final Color? color;
  final Color? textColor;

  const UiRaisedButton({
    super.key,
    this.text,
    this.customChild,
    required this.onPressed,
    this.color,
    this.textColor,
  }) : assert(text != null || customChild != null);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(130, 50),
        primary: color ?? theme.colorScheme.primary,
        surfaceTintColor: color ?? theme.colorScheme.primary,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(
            color: Colors.transparent,
            width: 1,
          ),
        ),
      ),
      child: text != null
          ? Text(
              text!,
              style: theme.textTheme.subtitle2?.copyWith(
                color: textColor ?? theme.colorScheme.onPrimary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )
          : customChild,
    );
  }
}
