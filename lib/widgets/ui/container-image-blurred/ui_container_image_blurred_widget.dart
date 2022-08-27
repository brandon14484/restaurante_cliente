import 'dart:ui' show ImageFilter;
import 'package:flutter/material.dart';

/// Contenedor que tiene una imagen opaca/difusa en el fondo.
class UiContainerImageBlurredWidget extends StatelessWidget {
  /// Contenido del contenedor.
  final Widget? child;
  /// Ubicación de la imagen.
  final String imageLocation;
  /// Radio de difusión.
  final double blurRadius;
  /// Nivel de opacidad.
  final bool withOpacity;

  const UiContainerImageBlurredWidget({
    Key? key,
    required this.imageLocation,
    this.blurRadius = 3.0,
    this.child,
    this.withOpacity = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: !withOpacity
              ? null
              : ColorFilter.mode(
                  Colors.black.withOpacity(0.2),
                  BlendMode.srcOver,
                ),
          fit: BoxFit.cover,
          image: Image.asset(imageLocation).image,
        ),
        shape: BoxShape.rectangle,
      ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blurRadius, sigmaY: blurRadius),
          child: child,
        ),
      ),
    );
  }
}
