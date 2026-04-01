import 'package:campus_connect/core/errors/app_exception.dart';
import 'package:campus_connect/features/auth/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreUserDatasource {
  final FirebaseFirestore firestore;

  FirestoreUserDatasource(this.firestore);

  Future<void> createUser({
    required String uid,
    required String username,
    required String email,
    required String branch,
    required String year,
    required String semester,
    required String batch,
  }) async {
    try {
      await firestore.collection('users').doc(uid).set({
        'username': username,
        'email': email,
        'branch': branch,
        'semester': semester,
        'year': year,
        'batch': batch,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      final docSnapshot = await firestore.collection('users').doc(uid).get();

      if (!docSnapshot.exists) {
        throw ServerException('User profile not found in Firestore');
      }

      final data = docSnapshot.data();

      if (data == null) {
        throw ServerException('User data is null');
      }

      return UserModel.fromFirestore(data, docSnapshot.id);
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
    }
  }
}
