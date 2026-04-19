import 'package:campus_connect/features/timetable/domain/entities/lecture_entity.dart';

abstract class TimetableEvent {}

class AddLectureEvent extends TimetableEvent {
  final String userId;
  final LectureEntity entity;

  AddLectureEvent({required this.userId, required this.entity});
}

class DeleteLectureEvent extends TimetableEvent {
  final String userId;
  final String lectureId;

  DeleteLectureEvent({required this.userId, required this.lectureId});
}

class GetLecturesForDayEvent extends TimetableEvent {
  final String userId;
  final DateTime date;

  GetLecturesForDayEvent({required this.userId, required this.date});
}

class GetAllLecturesEvent extends TimetableEvent {
  final String userId;

  GetAllLecturesEvent({required this.userId});
}

class UpdateLectureEvent extends TimetableEvent {
  final String userId;
  final LectureEntity entity;

  UpdateLectureEvent({required this.userId, required this.entity});
}
