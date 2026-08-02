import 'package:campus_connect/core/entities/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.loading() = AuthLoading;
  const factory AuthState.signupSuccess() = AuthSignupSuccess;
  const factory AuthState.verificationEmailSent() = AuthVerificationEmailSent;
  const factory AuthState.passwordResetEmailSent() = PasswordResetEmailSent;
  const factory AuthState.authenticated(UserEntity user) = AuthAuthenticated;
  const factory AuthState.unauthenticated() = AuthUnauthenticated;
  const factory AuthState.error(String message) = AuthError;
}
