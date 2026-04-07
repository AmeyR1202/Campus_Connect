import 'package:campus_connect/features/session/domain/entities/session_entity.dart';
import 'package:equatable/equatable.dart';

class TimetableState extends Equatable {
  final bool isLoading;
  final List<SessionEntity>? sessions;
  final String? error;
  // Track the currently viewed date so the bloc can re-fetch after mutations
  final DateTime? currentDate;

  const TimetableState({
    this.isLoading = false,
    this.sessions,
    this.error,
    this.currentDate,
  });

  TimetableState copyWith({
    bool? isLoading,
    List<SessionEntity>? sessions,
    String? error,
    DateTime? currentDate,
  }) {
    return TimetableState(
      isLoading: isLoading ?? this.isLoading,
      sessions: sessions ?? this.sessions,
      error: error,
      currentDate: currentDate ?? this.currentDate,
    );
  }

  @override
  List<Object?> get props => [isLoading, sessions, error, currentDate];
}
