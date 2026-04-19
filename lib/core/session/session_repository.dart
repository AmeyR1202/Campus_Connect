import 'package:campus_connect/core/errors/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract class SessionRepository {
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, void>> sendPasswordResetEmail({required String email});
}
