import 'package:campus_connect/features/attendance/domain/entities/subject_base_stats_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subject_base_stats_model.freezed.dart';

@freezed
class SubjectBaseStatsModel with _$SubjectBaseStatsModel {
  const factory SubjectBaseStatsModel({
    required String subjectId,
    required int attended,
    required int missed,
  }) = _SubjectBaseStatsModel;

  const SubjectBaseStatsModel._();

  factory SubjectBaseStatsModel.fromMap(
    Map<String, dynamic> map,
    String subjectId,
  ) {
    return SubjectBaseStatsModel(
      subjectId: subjectId,
      attended: map['attended'] as int? ?? 0,
      missed: map['missed'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {'subjectId': subjectId, 'attended': attended, 'missed': missed};
  }

  SubjectBaseStatsEntity toEntity() {
    return SubjectBaseStatsEntity(
      subjectId: subjectId,
      attended: attended,
      missed: missed,
    );
  }

  factory SubjectBaseStatsModel.fromEntity(SubjectBaseStatsEntity entity) {
    return SubjectBaseStatsModel(
      subjectId: entity.subjectId,
      attended: entity.attended,
      missed: entity.missed,
    );
  }
}
