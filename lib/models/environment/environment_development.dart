import './environment.dart';

/// Configuración de ambiente de desarrollo.
class EnvironmentDevelopment extends Environment {
  static const String envName = "development";
  static const String port = "8000";

  static const Environment configAndroid = EnvironmentDevelopment(
    backendURL: "10.0.2.2:$port",
    env: envName,
  );

  static const Environment config = EnvironmentDevelopment(
    backendURL: "localhost:$port",
    env: envName,
  );

  const EnvironmentDevelopment({
    required backendURL,
    required env,
  }) : super(
          backendURL: backendURL,
          env: env,
        );
}
