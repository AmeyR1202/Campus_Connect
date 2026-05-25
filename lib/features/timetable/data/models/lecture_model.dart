import 'package:campus_connect/core/database/app_database.dart';
import 'package:campus_connect/features/timetable/domain/entities/lecture_entity.dart';
import 'package:drift/drift.dart' hide JsonKey;
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lecture_model.freezed.dart';

@freezed
abstract class LectureModel with _$LectureModel {
  const factory LectureModel({
    required String lectureId,
    required String subjectName,
    required String day,
    required DateTime startTime,
    required DateTime endTime,
    required String type,
  }) = _LectureModel;

  const LectureModel._();

  factory LectureModel.fromMap(Map<String, dynamic> map, String lectureId) {
    return LectureModel(
      lectureId: lectureId,
      subjectName: map['subjectName'] ?? '',
      day: map['day'] ?? '',
      startTime: map['startTime'] is DateTime
          ? map['startTime']
          : (map['startTime'] != null &&
                    map['startTime'].runtimeType.toString() == 'Timestamp'
                ? map['startTime'].toDate()
                : DateTime.tryParse(map['startTime'].toString()) ??
                      DateTime.now()),
      endTime: map['endTime'] is DateTime
          ? map['endTime']
          : (map['endTime'] != null &&
                    map['endTime'].runtimeType.toString() == 'Timestamp'
                ? map['endTime'].toDate()
                : DateTime.tryParse(map['endTime'].toString()) ??
                      DateTime.now()),
      type: map['type'] ?? '',
    );
  }

  factory LectureModel.fromEntity(LectureEntity entity) {
    return LectureModel(
      lectureId: entity.lectureId,
      subjectName: entity.subjectName,
      day: entity.day,
      startTime: entity.startTime,
      endTime: entity.endTime,
      type: entity.type,
    );
  }

  factory LectureModel.fromLocalData(LocalTimetableTableData data) {
    return LectureModel(
      lectureId: data.lectureId,
      subjectName: data.subjectName,
      day: data.day,
      startTime: data.startTime,
      endTime: data.endTime,
      type: data.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'subjectName': subjectName,
      'day': day,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'type': type,
    };
  }

  LectureEntity toEntity() {
    return LectureEntity(
      lectureId: lectureId,
      subjectName: subjectName,
      day: day,
      startTime: startTime,
      endTime: endTime,
      type: type,
    );
  }

  /// MODEL -> DRIFT COMPANION
  LocalTimetableTableCompanion toCompanion({bool isSynced = false}) {
    return LocalTimetableTableCompanion(
      lectureId: Value(lectureId),
      subjectName: Value(subjectName),
      day: Value(day),
      startTime: Value(startTime),
      endTime: Value(endTime),
      type: Value(type),
      isSynced: Value(isSynced),
      isDeleted: const Value(false),
      updatedAt: Value(DateTime.now()),
    );
  }
}
