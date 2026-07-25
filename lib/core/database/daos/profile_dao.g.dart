// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_dao.dart';

// ignore_for_file: type=lint
mixin _$ProfileDaoMixin on DatabaseAccessor<AppDatabase> {
  $LocalProfileTableTable get localProfileTable =>
      attachedDatabase.localProfileTable;
  ProfileDaoManager get managers => ProfileDaoManager(this);
}

class ProfileDaoManager {
  final _$ProfileDaoMixin _db;
  ProfileDaoManager(this._db);
  $$LocalProfileTableTableTableManager get localProfileTable =>
      $$LocalProfileTableTableTableManager(
        _db.attachedDatabase,
        _db.localProfileTable,
      );
}
