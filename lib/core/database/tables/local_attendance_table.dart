import 'package:drift/drift.dart';

class LocalAttendanceTable extends Table {
  TextColumn get lectureId => text().unique()();
  TextColumn get subjectId => text()();
  TextColumn get status => text()();
  DateTimeColumn get markedAt => dateTime()();

  // synchronisation flags
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
}
