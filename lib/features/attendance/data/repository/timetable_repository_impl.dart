import 'package:campus_connect/core/errors/failures.dart';
import 'package:campus_connect/features/attendance/data/datasource/firestore_timetable_datasource.dart';
import 'package:campus_connect/features/attendance/data/models/lecture_model.dart';
import 'package:campus_connect/features/attendance/domain/entities/lecture_entity.dart';
import 'package:campus_connect/features/attendance/domain/repositories/timetable_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:intl/intl.dart';

class TimetableRepositoryImpl implements TimetableRepository {
  final FirestoreTimetableDatasource datasource;

  TimetableRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, List<LectureEntity>>> getTimetable({
    required String branch,
    required int semester,
  }) async {
    try {
      final List<LectureModel> models = await datasource.getTimetable(
        branch: branch,
        semester: semester,
      );

      final now = DateTime.now();
      final todayDay = DateFormat('EEE').format(now); // Mon, Tue, Wed

      final entities = models
          .where((m) => m.day == todayDay)
          .map((m) => m.toEntity(now))
          .toList();

      return right(entities);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
