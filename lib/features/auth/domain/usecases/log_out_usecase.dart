import 'package:campus_connect/core/errors/failures.dart';
import 'package:campus_connect/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class LogoutUsecase {
  final AuthRepository authRepository;

  LogoutUsecase(this.authRepository);

  Future<Either<Failure, void>> call() async {
    return await authRepository.logout();
  }
}
