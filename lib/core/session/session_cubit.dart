// AuthBloc -> updates -> SessionCubit

// SessionCubit -> read by -> entire app

import 'package:campus_connect/core/entities/user_entity.dart';
import 'package:campus_connect/core/session/session_repository.dart';
import 'package:campus_connect/core/session/session_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SessionCubit extends Cubit<SessionState> {
  final SessionRepository sessionRepository;
  SessionCubit({required this.sessionRepository})
    : super(SessionState.initial());

  void setUser(UserEntity user) {
    emit(state.copyWith(user: user, isAuthenticated: true));
  }

  void clearSession() {
    emit(SessionState.initial());
  }

  Future<void> logout() async {
    final result = await sessionRepository.logout();

    result.fold((failure) {}, (_) {
      clearSession();
    });
  }

  void sendPasswordReset(String email) {
    sessionRepository.sendPasswordResetEmail(email: email);
  }

  void updateUsername(String userName) {
    final currentUser = state.user;

    if (currentUser == null) return;

    final updatedUser = currentUser.copyWith(username: userName);

    emit(state.copyWith(user: updatedUser));
  }
}
