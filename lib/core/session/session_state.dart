import 'package:campus_connect/features/auth/domain/entities/user_entity.dart';

class SessionState {
  final UserEntity? user;
  final bool isAuthenticated;

  const SessionState({required this.user, required this.isAuthenticated});

  factory SessionState.initial() {
    return const SessionState(user: null, isAuthenticated: false);
  }

  SessionState copyWith({UserEntity? user, bool? isAuthenticated}) {
    return SessionState(
      user: user ?? this.user,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }
}
