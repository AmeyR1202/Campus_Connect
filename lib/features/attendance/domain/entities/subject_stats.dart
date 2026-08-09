import 'package:campus_connect/core/constants/app_constants.dart';
import 'package:equatable/equatable.dart';

class SubjectStats extends Equatable {
  final String subjectId;
  final double percentage;
  final int total;
  final int attended;
  final int canBunk;
  final int mustAttend;

  const SubjectStats({
    required this.subjectId,
    required this.percentage,
    required this.total,
    required this.attended,
    required this.canBunk,
    required this.mustAttend,
  });

  // Business Logic Getter: Check if this subject meets the minimum college requirements
  bool get isSafe => percentage >= AppConstants.targetAttendance;

  @override
  List<Object?> get props => [
    subjectId,
    percentage,
    total,
    attended,
    canBunk,
    mustAttend,
  ];
}
