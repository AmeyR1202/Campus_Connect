// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_stats_dao.dart';

// ignore_for_file: type=lint
mixin _$BaseStatsDaoMixin on DatabaseAccessor<AppDatabase> {
  $LocalBaseStatsTableTable get localBaseStatsTable =>
      attachedDatabase.localBaseStatsTable;
  BaseStatsDaoManager get managers => BaseStatsDaoManager(this);
}

class BaseStatsDaoManager {
  final _$BaseStatsDaoMixin _db;
  BaseStatsDaoManager(this._db);
  $$LocalBaseStatsTableTableTableManager get localBaseStatsTable =>
      $$LocalBaseStatsTableTableTableManager(
        _db.attachedDatabase,
        _db.localBaseStatsTable,
      );
}
