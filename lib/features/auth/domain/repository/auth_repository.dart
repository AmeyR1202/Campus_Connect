import 'package:campus_connect/core/entities/user_entity.dart';
import 'package:campus_connect/core/errors/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> signUp({
    required String username,
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity?>> getCurrentUser();

  Future<Either<Failure, void>> forgetPassword({required String email});

  Future<Either<Failure, void>> logout();
}
