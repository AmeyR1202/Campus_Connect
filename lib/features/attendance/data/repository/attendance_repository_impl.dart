import 'package:campus_connect/core/errors/failures.dart';
import 'package:campus_connect/features/attendance/data/datasource/firestore_attendance_datasource.dart';
import 'package:campus_connect/features/attendance/data/models/attendance_model.dart';
import 'package:campus_connect/features/attendance/domain/entities/attendance_entity.dart';
import 'package:campus_connect/features/attendance/domain/entities/stats_entity.dart';
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
  Future<Either<Failure, StatsEntity>> getStats({
    required String userId,
    required String subjectId,
  }) async {
    final result = await getAttendance(userId: userId, subjectId: subjectId);

    return result.map((attendanceList) {
      final validAttendance = attendanceList
          .where((a) => a.status != AttendanceStatus.cancelled)
          .toList();

      final totalClasses = validAttendance.length;

      final attendedClasses = validAttendance
          .where((a) => a.status == AttendanceStatus.present)
          .length;

      final percentage = totalClasses == 0
          ? 0.0
          : double.parse(
              ((attendedClasses / totalClasses) * 100).toStringAsFixed(2),
            );

      const requiredPercentage = 0.75;

      int canBunk = ((attendedClasses / requiredPercentage) - totalClasses)
          .floor();
      if (canBunk < 0) canBunk = 0;

      int mustAttend = 0;

      if (percentage < 75) {
        mustAttend =
            ((requiredPercentage * totalClasses - attendedClasses) /
                    (1 - requiredPercentage))
                .ceil();
      }

      return StatsEntity(
        totalClasses: totalClasses,
        attendedClasses: attendedClasses,
        percentage: percentage,
        canBunk: canBunk,
        mustAttend: mustAttend,
      );
    });
  }
}
