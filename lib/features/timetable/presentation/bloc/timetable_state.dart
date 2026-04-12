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

  @override
  List<Object?> get props => [lectures, isLoading, error];
}
