abstract class TimetableEvent {}

class FetchTimetableEvent extends TimetableEvent {
  final int semester;
  final String branch;
  final DateTime date;

  FetchTimetableEvent({
    required this.semester,
    required this.branch,
    required this.date,
  });
}
