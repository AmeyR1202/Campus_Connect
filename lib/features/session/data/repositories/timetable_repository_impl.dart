import 'package:campus_connect/core/errors/app_exception.dart';
import 'package:campus_connect/core/errors/failures.dart';
import 'package:campus_connect/features/session/data/datasources/firestore_timetable_datasource.dart';
import 'package:campus_connect/features/session/domain/entities/session_entity.dart';
import 'package:campus_connect/features/session/domain/repositories/timetable_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:intl/intl.dart';

class TimetableRepositoryImpl implements TimetableRepository {
  final FirestoreTimetableDatasource datasource;

  TimetableRepositoryImpl({required this.datasource});

  Map<String, dynamic> _entityToMap(SessionEntity session) => {
    'subjectName': session.subjectName,
    'day': session.day,
    'startTime': session.startTime,
    'endTime': session.endTime,
    'colorHex': session.colorHex,
    'type': session.type,
  };

  @override
  Future<Either<Failure, List<SessionEntity>>> getSessionsForDay({
    required String uid,
    required DateTime date,
  }) async {
    try {
      final allModels = await datasource.getSessions(uid);
      final dayName = DateFormat('EEE').format(date); // "Mon", "Tue", …

      final entities =
          allModels
              .where((m) => m.day == dayName)
              .map((m) => m.toEntity(date))
              .toList()
            ..sort((a, b) => a.startTime.compareTo(b.startTime));

      return right(entities);
    } on ServerException catch (e) {
      return left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> addSession({
    required String uid,
    required SessionEntity session,
  }) async {
    try {
      await datasource.addSession(uid, _entityToMap(session));
      return right(null);
    } on ServerException catch (e) {
      return left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> updateSession({
    required String uid,
    required SessionEntity session,
  }) async {
    try {
      await datasource.updateSession(
        uid,
        session.sessionId,
        _entityToMap(session),
      );
      return right(null);
    } on ServerException catch (e) {
      return left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> deleteSession({
    required String uid,
    required String sessionId,
  }) async {
    try {
      await datasource.deleteSession(uid, sessionId);
      return right(null);
    } on ServerException catch (e) {
      return left(ServerFailure(e.message));
    }
  }
}
