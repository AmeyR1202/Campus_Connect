abstract class AppException implements Exception {
  final String message;

  const AppException(this.message);
}

class AuthException extends AppException {
  const AuthException(super.message);
}

class ServerException extends AppException {
  const ServerException(super.message);
}
