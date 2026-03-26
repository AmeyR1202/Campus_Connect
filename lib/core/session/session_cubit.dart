// AuthBloc -> updates -> SessionCubit

// SessionCubit -> read by -> entire app

import 'package:campus_connect/core/session/session_state.dart';
import 'package:campus_connect/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SessionCubit extends Cubit<SessionState> {
  SessionCubit() : super(SessionState.initial());

  void setUser(UserEntity user) {
    emit(state.copyWith(user: user, isAuthenticated: true));
  }

  void clearSession() {
    emit(SessionState.initial());
  }
}
