// AuthBloc -> updates -> SessionCubit

// SessionCubit -> read by -> entire app

import 'package:campus_connect/core/entities/user_entity.dart';
import 'package:campus_connect/core/session/session_repository.dart';
import 'package:campus_connect/core/session/session_state.dart';
import 'package:campus_connect/features/profile/data/datasources/profile_local_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SessionCubit extends Cubit<SessionState> {
  final SessionRepository sessionRepository;
  final ProfileLocalDatasource profileLocalDatasource; // <-- Add this

  SessionCubit({
    required this.sessionRepository,
    required this.profileLocalDatasource, // <-- Add this
  }) : super(SessionState.initial());

  void setUser(UserEntity user) {
    emit(state.copyWith(user: user, isAuthenticated: true));
  }

  // Add this new method to load the user entirely offline
  Future<void> loadOfflineUser() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser == null) {
      clearSession();
      return;
    }

    final localProfile = await profileLocalDatasource.getProfile(
      userId: firebaseUser.uid,
    );

    if (localProfile != null) {
      final user = UserEntity(
        id: firebaseUser.uid,
        username: localProfile.username,
        email: firebaseUser.email ?? '',
        isEmailVerified: firebaseUser.emailVerified,
        createdAt: DateTime.now(),
      );
      setUser(user);
    } else {
      clearSession();
    }
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
