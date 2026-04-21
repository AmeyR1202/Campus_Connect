import 'package:campus_connect/core/errors/app_exception.dart';
import 'package:campus_connect/core/errors/failures.dart';
import 'package:campus_connect/features/profile/data/datasources/profile_datasource.dart';
import 'package:campus_connect/features/profile/domain/repository/profile_repository.dart';
import 'package:fpdart/fpdart.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDatasource datasource;

  ProfileRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, void>> updateUsername({
    required String userId,
    required String newUserName,
  }) async {
    try {
      await datasource.updateUsername(userId: userId, newUserName: newUserName);
      return right(null);
    } on ServerException catch (e) {
      return left(ServerFailure(e.message));
    }
  }
}
