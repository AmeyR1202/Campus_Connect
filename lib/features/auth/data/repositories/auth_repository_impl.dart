import 'package:campus_connect/core/database/app_database.dart';
import 'package:campus_connect/core/entities/user_entity.dart';
import 'package:campus_connect/core/errors/app_exception.dart';
import 'package:campus_connect/core/errors/failures.dart';
import 'package:campus_connect/features/auth/data/datasources/firebase_auth_datasource.dart';
import 'package:campus_connect/features/auth/data/datasources/firestore_user_datasource.dart';
import 'package:campus_connect/features/auth/domain/repository/auth_repository.dart';
import 'package:campus_connect/features/profile/data/datasources/profile_local_datasource.dart';
import 'package:drift/drift.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthDatasource authDatasource;
  final FirestoreUserDatasource firestoreDatasource;
  final ProfileLocalDatasource profileLocalDatasource;

  AuthRepositoryImpl({
    required this.authDatasource,
    required this.firestoreDatasource,
    required this.profileLocalDatasource, // <-- ADDED THIS
  });

  @override
  Future<Either<Failure, UserEntity?>> getCurrentUser() async {
    try {
      final firebaseUser = authDatasource.getFirebaseUser();

      if (firebaseUser == null) {
        return const Right(null);
      }

      await firebaseUser.reload();

      if (!firebaseUser.emailVerified) {
        return const Right(null);
      }

      final userModel = await firestoreDatasource.getUser(firebaseUser.uid);

      // CACHE THE USER LOCALLY SO IT'S AVAILABLE OFFLINE/ON RESTART!
      await profileLocalDatasource.upsertProfile(
        LocalProfileTableCompanion(
          userId: Value(firebaseUser.uid),
          username: Value(userModel.username),
          isSynced: const Value(
            true,
          ), // Synced because we just got it from Firestore!
        ),
      );

      final entity = userModel.toEntity(
        email: firebaseUser.email!,
        isEmailVerified: firebaseUser.emailVerified,
      );

      return Right(entity);
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await authDatasource.login(
        email: email,
        password: password,
      );

      final firebaseUser = credential.user;

      if (firebaseUser == null) {
        return const Left(AuthFailure("Login failed"));
      }
      await firebaseUser.reload();

      if (!firebaseUser.emailVerified) {
        return const Left(AuthFailure("Please verify your email first"));
      }

      final userModel = await firestoreDatasource.getUser(firebaseUser.uid);

      // CACHE THE USER LOCALLY SO IT'S AVAILABLE OFFLINE/ON RESTART!
      await profileLocalDatasource.upsertProfile(
        LocalProfileTableCompanion(
          userId: Value(firebaseUser.uid),
          username: Value(userModel.username),
          isSynced: const Value(true),
        ),
      );

      final entity = userModel.toEntity(
        email: firebaseUser.email!,
        isEmailVerified: firebaseUser.emailVerified,
      );
      return Right(entity);
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final credential = await authDatasource.signUp(
        email: email,
        password: password,
      );
      final firebaseUser = credential.user;

      if (firebaseUser == null) {
        return const Left(AuthFailure("user creation failed"));
      }

      await authDatasource.sendEmailVerification();

      await firestoreDatasource.createUser(
        uid: firebaseUser.uid,
        username: username,
        email: email,
      );

      await profileLocalDatasource.upsertProfile(
        LocalProfileTableCompanion(
          userId: Value(firebaseUser.uid),
          username: Value(username),
          isSynced: const Value(true),
        ),
      );

      return const Right(null);
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await authDatasource.logout();
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> forgetPassword({required String email}) async {
    try {
      await authDatasource.forgetPassword(email: email);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    }
  }
}
