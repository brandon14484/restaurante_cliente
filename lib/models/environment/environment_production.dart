import './environment.dart';

/// Configuración de ambiente en producción.
class EnvironmentProduction extends Environment {
  static const Environment config = EnvironmentProduction(
    backendURL: "sistemas-backend.mph.cl",
    env: "production",
  );

  const EnvironmentProduction({required backendURL, required env})
      : super(backendURL: backendURL, env: env);
}
