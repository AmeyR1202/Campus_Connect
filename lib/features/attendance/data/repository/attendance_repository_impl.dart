import 'package:campus_connect/core/errors/failures.dart';
import 'package:campus_connect/features/attendance/data/datasource/firestore_attendance_datasource.dart';
import 'package:campus_connect/features/attendance/data/models/attendance_model.dart';
import 'package:campus_connect/features/attendance/data/models/subject_base_stats_model.dart';
import 'package:campus_connect/features/attendance/domain/entities/attendance_entity.dart';
import 'package:campus_connect/features/attendance/domain/entities/subject_base_stats_entity.dart';
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

  @override
  Future<Either<Failure, void>> updateLecture({
    required String userId,
    required String lectureId,
    required String subjectId,
    required AttendanceStatus status,
  }) async {
    return await datasource.updateLecture(
      userId: userId,
      lectureId: lectureId,
      subjectId: subjectId,
      status: status,
    );
  }

  @override
  Future<Either<Failure, void>> setBaseStats({
    required String userId,
    required SubjectBaseStatsEntity entity,
  }) async {
    final model = SubjectBaseStatsModel.fromEntity(entity);
    return await datasource.setBaseStats(userId: userId, model: model);
  }

  @override
  Future<Either<Failure, List<SubjectBaseStatsEntity>>> getAllBaseStats({
    required String userId,
  }) async {
    final result = await datasource.getAllBaseStats(userId: userId);

    return result.map((models) => models.map((m) => m.toEntity()).toList());
  }
}
