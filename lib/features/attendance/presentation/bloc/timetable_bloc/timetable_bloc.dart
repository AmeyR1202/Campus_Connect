import 'package:campus_connect/features/attendance/domain/usecase/get_timetable_usecase.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/timetable_bloc/timetable_event.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/timetable_bloc/timetable_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimetableBloc extends Bloc<TimetableEvent, TimetableState> {
  final GetTimetableUsecase getTimetableUsecase;

  TimetableBloc({required this.getTimetableUsecase})
    : super(const TimetableState()) {
    on<FetchTimetableEvent>(_onFetchTimetable);
  }

  Future<void> _onFetchTimetable(
    FetchTimetableEvent event,
    Emitter<TimetableState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));

    final result = await getTimetableUsecase(
      branch: event.branch,
      semester: event.semester,
    );

    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (data) => emit(state.copyWith(isLoading: false, lectures: data)),
    );
  }
}
