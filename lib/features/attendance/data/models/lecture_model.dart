import 'package:campus_connect/features/attendance/domain/entities/lecture_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lecture_model.freezed.dart';

@freezed
class LectureModel with _$LectureModel {
  const factory LectureModel({
    required String lectureId,
    required String subjectId,
    required String subjectName,
    required String day,
    required String startTime,
    required String endTime,
  }) = _LectureModel;

  const LectureModel._();

  // Firestore → Model
  factory LectureModel.fromMap(Map<String, dynamic> map) {
    return LectureModel(
      lectureId: map['lectureId'],
      subjectId: map['subjectId'],
      subjectName: map['subjectName'],
      day: map['day'],
      startTime: map['startTime'],
      endTime: map['endTime'],
    );
  }

  // Model → Entity
  LectureEntity toEntity(DateTime date) {
    return LectureEntity(
      lectureId: lectureId,
      subjectId: subjectId,
      subjectName: subjectName,
      day: day,
      startTime: startTime,
      endTime: endTime,
      date: date,
    );
  }
}
