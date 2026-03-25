import 'package:campus_connect/core/errors/failures.dart';
import 'package:campus_connect/features/attendance/data/datasource/firestore_attendance_datasource.dart';
import 'package:campus_connect/features/attendance/data/models/attendance_model.dart';
import 'package:campus_connect/features/attendance/domain/entities/attendance_entity.dart';
import 'package:campus_connect/features/attendance/domain/repositories/attendance_repository.dart';
import 'package:fpdart/fpdart.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  final FirestoreAttendanceDatasource datasource;

  AttendanceRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, void>> upsertAttendance({
    required String userId,
    required AttendanceEntity entity,
  }) async {
    final model = AttendanceModel.fromEntity(entity);

    return await datasource.upsertAttendance(userId: userId, model: model);
  }

  @override
  Future<Either<Failure, List<AttendanceEntity>>> getAttendance({
    required String userId,
    required String subjectId,
  }) async {
    final result = await datasource.getAttendance(
      userId: userId,
      subjectId: subjectId,
    );

    return result.map((models) => models.map((m) => m.toEntity()).toList());
  }

  @override
  Future<Either<Failure, List<AttendanceEntity>>> getAllAttendance({
    required String userId,
  }) async {
    final result = await datasource.getAllAttendance(userId: userId);

    return result.map((models) => models.map((m) => m.toEntity()).toList());
  }
}
