import 'package:campus_connect/core/errors/app_exception.dart';
import 'package:campus_connect/features/attendance/data/models/lecture_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreTimetableDatasource {
  final FirebaseFirestore firestore;

  FirestoreTimetableDatasource({required this.firestore});

  Future<List<LectureModel>> getTimetable({
    required String branch,
    required int semester,
  }) async {
    try {
      final snapshot = await firestore
          .collection('timetables')
          .doc('${branch}_sem_$semester')
          .collection('lectures')
          .get();

      return snapshot.docs
          .map((doc) => LectureModel.fromMap(doc.data()))
          .toList();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
