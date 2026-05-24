// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $LocalTimetableTableTable extends LocalTimetableTable
    with TableInfo<$LocalTimetableTableTable, LocalTimetableTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalTimetableTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _lectureIdMeta = const VerificationMeta(
    'lectureId',
  );
  @override
  late final GeneratedColumn<String> lectureId = GeneratedColumn<String>(
    'lecture_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _subjectNameMeta = const VerificationMeta(
    'subjectName',
  );
  @override
  late final GeneratedColumn<String> subjectName = GeneratedColumn<String>(
    'subject_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dayMeta = const VerificationMeta('day');
  @override
  late final GeneratedColumn<String> day = GeneratedColumn<String>(
    'day',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startTimeMeta = const VerificationMeta(
    'startTime',
  );
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
    'start_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endTimeMeta = const VerificationMeta(
    'endTime',
  );
  @override
  late final GeneratedColumn<DateTime> endTime = GeneratedColumn<DateTime>(
    'end_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    lectureId,
    subjectName,
    day,
    startTime,
    endTime,
    type,
    isSynced,
    isDeleted,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_timetable_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalTimetableTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('lecture_id')) {
      context.handle(
        _lectureIdMeta,
        lectureId.isAcceptableOrUnknown(data['lecture_id']!, _lectureIdMeta),
      );
    } else if (isInserting) {
      context.missing(_lectureIdMeta);
    }
    if (data.containsKey('subject_name')) {
      context.handle(
        _subjectNameMeta,
        subjectName.isAcceptableOrUnknown(
          data['subject_name']!,
          _subjectNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_subjectNameMeta);
    }
    if (data.containsKey('day')) {
      context.handle(
        _dayMeta,
        day.isAcceptableOrUnknown(data['day']!, _dayMeta),
      );
    } else if (isInserting) {
      context.missing(_dayMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(
        _startTimeMeta,
        startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(
        _endTimeMeta,
        endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_endTimeMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalTimetableTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalTimetableTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      lectureId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lecture_id'],
      )!,
      subjectName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subject_name'],
      )!,
      day: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}day'],
      )!,
      startTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_time'],
      )!,
      endTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_time'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $LocalTimetableTableTable createAlias(String alias) {
    return $LocalTimetableTableTable(attachedDatabase, alias);
  }
}

