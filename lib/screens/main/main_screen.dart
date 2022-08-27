import 'package:flutter/material.dart';

/// Pantalla incial al cargar la aplicación.
/// Muestra un [CircularProgressIndicator] hasta que la aplicación rediriga al
/// usuario a otra pantalla.
class MainScreen extends StatelessWidget {
  static const routeName = '/';

  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Container(
        color: colorScheme.background,
        child: Center(
          child: CircularProgressIndicator(
            color: colorScheme.onBackground,
          ),
        ),
      ),
    );
  }
}
