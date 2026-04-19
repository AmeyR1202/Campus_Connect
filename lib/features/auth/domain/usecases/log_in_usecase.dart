import 'package:campus_connect/core/errors/failures.dart';
import 'package:campus_connect/features/auth/domain/entities/user_entity.dart';
import 'package:campus_connect/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class LoginUsecase {
  final AuthRepository authRepository;

  LoginUsecase(this.authRepository);

  Future<Either<Failure, UserEntity>> call({
    required String email,
    required String password,
  }) async {
    return await authRepository.login(email: email, password: password);
  }
}
