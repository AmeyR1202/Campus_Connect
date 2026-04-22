import 'package:campus_connect/core/errors/failures.dart';
import 'package:campus_connect/features/attendance/data/models/attendance_model.dart';
import 'package:campus_connect/features/attendance/data/models/subject_base_stats_model.dart';
import 'package:campus_connect/features/attendance/domain/entities/attendance_entity.dart';
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
          .collection('attendance')
          .where('subjectId', isEqualTo: subjectId)
          .get();

      final attendanceList = snapshot.docs
          .map((doc) => AttendanceModel.fromMap(doc.data()))
          .toList();
      return right(attendanceList);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, List<AttendanceModel>>> getAllAttendance({
    required String userId,
  }) async {
    try {
      final subjectsSnapshots = await firestore
          .collection('users')
          .doc(userId)
          .collection('attendance')
          .get();

      final list = subjectsSnapshots.docs
          .map((doc) => AttendanceModel.fromMap(doc.data()))
          .toList();

      return right(list);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, void>> updateLecture({
    required String userId,
    required String subjectId,
    required String lectureId,
    required AttendanceStatus status,
  }) async {
    try {
      final docRef = firestore
          .collection('users')
          .doc(userId)
          .collection('attendance')
          .doc(lectureId);
      await docRef.update({'status': status.name});
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, void>> setBaseStats({
    required String userId,
    required SubjectBaseStatsModel model,
  }) async {
    try {
      await firestore
          .collection('users')
          .doc(userId)
          .collection('base_stats')
          .doc(model.subjectId)
          .set(model.toMap());
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, List<SubjectBaseStatsModel>>> getAllBaseStats({
    required String userId,
  }) async {
    try {
      final snapshot = await firestore
          .collection('users')
          .doc(userId)
          .collection('base_stats')
          .get();

      final list = snapshot.docs
          .map((doc) => SubjectBaseStatsModel.fromMap(doc.data(), doc.id))
          .toList();
      return right(list);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
