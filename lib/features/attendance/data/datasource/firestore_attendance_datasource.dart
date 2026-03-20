import 'package:campus_connect/core/errors/failures.dart';
import 'package:campus_connect/features/attendance/data/models/attendance_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';

class FirestoreAttendanceDatasource {
  final FirebaseFirestore firestore;

  FirestoreAttendanceDatasource({required this.firestore});

  Future<Either<Failure, void>> upsertAttendance({
    required String userId,
    required AttendanceModel model,
  }) async {
    try {
      final docRef = firestore
          .collection('users')
          .doc(userId)
          .collection('subjects')
          .doc(model.subjectId)
          .collection('attendance')
          .doc(model.lectureId);
      await docRef.set(model.toMap());
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, List<AttendanceModel>>> getAttendance({
    required String userId,
    required String subjectId,
  }) async {
    try {
      final snapshot = await firestore
          .collection('users')
          .doc(userId)
          .collection('subjects')
          .doc(subjectId)
          .collection('attendance')
          .orderBy('markedAt', descending: true)
          .get();

      final attendanceList = snapshot.docs
          .map((doc) => AttendanceModel.fromMap(doc.data()))
          .toList();
      return right(attendanceList);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}

/// lowest layer talking to database directly
/// We use upsert (set with lectureId) to avoid duplicate attendance records 
/// and ensure idempotency, especially in cases like multiple taps or offline sync retries.
/// users/{userId}/subjects/{subjectId}/attendance/{lectureId} => firestore path