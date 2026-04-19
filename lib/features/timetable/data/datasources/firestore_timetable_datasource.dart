import 'package:campus_connect/core/errors/app_exception.dart';
import 'package:campus_connect/features/timetable/data/models/lecture_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class FirestoreTimetableDatasource {
  final FirebaseFirestore firestore;

  FirestoreTimetableDatasource({required this.firestore});

  Future<List<LectureModel>> getLecturesForDay(
    String userId,
    DateTime date,
  ) async {
    try {
      final dayName = DateFormat('EEE').format(date);

      final result = await firestore
          .collection('users')
          .doc(userId)
          .collection('lectures')
          .where('day', isEqualTo: dayName)
          .get();

      return result.docs
          .map((doc) => LectureModel.fromMap(doc.data(), doc.id))
          .toList();
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
    }
  }

  Future<List<LectureModel>> getAllLectures(String userId) async {
    try {
      final result = await firestore
          .collection('users')
          .doc(userId)
          .collection('lectures')
          .get();

      return result.docs
          .map((doc) => LectureModel.fromMap(doc.data(), doc.id))
          .toList();
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
    }
  }

  Future<void> addLecture(
    String userId,
    String lectureId,
    Map<String, dynamic> map,
  ) async {
    try {
      await firestore
          .collection('users')
          .doc(userId)
          .collection('lectures')
          .doc(lectureId)
          .set({...map, 'createdAt': FieldValue.serverTimestamp()});
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? 'Failed to add lecture');
    }
  }

  Future<void> updateLecture(
    String userId,
    String lectureId,
    Map<String, dynamic> map,
  ) async {
    try {
      await firestore
          .collection('users')
          .doc(userId)
          .collection('lectures')
          .doc(lectureId)
          .update({...map, 'updatedAt': FieldValue.serverTimestamp()});
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
    }
  }

  Future<void> deleteLecture(String userId, String lectureId) async {
    try {
      await firestore
          .collection('users')
          .doc(userId)
          .collection('lectures')
          .doc(lectureId)
          .delete();
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
    }
  }
}
