import 'package:campus_connect/features/session/domain/entities/session_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../timetable/data/models/session_model.freezed.dart';

@freezed
class SessionModel with _$SessionModel {
  const factory SessionModel({
    required String sessionId,
    required String subjectName,
    required String day,
    required String startTime,
    required String endTime,
    required String colorHex,
    required String type,
  }) = _SessionModel;

  const SessionModel._();

  // Firestore → Model
  factory SessionModel.fromMap(Map<String, dynamic> map, String id) {
    return SessionModel(
      sessionId: id,
      subjectName: map['subjectName'] ?? '',
      day: map['day'] ?? '',
      startTime: map['startTime'] ?? '',
      endTime: map['endTime'] ?? '',
      colorHex: map['colorHex'] ?? '#4A90D9',
      type: map['type'] ?? 'lecture',
    );
  }

  // Model → Firestore
  Map<String, dynamic> toMap() {
    return {
      'subjectName': subjectName,
      'day': day,
      'startTime': startTime,
      'endTime': endTime,
      'colorHex': colorHex,
      'type': type,
    };
  }

  // Model → Entity
  SessionEntity toEntity(DateTime date) {
    return SessionEntity(
      sessionId: sessionId,
      subjectName: subjectName,
      day: day,
      startTime: startTime,
      endTime: endTime,
      colorHex: colorHex,
      type: type,
      date: date,
    );
  }
}
