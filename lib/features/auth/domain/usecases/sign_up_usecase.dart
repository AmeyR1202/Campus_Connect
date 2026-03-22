import 'package:campus_connect/core/errors/failures.dart';
import 'package:campus_connect/features/auth/domain/enums/branch.dart';
import 'package:campus_connect/features/auth/domain/enums/semester.dart';
import 'package:campus_connect/features/auth/domain/enums/year.dart';
import 'package:campus_connect/features/auth/domain/repository/auth_repository.dart';
import 'package:campus_connect/features/auth/domain/validators/email_validator.dart';
import 'package:fpdart/fpdart.dart';

class SignupUsecase {
  final AuthRepository authRepository;

  SignupUsecase(this.authRepository);

  Future<Either<Failure, void>> call({
    required String username,
    required String email,
    required String password,
    required Branch branch,
    required Year year,
    required Semester semester,
  }) async {
    if (!EmailValidator.isValidCollegeEmail(email)) {
      return left(InvalidEmailFailure('Please enter college email id only'));
    }

    return await authRepository.signUp(
      username: username,
      email: email,
      password: password,
      branch: branch,
      year: year,
      semester: semester,
    );
  }
}
