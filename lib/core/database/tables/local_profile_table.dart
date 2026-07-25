import 'package:drift/drift.dart';

class LocalProfileTable extends Table {
  TextColumn get userId => text()();
  TextColumn get username => text()();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {userId};
}
