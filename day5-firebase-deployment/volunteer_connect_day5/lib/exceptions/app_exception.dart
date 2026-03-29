sealed class AppException implements Exception {
  final String message;
  const AppException(this.message);

  @override
  String toString() => message;
}

class NetworkException extends AppException {
  const NetworkException([super.message = 'Network error. Please check your connection.']);
}

class ServerException extends AppException {
  const ServerException([super.message = 'Server error. Please try again later.']);
}

class AuthException extends AppException {
  const AuthException([super.message = 'Authentication failed.']);
}

class ValidationException extends AppException {
  const ValidationException([super.message = 'Validation error.']);
}

class UnknownException extends AppException {
  const UnknownException([super.message = 'An unexpected error occurred.']);
}
