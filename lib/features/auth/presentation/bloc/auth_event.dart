import 'package:campus_connect/features/auth/domain/enums/batch.dart';
import 'package:campus_connect/features/auth/domain/enums/branch.dart';
import 'package:campus_connect/features/auth/domain/enums/semester.dart';
import 'package:campus_connect/features/auth/domain/enums/year.dart';
import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class CheckAuthStatus extends AuthEvent {}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  const LoginRequested({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class SignupRequested extends AuthEvent {
  final String username;
  final String email;
  final String password;
  final Branch branch;
  final Year year;
  final Semester semester;
  final Batch batch;

  const SignupRequested({
    required this.username,
    required this.email,
    required this.password,
    required this.branch,
    required this.year,
    required this.semester,
    required this.batch,
  });

  @override
  List<Object?> get props => [username, email, password];
}

class LogoutRequested extends AuthEvent {}
