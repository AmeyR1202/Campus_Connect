import 'package:campus_connect/features/auth/domain/entities/user_entity.dart';
import 'package:campus_connect/features/auth/domain/repository/auth_repository.dart';

class LoginUsecase {
  final AuthRepository authRepository;

  LoginUsecase(this.authRepository);

  Future<UserEntity> call({required String email, required String password}) {
    return authRepository.login(email: email, password: password);
  }
}
