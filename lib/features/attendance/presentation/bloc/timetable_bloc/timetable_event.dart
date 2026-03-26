abstract class TimetableEvent {}

class FetchTimetableEvent extends TimetableEvent {
  final int semester;
  final String branch;

  FetchTimetableEvent({required this.semester, required this.branch});
}
