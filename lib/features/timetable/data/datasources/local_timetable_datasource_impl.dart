import 'package:campus_connect/core/database/app_database.dart';
import 'package:campus_connect/core/database/daos/timetable_dao.dart';
import 'package:campus_connect/features/timetable/data/datasources/local_timetable_datasource.dart';

class LocalTimetableDatasourceImpl implements LocalTimetableDatasource {
  final TimetableDao dao;

  LocalTimetableDatasourceImpl(this.dao);

  @override
  Future<void> cacheLecture(LocalTimetableTableCompanion lecture) async {
    await dao.insertLecture(lecture);
  }

  @override
  Future<List<LocalTimetableTableData>> getAllLectures() async {
    return await dao.getAllLectures();
  }

  @override
  Future<List<LocalTimetableTableData>> getLecturesForDay(String day) async {
    return await dao.getLecturesForDay(day);
  }

  @override
  Future<List<LocalTimetableTableData>> getUnsyncedLectures() async {
    return await dao.getUnsyncedLectures();
  }

  @override
  Future<void> hardDeleteLecture(String lectureId) async {
    await dao.deleteLectureLocally(lectureId);
  }

  @override
  Future<void> markAsDeleted(String lectureId) async {
    await dao.markAsDeleted(lectureId);
  }

  @override
  Future<void> markAsSynced(String lectureId) async {
    await dao.markAsSynced(lectureId);
  }

  @override
  Future<void> updateLecture(
    String lectureId,
    LocalTimetableTableCompanion lecture,
  ) async {
    await dao.updateLecture(lectureId, lecture);
  }
}
