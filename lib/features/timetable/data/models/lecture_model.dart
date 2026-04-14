import 'package:campus_connect/features/timetable/domain/entities/lecture_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lecture_model.freezed.dart';

@freezed
class LectureModel with _$LectureModel {
  const factory LectureModel({
    required String lectureId,
    required String subjectName,
    required String day,
    required String startTime,
    required String endTime,
    required String type,
  }) = _LectureModel;

  const LectureModel._();

  factory LectureModel.fromMap(Map<String, dynamic> map, String lectureId) {
    return LectureModel(
      lectureId: lectureId,
      subjectName: map['subjectName'] ?? '',
      day: map['day'] ?? '',
      startTime: map['startTime'] ?? '',
      endTime: map['endTime'] ?? '',
      type: map['type'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'subjectName': subjectName,
      'day': day,
      'startTime': startTime,
      'endTime': endTime,
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
}
