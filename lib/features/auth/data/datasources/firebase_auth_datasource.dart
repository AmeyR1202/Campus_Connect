import 'package:campus_connect/core/errors/app_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthDatasource {
  final FirebaseAuth firebaseAuth;

  FirebaseAuthDatasource(this.firebaseAuth);

  String _getFriendlyMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return 'The email address is badly formatted.';
      case 'user-disabled':
        return 'This user account has been disabled.';
      case 'user-not-found':
        return 'No user found for that email.';
      case 'wrong-password':
      case 'invalid-credential':
        return 'Invalid email or password.';
      case 'email-already-in-use':
        return 'An account already exists for that email.';
      case 'weak-password':
        return 'The password provided is too weak.';
      case 'too-many-requests':
        return 'Too many login attempts. Please try again later.';
      default:
        return e.message ??
            'An authentication error occurred. Please try again.';
    }
  }

  Future<UserCredential> signUp({
    required String email,
    required String password,
  }) async {
    try {
      return await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw AuthException(_getFriendlyMessage(e));
    }
  }

  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    try {
      return await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw AuthException(_getFriendlyMessage(e));
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      final user = firebaseAuth.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification(
          ActionCodeSettings(
            url: 'https://campusconnect-49054.firebaseapp.com/success',
            handleCodeInApp: true,
            androidPackageName: 'com.example.campus_connect',
            androidInstallApp: true,
            androidMinimumVersion: '12',
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      throw AuthException(_getFriendlyMessage(e));
    }
  }

  User? getFirebaseUser() {
    return firebaseAuth.currentUser;
  }

  Future<void> logout() async {
    try {
      await firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw AuthException(_getFriendlyMessage(e));
    }
  }

  Future<void> forgetPassword({required String email}) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw AuthException(_getFriendlyMessage(e));
    }
  }
}
