import 'package:campus_connect/core/errors/app_exception.dart';
import 'package:campus_connect/features/session/data/models/session_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreTimetableDatasource {
  final FirebaseFirestore firestore;

  FirestoreTimetableDatasource({required this.firestore});

  CollectionReference<Map<String, dynamic>> _sessionsRef(String uid) =>
      firestore.collection('users').doc(uid).collection('sessions');

  // ── READ ──────────────────────────────────────────────────────────────────

  Future<List<SessionModel>> getSessions(String uid) async {
    try {
      final snapshot = await _sessionsRef(uid).get();
      return snapshot.docs
          .map((doc) => SessionModel.fromMap(doc.data(), doc.id))
          .toList();
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
    }
  }

  // ── CREATE ─────────────────────────────────────────────────────────────────
  // Takes a plain map; the Firestore doc ID becomes the session's ID.
  Future<String> addSession(String uid, Map<String, dynamic> map) async {
    try {
      final docRef = _sessionsRef(uid).doc();
      await docRef.set(map);
      return docRef.id;
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
    }
  }

  // ── UPDATE ─────────────────────────────────────────────────────────────────

  Future<void> updateSession(
    String uid,
    String sessionId,
    Map<String, dynamic> map,
  ) async {
    try {
      await _sessionsRef(uid).doc(sessionId).update(map);
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
    }
  }

  // ── DELETE ─────────────────────────────────────────────────────────────────

  Future<void> deleteSession(String uid, String sessionId) async {
    try {
      await _sessionsRef(uid).doc(sessionId).delete();
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
    }
  }
}
