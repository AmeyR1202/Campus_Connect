import 'package:campus_connect/features/auth/domain/entities/user_entity.dart';
import 'package:campus_connect/features/auth/domain/repository/auth_repository.dart';

class GetCurrentUserUsecase {
  final AuthRepository authRepository;

  GetCurrentUserUsecase(this.authRepository);

  Future<UserEntity?> call() {
    return authRepository.getCurrentUser();
  }
}
