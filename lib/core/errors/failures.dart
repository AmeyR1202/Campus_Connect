abstract class Failure {
  final String message;

  const Failure(this.message);
}

class AuthFailure extends Failure {
  const AuthFailure(super.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class InvalidEmailFailure extends Failure {
  const InvalidEmailFailure(super.message);
}
