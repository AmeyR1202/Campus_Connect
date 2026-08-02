import 'package:campus_connect/features/timetable/domain/entities/lecture_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'timetable_state.freezed.dart';

@freezed
abstract class TimetableState with _$TimetableState {
  // Required to allow custom methods and getters in Freezed
  const TimetableState._();

  const factory TimetableState({
    List<LectureEntity>? lectures,
    @Default(false) bool isLoading,
    String? error,
  }) = _TimetableState;

  factory TimetableState.initial() => const TimetableState();

  // these are my single source of truth
  List<LectureEntity> getLecturesForDay(String day) {
    if (lectures == null) return [];
    return lectures!.where((l) => l.day == day).toList();
  }

  List<LectureEntity> get todayLectures {
    final todayStr = DateFormat('E').format(DateTime.now());
    return getLecturesForDay(todayStr);
  }
}
