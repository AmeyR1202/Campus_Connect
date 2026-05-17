import 'package:drift/drift.dart';

class LocalAttendanceTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get lectureId => text().unique()();
  TextColumn get subjectId => text()();
  TextColumn get status => text()();
  DateTimeColumn get markedAt => dateTime()();

  /// checks if newly added/modified data has been synced or not?
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();

  /// This updatedAt is created for last write wins
  /// Let's say a user updates data from two different devices
  /// I want the last write to win in case of conflict
  DateTimeColumn get updatedAt => dateTime()();
}
