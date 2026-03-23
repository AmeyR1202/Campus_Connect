import 'package:campus_connect/features/attendance/domain/usecase/add_attendance_usecase.dart';
import 'package:campus_connect/features/attendance/domain/usecase/get_attendance_usecase.dart';
import 'package:campus_connect/features/attendance/domain/usecase/get_stats.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/attendance_bloc/attendance_event.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/attendance_bloc/attendance_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  final AddAttendanceUsecase addAttendance;
  final GetAttendanceUsecase getAttendance;
  final GetStatsUsecase getStats;

  AttendanceBloc({
    required this.addAttendance,
    required this.getAttendance,
    required this.getStats,
  }) : super(AttendanceState()) {
    on<AddAttendanceEvent>(_onAddAttendance);
    on<FetchAttendanceEvent>(_onFetchAttendance);
    on<FetchStatsEvent>(_onFetchStats);
  }

  void _onAddAttendance(
    AddAttendanceEvent event,
    Emitter<AttendanceState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final result = await addAttendance(
      userId: event.userId,
      entity: event.entity,
    );

    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (_) {
        add(
          FetchAttendanceEvent(
            userId: event.userId,
            subjectId: event.entity.subjectId,
          ),
        );

        add(
          FetchStatsEvent(
            userId: event.userId,
            subjectId: event.entity.subjectId,
          ),
        );
      },
    );
  }

  void _onFetchAttendance(
    FetchAttendanceEvent event,
    Emitter<AttendanceState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final result = await getAttendance(
      userId: event.userId,
      subjectId: event.subjectId,
    );

    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (data) => emit(state.copyWith(isLoading: false, attendance: data)),
    );
  }

  void _onFetchStats(
    FetchStatsEvent event,
    Emitter<AttendanceState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final result = await getStats(
      subjectId: event.subjectId,
      userId: event.userId,
    );

    print(result);

    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (stats) => emit(state.copyWith(isLoading: false, stats: stats)),
    );
  }
}
