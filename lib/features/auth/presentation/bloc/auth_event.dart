/*
  1. Login Requested
  2. Sign-up Requested
  3. Forget Password Requested
  4. Logout Requested
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
sealed class AuthEvent with _$AuthEvent {
  // 1. Login Requested
  const factory AuthEvent.loginRequested({
    required String email,
    required String password,
  }) = LoginRequested;

  // 2. Signup Requested
  const factory AuthEvent.signupRequested({
    required String username,
    required String email,
    required String password,
  }) = SignupRequested;

  // 3. Forget Password Requested
  const factory AuthEvent.forgetPasswordRequested({required String email}) =
      ForgetPasswordRequested;

  // 4. Logout
  const factory AuthEvent.logoutRequested() = LogoutRequested;
}
