import 'package:campus_connect/core/errors/failures.dart';
import 'package:campus_connect/features/auth/domain/entities/user_entity.dart';
import 'package:campus_connect/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetCurrentUserUsecase {
  final AuthRepository authRepository;

  GetCurrentUserUsecase(this.authRepository);

  Future<Either<Failure, UserEntity?>> call() async {
    return await authRepository.getCurrentUser();
  }
}
