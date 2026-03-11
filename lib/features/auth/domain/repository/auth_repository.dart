import 'package:campus_connect/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<void> signUp({
    required String username,
    required String email,
    required String password,
  });

  Future<UserEntity> login({required String email, required String password});

  Future<UserEntity?> getCurrentUser();

  Future<void> logout();
}
