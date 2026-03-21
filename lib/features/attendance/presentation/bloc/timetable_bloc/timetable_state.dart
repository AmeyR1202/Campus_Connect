import 'package:campus_connect/features/attendance/domain/entities/lecture_entity.dart';
import 'package:equatable/equatable.dart';

class TimetableState extends Equatable {
  final bool isLoading;
  final List<LectureEntity>? lectures;
  final String? error;

  const TimetableState({this.isLoading = false, this.lectures, this.error});

  TimetableState copyWith({
    bool? isLoading,
    List<LectureEntity>? lectures,
    String? error,
  }) {
    return TimetableState(
      isLoading: isLoading ?? this.isLoading,
      lectures: lectures ?? this.lectures,
      error: error,
    );
  }

  @override
  List<Object?> get props => [isLoading, lectures, error];
}
