import './auth_api_client_urls_live.dart';
import '../../../models/api-client/auth/auth_api_client.dart';
import '../../../models/api-client/auth/auth_api_client_urls.dart';

/// Cliente de Autenticación en modo Live.
class AuthApiClientLive extends AuthApiClient {
  // Establecimiento de propiedades de AuthApiClientLive
  static const AuthApiClient authApiClientLive = AuthApiClientLive(
    urls: AuthApiClientURLsLive.authApiClientLiveURLSLive,
  );

  // Constructor
  const AuthApiClientLive({required AuthApiClientURLs urls}) : super(urls: urls);
}
