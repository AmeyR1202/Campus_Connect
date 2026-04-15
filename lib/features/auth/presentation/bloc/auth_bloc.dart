import 'dart:async';
import 'package:campus_connect/core/session/session_cubit.dart';
import 'package:campus_connect/features/auth/domain/usecases/forget_password_usecase.dart';
import 'package:campus_connect/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:campus_connect/features/auth/domain/usecases/log_in_usecase.dart';
import 'package:campus_connect/features/auth/domain/usecases/log_out_usecase.dart';
import 'package:campus_connect/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:campus_connect/features/auth/presentation/bloc/auth_event.dart';
import 'package:campus_connect/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SessionCubit sessionCubit;
  final LoginUsecase loginUsecase;
  final SignupUsecase signupUsecase;
  final GetCurrentUserUsecase getCurrentUserUsecase;
  final LogoutUsecase logoutUsecase;
  final ForgetPasswordUsecase forgetPasswordUsecase;
  AuthBloc({
    required this.loginUsecase,
    required this.getCurrentUserUsecase,
    required this.signupUsecase,
    required this.logoutUsecase,
    required this.sessionCubit,
    required this.forgetPasswordUsecase,
  }) : super(AuthInitial()) {
    on<CheckAuthStatus>(_onCheckAuthStatus);
    on<LoginRequested>(_onLoginRequested);
    on<SignupRequested>(_onSignupRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<ForgetPasswordRequested>(_onForgetPassword);
  }

  Future<void> _onCheckAuthStatus(
    CheckAuthStatus event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final result = await getCurrentUserUsecase().timeout(
        const Duration(seconds: 10),
      );
      result.fold((failure) => emit(AuthError(failure.message)), (user) {
        if (user == null) {
          sessionCubit.clearSession();
          emit(AuthUnauthenticated());
        } else {
          sessionCubit.setUser(user);
          emit(AuthAuthenticated(user));
        }
      });
    } on TimeoutException {
      sessionCubit.clearSession();
      emit(AuthUnauthenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final result = await loginUsecase(
      email: event.email,
      password: event.password,
    );

    result.fold((failure) => emit(AuthError(failure.message)), (user) {
      sessionCubit.setUser(user);
      emit(AuthAuthenticated(user));
    });
  }

  Future<void> _onSignupRequested(
    SignupRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await signupUsecase(
      email: event.email,
      username: event.username,
      password: event.password,
    );

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(AuthVerificationEmailSent()),
    );
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await logoutUsecase();

    result.fold((failure) => emit(AuthError(failure.message)), (_) {
      sessionCubit.clearSession();
      emit(AuthUnauthenticated());
    });
  }

  Future<void> _onForgetPassword(
    ForgetPasswordRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await forgetPasswordUsecase(email: event.email);

    result.fold((failure) => emit(AuthError(failure.message)), (_) {
      emit(
        PasswordResetEmailSent(),
      ); // TODO // NOW emit this state and show screen of email sent successfully
    });
  }
}
