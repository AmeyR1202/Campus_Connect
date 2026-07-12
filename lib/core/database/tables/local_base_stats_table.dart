import 'package:drift/drift.dart';

@DataClassName('LocalBaseStatsTableData')
class LocalBaseStatsTable extends Table {
  TextColumn get subjectId => text()();
  IntColumn get attended => integer().withDefault(const Constant(0))();
  IntColumn get missed => integer().withDefault(const Constant(0))();
  IntColumn get cancelled => integer().withDefault(const Constant(0))();

  BoolColumn get isSynced => boolean().withDefault(const Constant(true))();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {subjectId};
}
