import 'package:flutter/material.dart';

/// Conjunto de colores (Claro y Oscuro) y estilos de texto que se usarán a
/// lo largo de la aplicación.
class MyThemes {
  static const _primaryLightText = Color(0xFF101213);
  static const _secondaryLightText = Color(0xFF57636C);

  static const _lightTextTheme = TextTheme(
    headline1: TextStyle(
      fontSize: 24,
      color: _primaryLightText,
    ),
    headline2: TextStyle(
      fontSize: 22,
      color: _secondaryLightText,
    ),
    headline3: TextStyle(
      fontSize: 20,
      color: _primaryLightText,
    ),
    subtitle1: TextStyle(
      fontSize: 18,
      color: _primaryLightText,
    ),
    subtitle2: TextStyle(
      fontSize: 16,
      color: _secondaryLightText,
    ),
    bodyText1: TextStyle(
      fontSize: 14,
      color: _primaryLightText,
    ),
    bodyText2: TextStyle(
      fontSize: 14,
      color: _secondaryLightText,
    ),
  );

  static const _lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Colors.red,
    onPrimary: Colors.white,
    secondary: Color(0xFF6BA341),
    onSecondary: Colors.black,
    tertiary: Color(0xFF5EA7D7),
    onTertiary: Colors.black,
    error: Color(0xFFFF5963),
    onError: Colors.white,
    background: Color(0xFFF1F4F8),
    onBackground: Colors.black,
    surface: Colors.white,
    onSurface: Color(0xFF4D4D4D),
  );

  /// Tema claro.
  static final lightTheme = ThemeData.from(
    colorScheme: _lightColorScheme,
    textTheme: _lightTextTheme,
  ).copyWith(
    appBarTheme: AppBarTheme(
      color: _lightColorScheme.surface,
      elevation: 0,
      iconTheme: IconThemeData(color: _lightColorScheme.onSurface, size: 19),
      toolbarTextStyle: _lightTextTheme.subtitle2?.copyWith(
        color: _lightColorScheme.onSurface,
      ),
      titleTextStyle: _lightTextTheme.subtitle1?.copyWith(
        color: _lightColorScheme.onSurface,
      ),
    ),
  );

  final TextTheme textTheme = const TextTheme();

  final greyColor = const Color(0xFF95A1AC);

  MyThemes();
}
