import 'package:campus_connect/features/attendance/domain/usecase/add_attendance_usecase.dart';
import 'package:campus_connect/features/attendance/domain/usecase/get_dashboard_stats_usecase.dart';
import 'package:campus_connect/features/attendance/domain/usecase/get_attendance_usecase.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/attendance_bloc/attendance_event.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/attendance_bloc/attendance_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  final AddAttendanceUsecase addAttendance;
  final GetAttendanceUsecase getAttendance;
  final GetDashboardStatsUsecase dashboardStats;

  AttendanceBloc({
    required this.dashboardStats,
    required this.addAttendance,
    required this.getAttendance,
  }) : super(AttendanceState()) {
    on<AddAttendanceEvent>(_onAddAttendance);
    on<FetchAllSubjectsStatsEvent>(_onFetchAllSubjectsStatsEvent);
    on<FetchAttendanceEvent>(_onFetchAttendance);
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
        add(FetchAllSubjectsStatsEvent(userId: event.userId));
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

  Future<void> _onFetchAllSubjectsStatsEvent(
    FetchAllSubjectsStatsEvent event,
    Emitter<AttendanceState> emit,
  ) async {
    print("EVENT TRIGGERED");
    emit(state.copyWith(isLoading: true));

    final result = await dashboardStats(userId: event.userId);
    print('BLOC RESULT: $result');
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (data) => emit(state.copyWith(isLoading: false, subjectStats: data)),
    );
  }
}
