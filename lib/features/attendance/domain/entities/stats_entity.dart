import 'package:equatable/equatable.dart';

class StatsEntity extends Equatable {
  final int totalClasses;
  final int attendedClasses;
  final double percentage;
  final int canBunk;
  final int mustAttend;

  const StatsEntity({
    required this.totalClasses,
    required this.attendedClasses,
    required this.percentage,
    required this.canBunk,
    required this.mustAttend,
  });

  @override
  List<Object?> get props => [
    totalClasses,
    attendedClasses,
    percentage,
    canBunk,
    mustAttend,
  ];
}
