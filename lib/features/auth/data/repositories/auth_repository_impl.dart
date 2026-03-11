import 'package:campus_connect/features/auth/data/datasources/firebase_auth_datasource.dart';
import 'package:campus_connect/features/auth/data/datasources/firestore_user_datasource.dart';
import 'package:campus_connect/features/auth/domain/entities/user_entity.dart';
import 'package:campus_connect/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthDatasource authDatasource;
  final FirestoreUserDatasource firestoreDatasource;

  AuthRepositoryImpl({
    required this.authDatasource,
    required this.firestoreDatasource,
  });

  @override
  Future<UserEntity?> getCurrentUser() async {
    final firebaseUser = authDatasource.getFirebaseUser();

    if (firebaseUser == null) {
      return null;
    }

    final userModel = await firestoreDatasource.getUser(firebaseUser.uid);

    return userModel.toEntity(
      email: firebaseUser.email!,
      isEmailVerified: firebaseUser.emailVerified,
    );
  }

  @override
  Future<UserEntity> login({
    required String email,
    required String password,
  }) async {
    final credential = await authDatasource.login(
      email: email,
      password: password,
    );

    final firebaseUser = credential.user;

    if (firebaseUser == null) {
      throw Exception("Login failed");
    }
    final userModel = await firestoreDatasource.getUser(firebaseUser.uid);

    return userModel.toEntity(
      email: firebaseUser.email!,
      isEmailVerified: firebaseUser.emailVerified,
    );
  }

  @override
  Future<void> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    final credential = await authDatasource.signUp(
      email: email,
      password: password,
    );
    final firebaseUser = credential.user;

    if (firebaseUser == null) {
      throw Exception("User creation failed");
    }
    // send verification email
    await authDatasource.sendEmailVerification();

    // create firestore profile
    await firestoreDatasource.createUser(
      uid: firebaseUser.uid,
      username: username,
    );
  }

  @override
  Future<void> logout() {
    return authDatasource.logout();
  }
}
