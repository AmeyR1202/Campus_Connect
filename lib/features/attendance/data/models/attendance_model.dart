import 'package:campus_connect/features/attendance/domain/entities/attendance_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_model.freezed.dart';

@Freezed()
class AttendanceModel with _$AttendanceModel {
  const factory AttendanceModel({
    required String lectureId,
    required String subjectId,
    required String status,
    required DateTime markedAt,
  }) = _AttendanceModel;

  const AttendanceModel._();

  // firestore -> Model
  factory AttendanceModel.fromMap(Map<String, dynamic> map) {
    return AttendanceModel(
      lectureId: map['lectureId'] as String,
      subjectId: map['subjectId'] as String,
      status: map['status'] as String,
      markedAt: (map['markedAt'] as Timestamp).toDate(),
    );
  }

  // model -> firestore
  Map<String, dynamic> toMap() {
    return {
      'lectureId': lectureId,
      'subjectId': subjectId,
      'status': status,
      'markedAt': Timestamp.fromDate(markedAt),
    };
  }

  // Model → Entity
  AttendanceEntity toEntity() {
    return AttendanceEntity(
      lectureId: lectureId,
      subjectId: subjectId,
      status: AttendanceStatus.values.firstWhere((e) => e.name == status),
      markedAt: markedAt,
    );
  }

  // Entity → Model
  factory AttendanceModel.fromEntity(AttendanceEntity entity) {
    return AttendanceModel(
      lectureId: entity.lectureId,
      subjectId: entity.subjectId,
      status: entity.status.name,
      markedAt: entity.markedAt,
    );
  }
}
