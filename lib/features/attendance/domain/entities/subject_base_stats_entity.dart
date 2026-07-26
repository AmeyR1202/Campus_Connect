import 'package:equatable/equatable.dart';

class SubjectBaseStatsEntity extends Equatable {
  final String subjectId;
  final int attended;
  final int missed;
  final int cancelled;

  const SubjectBaseStatsEntity({
    required this.subjectId,
    required this.attended,
    required this.missed,
    required this.cancelled,
  });

  @override
  List<Object?> get props => [subjectId, attended, missed, cancelled];
}
