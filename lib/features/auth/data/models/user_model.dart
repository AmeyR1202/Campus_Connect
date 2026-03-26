import 'package:campus_connect/features/auth/domain/enums/branch.dart';
import 'package:campus_connect/features/auth/domain/enums/semester.dart';
import 'package:campus_connect/features/auth/domain/enums/year.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:campus_connect/features/auth/domain/entities/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String username,
    required DateTime createdAt,
    required String branch,
    required String semester,
    required String year,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.fromFirestore(Map<String, dynamic> json, String id) {
    return UserModel(
      id: id,
      username: json['username'] ?? '',
      createdAt: (json['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      branch: json['branch'] ?? '',
      semester: json['semester'] ?? '',
      year: json['year'] ?? '',
    );
  }

  const UserModel._();

  UserEntity toEntity({required String email, required bool isEmailVerified}) {
    return UserEntity(
      id: id,
      username: username,
      email: email,
      isEmailVerified: isEmailVerified,
      createdAt: createdAt,
      branch: _mapBranch(branch),
      currentSemester: _mapSemester(semester),
      year: _mapYear(year),
    );
  }
}

Branch _mapBranch(String value) {
  return Branch.values.firstWhere((e) => e.name == value);
}

Semester _mapSemester(String value) {
  return Semester.values.firstWhere((e) => e.name == value);
}

Year _mapYear(String value) {
  return Year.values.firstWhere((e) => e.name == value);
}
