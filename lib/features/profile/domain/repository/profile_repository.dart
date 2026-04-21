import 'package:campus_connect/core/errors/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract class ProfileRepository {
  Future<Either<Failure, void>> updateUsername({
    required String userId,
    required String newUserName,
  });
}
