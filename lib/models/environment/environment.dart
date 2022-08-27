import './environment_factory.dart';

/// Define todas las propiedades de la configuración establecida en la página.
///
/// Para utilizarlo se debe llamar a [EnvironmentFactory.getConfiguration]
abstract class Environment {
  final String env;
  final String backendURL;

  const Environment({
    required this.env,
    required this.backendURL,
  });
}
