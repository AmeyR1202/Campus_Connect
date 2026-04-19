import 'package:campus_connect/core/errors/failures.dart';
import 'package:campus_connect/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class ForgetPasswordUsecase {
  final AuthRepository repository;

  ForgetPasswordUsecase(this.repository);

  Future<Either<Failure, void>> call({required String email}) async {
    return await repository.forgetPassword(email: email);
  }
}
