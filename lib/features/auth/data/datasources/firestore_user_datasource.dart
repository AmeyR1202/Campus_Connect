import 'package:campus_connect/features/auth/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreUserDatasource {
  final FirebaseFirestore firestore;

  FirestoreUserDatasource(this.firestore);

  Future<void> createUser({
    required String uid,
    required String username,
  }) async {
    await firestore.collection('users').doc(uid).set({
      'username': username,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Future<UserModel> getUser(String uid) async {
    final docSnapshot = await firestore.collection('users').doc(uid).get();

    if (!docSnapshot.exists) {
      throw Exception('User profile not found in Firestore');
    }

    final data = docSnapshot.data();

    if (data == null) {
      throw Exception('User data is null');
    }

    return UserModel.fromFirestore(data, docSnapshot.id);
  }
}