class LocalTimetableTableData extends DataClass
    implements Insertable<LocalTimetableTableData> {
  final int id;
  final String lectureId;
  final String subjectName;
  final String day;
  final DateTime startTime;
  final DateTime endTime;
  final String type;

  /// checks if newly added/modified data has been synced or not?
  final bool isSynced;
  final bool isDeleted;

  /// This updatedAt is created for last write wins
  /// Let's say a user updates data from two different devices
  /// I want the last write to win in case of conflict
  final DateTime updatedAt;
  const LocalTimetableTableData({
    required this.id,
    required this.lectureId,
    required this.subjectName,
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.type,
    required this.isSynced,
    required this.isDeleted,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['lecture_id'] = Variable<String>(lectureId);
    map['subject_name'] = Variable<String>(subjectName);
    map['day'] = Variable<String>(day);
    map['start_time'] = Variable<DateTime>(startTime);
    map['end_time'] = Variable<DateTime>(endTime);
    map['type'] = Variable<String>(type);
    map['is_synced'] = Variable<bool>(isSynced);
    map['is_deleted'] = Variable<bool>(isDeleted);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  LocalTimetableTableCompanion toCompanion(bool nullToAbsent) {
    return LocalTimetableTableCompanion(
      id: Value(id),
      lectureId: Value(lectureId),
      subjectName: Value(subjectName),
      day: Value(day),
      startTime: Value(startTime),
      endTime: Value(endTime),
      type: Value(type),
      isSynced: Value(isSynced),
      isDeleted: Value(isDeleted),
      updatedAt: Value(updatedAt),
    );
  }

  factory LocalTimetableTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalTimetableTableData(
      id: serializer.fromJson<int>(json['id']),
      lectureId: serializer.fromJson<String>(json['lectureId']),
      subjectName: serializer.fromJson<String>(json['subjectName']),
      day: serializer.fromJson<String>(json['day']),
      startTime: serializer.fromJson<DateTime>(json['startTime']),
      endTime: serializer.fromJson<DateTime>(json['endTime']),
      type: serializer.fromJson<String>(json['type']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'lectureId': serializer.toJson<String>(lectureId),
      'subjectName': serializer.toJson<String>(subjectName),
      'day': serializer.toJson<String>(day),
      'startTime': serializer.toJson<DateTime>(startTime),
      'endTime': serializer.toJson<DateTime>(endTime),
      'type': serializer.toJson<String>(type),
      'isSynced': serializer.toJson<bool>(isSynced),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  LocalTimetableTableData copyWith({
    int? id,
    String? lectureId,
    String? subjectName,
    String? day,
    DateTime? startTime,
    DateTime? endTime,
    String? type,
    bool? isSynced,
    bool? isDeleted,
    DateTime? updatedAt,
  }) => LocalTimetableTableData(
    id: id ?? this.id,
    lectureId: lectureId ?? this.lectureId,
    subjectName: subjectName ?? this.subjectName,
    day: day ?? this.day,
    startTime: startTime ?? this.startTime,
    endTime: endTime ?? this.endTime,
    type: type ?? this.type,
    isSynced: isSynced ?? this.isSynced,
    isDeleted: isDeleted ?? this.isDeleted,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  LocalTimetableTableData copyWithCompanion(LocalTimetableTableCompanion data) {
    return LocalTimetableTableData(
      id: data.id.present ? data.id.value : this.id,
      lectureId: data.lectureId.present ? data.lectureId.value : this.lectureId,
      subjectName: data.subjectName.present
          ? data.subjectName.value
          : this.subjectName,
      day: data.day.present ? data.day.value : this.day,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      type: data.type.present ? data.type.value : this.type,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalTimetableTableData(')
          ..write('id: $id, ')
          ..write('lectureId: $lectureId, ')
          ..write('subjectName: $subjectName, ')
          ..write('day: $day, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('type: $type, ')
          ..write('isSynced: $isSynced, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    lectureId,
    subjectName,
    day,
    startTime,
    endTime,
    type,
    isSynced,
    isDeleted,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalTimetableTableData &&
          other.id == this.id &&
          other.lectureId == this.lectureId &&
          other.subjectName == this.subjectName &&
          other.day == this.day &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.type == this.type &&
          other.isSynced == this.isSynced &&
          other.isDeleted == this.isDeleted &&
          other.updatedAt == this.updatedAt);
}

class LocalTimetableTableCompanion
    extends UpdateCompanion<LocalTimetableTableData> {
  final Value<int> id;
  final Value<String> lectureId;
  final Value<String> subjectName;
  final Value<String> day;
  final Value<DateTime> startTime;
  final Value<DateTime> endTime;
  final Value<String> type;
  final Value<bool> isSynced;
  final Value<bool> isDeleted;
  final Value<DateTime> updatedAt;
  const LocalTimetableTableCompanion({
    this.id = const Value.absent(),
    this.lectureId = const Value.absent(),
    this.subjectName = const Value.absent(),
    this.day = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.type = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  LocalTimetableTableCompanion.insert({
    this.id = const Value.absent(),
    required String lectureId,
    required String subjectName,
    required String day,
    required DateTime startTime,
    required DateTime endTime,
    required String type,
    this.isSynced = const Value.absent(),
    this.isDeleted = const Value.absent(),
    required DateTime updatedAt,
  }) : lectureId = Value(lectureId),
       subjectName = Value(subjectName),
       day = Value(day),
       startTime = Value(startTime),
       endTime = Value(endTime),
       type = Value(type),
       updatedAt = Value(updatedAt);
  static Insertable<LocalTimetableTableData> custom({
    Expression<int>? id,
    Expression<String>? lectureId,
    Expression<String>? subjectName,
    Expression<String>? day,
    Expression<DateTime>? startTime,
    Expression<DateTime>? endTime,
    Expression<String>? type,
    Expression<bool>? isSynced,
    Expression<bool>? isDeleted,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (lectureId != null) 'lecture_id': lectureId,
      if (subjectName != null) 'subject_name': subjectName,
      if (day != null) 'day': day,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (type != null) 'type': type,
      if (isSynced != null) 'is_synced': isSynced,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  LocalTimetableTableCompanion copyWith({
    Value<int>? id,
    Value<String>? lectureId,
    Value<String>? subjectName,
    Value<String>? day,
    Value<DateTime>? startTime,
    Value<DateTime>? endTime,
    Value<String>? type,
    Value<bool>? isSynced,
    Value<bool>? isDeleted,
    Value<DateTime>? updatedAt,
  }) {
    return LocalTimetableTableCompanion(
      id: id ?? this.id,
      lectureId: lectureId ?? this.lectureId,
      subjectName: subjectName ?? this.subjectName,
      day: day ?? this.day,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      type: type ?? this.type,
      isSynced: isSynced ?? this.isSynced,
      isDeleted: isDeleted ?? this.isDeleted,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (lectureId.present) {
      map['lecture_id'] = Variable<String>(lectureId.value);
    }
    if (subjectName.present) {
      map['subject_name'] = Variable<String>(subjectName.value);
    }
    if (day.present) {
      map['day'] = Variable<String>(day.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<DateTime>(endTime.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalTimetableTableCompanion(')
          ..write('id: $id, ')
          ..write('lectureId: $lectureId, ')
          ..write('subjectName: $subjectName, ')
          ..write('day: $day, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('type: $type, ')
          ..write('isSynced: $isSynced, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $LocalTimetableTableTable localTimetableTable =
      $LocalTimetableTableTable(this);
  late final TimetableDao timetableDao = TimetableDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [localTimetableTable];
}

typedef $$LocalTimetableTableTableCreateCompanionBuilder =
    LocalTimetableTableCompanion Function({
      Value<int> id,
      required String lectureId,
      required String subjectName,
      required String day,
      required DateTime startTime,
      required DateTime endTime,
      required String type,
      Value<bool> isSynced,
      Value<bool> isDeleted,
      required DateTime updatedAt,
    });
typedef $$LocalTimetableTableTableUpdateCompanionBuilder =
    LocalTimetableTableCompanion Function({
      Value<int> id,
      Value<String> lectureId,
      Value<String> subjectName,
      Value<String> day,
      Value<DateTime> startTime,
      Value<DateTime> endTime,
      Value<String> type,
      Value<bool> isSynced,
      Value<bool> isDeleted,
      Value<DateTime> updatedAt,
    });

class $$LocalTimetableTableTableFilterComposer
    extends Composer<_$AppDatabase, $LocalTimetableTableTable> {
  $$LocalTimetableTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lectureId => $composableBuilder(
    column: $table.lectureId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get subjectName => $composableBuilder(
    column: $table.subjectName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get day => $composableBuilder(
    column: $table.day,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LocalTimetableTableTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalTimetableTableTable> {
  $$LocalTimetableTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lectureId => $composableBuilder(
    column: $table.lectureId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subjectName => $composableBuilder(
    column: $table.subjectName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get day => $composableBuilder(
    column: $table.day,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocalTimetableTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalTimetableTableTable> {
  $$LocalTimetableTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get lectureId =>
      $composableBuilder(column: $table.lectureId, builder: (column) => column);

  GeneratedColumn<String> get subjectName => $composableBuilder(
    column: $table.subjectName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get day =>
      $composableBuilder(column: $table.day, builder: (column) => column);

  GeneratedColumn<DateTime> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<DateTime> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$LocalTimetableTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LocalTimetableTableTable,
          LocalTimetableTableData,
          $$LocalTimetableTableTableFilterComposer,
          $$LocalTimetableTableTableOrderingComposer,
          $$LocalTimetableTableTableAnnotationComposer,
          $$LocalTimetableTableTableCreateCompanionBuilder,
          $$LocalTimetableTableTableUpdateCompanionBuilder,
          (
            LocalTimetableTableData,
            BaseReferences<
              _$AppDatabase,
              $LocalTimetableTableTable,
              LocalTimetableTableData
            >,
          ),
          LocalTimetableTableData,
          PrefetchHooks Function()
        > {
  $$LocalTimetableTableTableTableManager(
    _$AppDatabase db,
    $LocalTimetableTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalTimetableTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalTimetableTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$LocalTimetableTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> lectureId = const Value.absent(),
                Value<String> subjectName = const Value.absent(),
                Value<String> day = const Value.absent(),
                Value<DateTime> startTime = const Value.absent(),
                Value<DateTime> endTime = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => LocalTimetableTableCompanion(
                id: id,
                lectureId: lectureId,
                subjectName: subjectName,
                day: day,
                startTime: startTime,
                endTime: endTime,
                type: type,
                isSynced: isSynced,
                isDeleted: isDeleted,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String lectureId,
                required String subjectName,
                required String day,
                required DateTime startTime,
                required DateTime endTime,
                required String type,
                Value<bool> isSynced = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                required DateTime updatedAt,
              }) => LocalTimetableTableCompanion.insert(
                id: id,
                lectureId: lectureId,
                subjectName: subjectName,
                day: day,
                startTime: startTime,
                endTime: endTime,
                type: type,
                isSynced: isSynced,
                isDeleted: isDeleted,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LocalTimetableTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LocalTimetableTableTable,
      LocalTimetableTableData,
      $$LocalTimetableTableTableFilterComposer,
      $$LocalTimetableTableTableOrderingComposer,
      $$LocalTimetableTableTableAnnotationComposer,
      $$LocalTimetableTableTableCreateCompanionBuilder,
      $$LocalTimetableTableTableUpdateCompanionBuilder,
      (
        LocalTimetableTableData,
        BaseReferences<
          _$AppDatabase,
          $LocalTimetableTableTable,
          LocalTimetableTableData
        >,
      ),
      LocalTimetableTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$LocalTimetableTableTableTableManager get localTimetableTable =>
      $$LocalTimetableTableTableTableManager(_db, _db.localTimetableTable);
}
