import 'package:campus_connect/features/auth/domain/enums/batch.dart';
import 'package:campus_connect/features/auth/domain/enums/branch.dart';
import 'package:campus_connect/features/auth/domain/enums/semester.dart';
import 'package:campus_connect/features/auth/domain/enums/year.dart';
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String username;
  final String email;
  final bool isEmailVerified;
  final DateTime createdAt;
  final Semester currentSemester;
  final Branch branch;
  final Year year;
  final Batch batch;

  const UserEntity({
    required this.id,
    required this.username,
    required this.email,
    required this.isEmailVerified,
    required this.createdAt,
    required this.currentSemester,
    required this.branch,
    required this.year,
    required this.batch,
  });

  @override
  List<Object?> get props => [
    id,
    username,
    email,
    isEmailVerified,
    createdAt,
    currentSemester,
    branch,
    year,
    batch,
  ];
}
