import 'package:campus_connect/features/session/domain/entities/session_entity.dart';

abstract class TimetableEvent {}

class FetchSessionsForDay extends TimetableEvent {
  final DateTime date;
  FetchSessionsForDay({required this.date});
}

class AddSessionEvent extends TimetableEvent {
  final SessionEntity session;
  AddSessionEvent({required this.session});
}

class UpdateSessionEvent extends TimetableEvent {
  final SessionEntity session;
  UpdateSessionEvent({required this.session});
}

class DeleteSessionEvent extends TimetableEvent {
  final String sessionId;
  DeleteSessionEvent({required this.sessionId});
}
