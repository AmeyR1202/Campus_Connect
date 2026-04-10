import 'package:campus_connect/features/timetable/domain/usecases/add_lecture_usecase.dart';
import 'package:campus_connect/features/timetable/domain/usecases/delete_lecture_usecase.dart';
import 'package:campus_connect/features/timetable/domain/usecases/get_lectures_for_day_usecase.dart';
import 'package:campus_connect/features/timetable/domain/usecases/update_lecture_usecase.dart';
import 'package:campus_connect/features/timetable/presentation/bloc/timetable_event.dart';
import 'package:campus_connect/features/timetable/presentation/bloc/timetable_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimetableBloc extends Bloc<TimetableEvent, TimetableState> {
  final AddLectureUsecase addLecture;
  final UpdateLectureUsecase updateLecture;
  final DeleteLectureUsecase deleteLecture;
  final GetLecturesForDayUsecase getLectures;

  TimetableBloc({
    required this.addLecture,
    required this.updateLecture,
    required this.deleteLecture,
    required this.getLectures,
  }) : super(TimetableState.initial()) {
    on<AddLectureEvent>(_onAddLecture);
    on<UpdateLectureEvent>(_onUpdateLecture);
    on<DeleteLectureEvent>(_onDeleteLecture);
    on<GetLecturesForDayEvent>(_onGetLectures);
  }

  Future<void> _onAddLecture(
    AddLectureEvent event,
    Emitter<TimetableState> emit,
  ) async {
    final previousLectures = state.lectures;

    //optimistic
    emit(
      state.copyWith(lectures: [...state.lectures, event.entity], error: null),
    );

    final result = await addLecture(userId: event.userId, entity: event.entity);
    result.fold(
      (failure) {
        // Rollback
        emit(
          state.copyWith(lectures: previousLectures, error: failure.message),
        );
      },
      (_) {
        // 200 => doing nothing
      },
    );
  }

  Future<void> _onDeleteLecture(
    DeleteLectureEvent event,
    Emitter<TimetableState> emit,
  ) async {
    final previousLectures = state.lectures;

    //optimistic deleting
    emit(
      state.copyWith(
        lectures: state.lectures
            .where((l) => l.lectureId != event.lectureId)
            .toList(),
        error: null,
      ),
    );
    final result = await deleteLecture(
      userId: event.userId,
      lectureId: event.lectureId,
    );
    result.fold((failure) {
      // Rollback
      emit(state.copyWith(lectures: previousLectures, error: failure.message));
    }, (_) {});
  }

  Future<void> _onGetLectures(
    GetLecturesForDayEvent event,
    Emitter<TimetableState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));

    final result = await getLectures(userId: event.userId, date: event.date);

    result.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, error: failure.message));
      },
      (lectures) {
        emit(state.copyWith(isLoading: false, lectures: lectures));
      },
    );
  }

  Future<void> _onUpdateLecture(
    UpdateLectureEvent event,
    Emitter<TimetableState> emit,
  ) async {
    final previousLectures = state.lectures;

    final updatedList = state.lectures.map((l) {
      if (l.lectureId == event.entity.lectureId) {
        return event.entity;
      }
      return l;
    }).toList();

    emit(state.copyWith(lectures: updatedList, error: null));

    final result = await updateLecture(
      userId: event.userId,
      entity: event.entity,
    );

    result.match((failure) {
      // Rollback
      emit(state.copyWith(lectures: previousLectures, error: failure.message));
    }, (_) {});
  }
}
