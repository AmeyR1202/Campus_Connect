import 'package:campus_connect/core/errors/failures.dart';
import 'package:campus_connect/features/profile/domain/repository/profile_repository.dart';
import 'package:fpdart/fpdart.dart';

class UpdateUsernameUsecase {
  final ProfileRepository repository;

  UpdateUsernameUsecase(this.repository);

  Future<Either<Failure, void>> call({
    required String userId,
    required String newUserName,
  }) async {
    return await repository.updateUsername(
      userId: userId,
      newUserName: newUserName,
    );
  }
}
