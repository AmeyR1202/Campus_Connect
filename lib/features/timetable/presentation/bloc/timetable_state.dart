import 'package:campus_connect/features/timetable/domain/entities/lecture_entity.dart';
import 'package:equatable/equatable.dart';

class TimetableState extends Equatable {
  final List<LectureEntity>? lectures;
  final bool isLoading;
  final String? error;

  const TimetableState({this.lectures, required this.isLoading, this.error});

  factory TimetableState.initial() {
    return const TimetableState(lectures: null, isLoading: false, error: null);
  }

  TimetableState copyWith({
    List<LectureEntity>? lectures,
    bool? isLoading,
    String? error,
  }) {
    return TimetableState(
      lectures: lectures ?? this.lectures,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  // these are my single source of truth
  List<LectureEntity> getLecturesForDay(String day) {
    if (lectures == null) return [];
    return lectures!.where((l) => l.day == day).toList();
  }

  List<LectureEntity> get todayLectures {
    final int weekday = DateTime.now().weekday; // 1 is marked Monday
    const weekDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    final todayStr = weekDays[weekday - 1];
    return getLecturesForDay(todayStr);
  }

  @override
  List<Object?> get props => [lectures, isLoading, error];
}
