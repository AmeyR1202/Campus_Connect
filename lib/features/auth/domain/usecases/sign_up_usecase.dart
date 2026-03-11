import 'package:campus_connect/features/auth/domain/repository/auth_repository.dart';

class SignupUsecase {
  final AuthRepository authRepository;

  SignupUsecase(this.authRepository);

  Future<void> call({
    required String username,
    required String email,
    required String password,
  }) {
    return authRepository.signUp(
      username: username,
      email: email,
      password: password,
    );
  }
}
