import 'package:drift/drift.dart';

class LocalTimetableTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get lectureId => text().unique()();
  TextColumn get subjectName => text()();
  TextColumn get day => text()();
  TextColumn get startTime => text()();
  TextColumn get endTime => text()();
  TextColumn get type => text()();

  /// checks if newly added/modified data has been synced or not?
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();

  /// This updatedAt is created for last write wins
  /// Let's say a user updates data from two different devices
  /// I want the last write to win in case of conflict
  DateTimeColumn get updatedAt => dateTime()();
}


/// day, startTime and endTime are acceptable
/// BUT not ideal long-term.
/// 

/// <---------Future Problems----------->
/// sorting lectures
/// clash detection
// timetable overlap detection
// free-slot calculations
// timezone handling
// filtering
// SQL comparisons