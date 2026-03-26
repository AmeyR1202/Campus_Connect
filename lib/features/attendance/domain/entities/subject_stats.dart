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
