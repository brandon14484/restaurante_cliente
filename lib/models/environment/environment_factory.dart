import 'package:flutter/foundation.dart';
import './environment.dart';
import './environment_development.dart';
import './environment_production.dart';

/// Retorna distintos [Environment] dependiendo del ambiente, mediante la
/// función estática [getConfiguration].
class EnvironmentFactory {
  /// Obtiene distintos [Environment] dependiento del ambiente y la plataforma
  /// que lo esté utilizando.
  ///
  /// Si el ambiente es "Producción" entonces retorna
  /// [EnvironmentProduction.config].
  ///
  /// Si el ambiente está en desarrollo y la plataforma es "Android", retorna
  /// [EnvironmentDevelopment.configAndroid].
  ///
  /// Si el ambiente está en desarrollo y la plataforma **no** es "Android",
  /// retorna [EnvironmentDevelopment.config]
  static Environment getConfiguration() {
    // Debería también tener un LINK productivo usando EnvironmentProduction,
    // pero en esta app no se usará.

    if (defaultTargetPlatform == TargetPlatform.android) {
      return EnvironmentDevelopment.configAndroid;
    }

    return EnvironmentDevelopment.config;
  }
}
