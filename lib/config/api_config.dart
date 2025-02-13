import '../app/const/const.dart';
import 'dio_config.dart';

/// Wrapper for Authenticated and Open API configurations.
class ApiConfig {
  final String _token;

  ApiConfig({required String token}) : _token = token;

  Auth get auth => Auth(baseUrl: authBaseUrl, token: _token);
  Open get open => Open(baseUrl: openBaseUrl);
}

/// API configuration for Open API requests (without authentication).
class Open extends RequestConfig {
  final String _baseUrl;
  late final String _token;

  Open({required String baseUrl, String token = ''}) : _baseUrl = baseUrl{_token = token;}

  @override
  String authorizationToken() => 'Bearer $_token';

  @override
  String baseURL() => _baseUrl;
}

/// API configuration for Authenticated API requests.
class Auth extends RequestConfig {
  final String _baseUrl;
  final String _token;

  Auth({required String baseUrl, required String token}) : _token = token, _baseUrl = baseUrl;

  @override
  String authorizationToken() => 'Bearer $_token';

  @override
  String baseURL() => _baseUrl;
}
