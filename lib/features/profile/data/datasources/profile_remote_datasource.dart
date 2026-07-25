import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileRemoteDatasource {
  final FirebaseFirestore firestore;

  ProfileRemoteDatasource({required this.firestore});

  Future<void> updateUsername({
    required String userId,
    required String newUserName,
  }) async {
    await firestore.collection('users').doc(userId).update({
      'username': newUserName,
    });
  }
}
