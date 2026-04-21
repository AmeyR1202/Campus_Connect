import 'package:campus_connect/core/session/session_cubit.dart';
import 'package:campus_connect/features/profile/domain/usecases/update_username_usecase.dart';
import 'package:campus_connect/features/profile/presentation/bloc/profile_event.dart';
import 'package:campus_connect/features/profile/presentation/bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UpdateUsernameUsecase updateUsernameUsecase;
  final SessionCubit sessionCubit;

  ProfileBloc({required this.updateUsernameUsecase, required this.sessionCubit})
    : super(ProfileInitial()) {
    on<UpdateUsernameEvent>(_onUpdateUsername);
  }

  Future<void> _onUpdateUsername(
    UpdateUsernameEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());

    final result = await updateUsernameUsecase(
      userId: event.userId,
      newUserName: event.newUserName,
    );
    result.fold(
      (failure) {
        emit(ProfileError(errorMessage: failure.message));
      },
      (_) {
        emit(ProfileUpdateSuccess());
      },
    );
  }
}
