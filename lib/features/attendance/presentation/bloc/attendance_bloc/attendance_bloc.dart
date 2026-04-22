import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:campus_connect/features/attendance/domain/entities/attendance_entity.dart';
import 'package:campus_connect/features/attendance/domain/entities/subject_base_stats_entity.dart';
import 'package:campus_connect/features/attendance/domain/usecases/add_attendance_usecase.dart';
import 'package:campus_connect/features/attendance/domain/usecases/get_attendance_usecase.dart';
import 'package:campus_connect/features/attendance/domain/usecases/get_dashboard_stats_usecase.dart';
import 'package:campus_connect/features/attendance/domain/usecases/set_base_stats_usecase.dart';
import 'package:campus_connect/features/attendance/domain/usecases/update_attendance_usecase.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/attendance_bloc/attendance_event.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/attendance_bloc/attendance_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  final AddAttendanceUsecase addAttendance;
  final GetAttendanceUsecase getAttendance;
  final GetDashboardStatsUsecase dashboardStats;
  final UpdateAttendanceUsecase updateAttendanceUsecase;
  final SetBaseStatsUsecase setBaseStatsUsecase;

  AttendanceBloc({
    required this.dashboardStats,
    required this.addAttendance,
    required this.getAttendance,
    required this.updateAttendanceUsecase,
    required this.setBaseStatsUsecase,
  }) : super(const AttendanceState()) {
    on<AddAttendanceEvent>(
      _onAddAttendance,
      transformer: restartable(),
    ); // didn't use droppable because it ignores new until done
    on<FetchAllSubjectsStatsEvent>(_onFetchAllSubjectsStatsEvent);
    on<FetchAttendanceEvent>(_onFetchAttendance);
    on<UpdateLectureEvent>(_onUpdateLecture);
    on<SetBaseStatsEvent>(_onSetBaseStats);
  }

  Future<void> _onAddAttendance(
    AddAttendanceEvent event,
    Emitter<AttendanceState> emit,
  ) async {
    final previousState = state;

    final updatedList = List<AttendanceEntity>.from(state.attendance ?? []);

    final existing = updatedList
        .where((e) => e.lectureId == event.entity.lectureId)
        .toList();

    if (existing.isNotEmpty && existing.first.status == event.entity.status) {
      return; // skipping duplicates
    }

    updatedList.removeWhere((e) => e.lectureId == event.entity.lectureId);
    updatedList.add(event.entity);

    emit(state.copyWith(attendance: updatedList, isLoading: true));

    final result = await addAttendance(
      userId: event.userId,
      entity: event.entity,
    );

    result.fold(
      (failure) {
        emit(previousState.copyWith(error: failure.message, isLoading: false));
      },
      (_) {
        emit(state.copyWith(isLoading: false));
        add(FetchAllSubjectsStatsEvent(userId: event.userId));
      },
    );
  }

  Future<void> _onFetchAttendance(
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
    // print("EVENT TRIGGERED");
    emit(state.copyWith(isLoading: true));

    final result = await dashboardStats(userId: event.userId);
    // print('BLOC RESULT: $result');
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (data) => emit(state.copyWith(isLoading: false, subjectStats: data)),
    );
  }

  Future<void> _onUpdateLecture(
    UpdateLectureEvent event,
    Emitter<AttendanceState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final result = await updateAttendanceUsecase(
      userId: event.userId,
      subjectId: event.subjectId,
      lectureId: event.lectureId,
      status: event.status,
    );

    result.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, error: failure.message));
      },
      (_) {
        add(
          FetchAttendanceEvent(
            userId: event.userId,
            subjectId: event.subjectId,
          ),
        );

        add(FetchAllSubjectsStatsEvent(userId: event.userId));
      },
    );
  }

  Future<void> _onSetBaseStats(
    SetBaseStatsEvent event,
    Emitter<AttendanceState> emit,
  ) async {
    final entity = SubjectBaseStatsEntity(
      subjectId: event.subjectId,
      attended: event.attended,
      missed: event.missed,
      cancelled: event.cancelled,
    );

    final result = await setBaseStatsUsecase(
      userId: event.userId,
      entity: entity,
    );

    result.fold(
      (failure) {
        emit(state.copyWith(error: failure.message));
      },
      (_) {
        // Refresh dashboard stats to show updated percentages
        add(FetchAllSubjectsStatsEvent(userId: event.userId));
      },
    );
  }
}
