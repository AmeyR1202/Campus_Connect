import 'package:campus_connect/core/session/session_cubit.dart';
import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:campus_connect/core/widgets/loader.dart';
import 'package:campus_connect/features/attendance/domain/entities/attendance_entity.dart';
import 'package:flutter/material.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/attendance_bloc/attendance_bloc.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/attendance_bloc/attendance_event.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/attendance_bloc/attendance_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SubjectHistoryPage extends StatefulWidget {
  final String subjectId;

  const SubjectHistoryPage({super.key, required this.subjectId});

  @override
  State<SubjectHistoryPage> createState() => _SubjectHistoryPageState();
}

class _SubjectHistoryPageState extends State<SubjectHistoryPage> {
  late String userId;
  late String subjectId;
  @override
  void initState() {
    super.initState();
    final sessionUser = context.read<SessionCubit>().state.user;
    if (sessionUser == null) {
      throw Exception("User not logged in");
    }
    userId = sessionUser.id;
    subjectId = widget.subjectId;
    context.read<AttendanceBloc>().add(
      FetchAttendanceEvent(userId: userId, subjectId: widget.subjectId),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppThemeHelper.colors.iconPrimary),
        title: Text(
          "${widget.subjectId.toUpperCase()} History",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: BlocBuilder<AttendanceBloc, AttendanceState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: Loader());
          }

          if (state.error != null) {
            return Center(child: Text(state.error!));
          }

          final history = state.attendance;

          if (history == null || history.isEmpty) {
            return const Center(child: Text("No history available"));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: history.length,
            itemBuilder: (context, index) {
              final lecture = history[index];

              return Card(
                color: AppThemeHelper.colors.surfaceVariant,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // STATUS ICON
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        child: Icon(
                          Icons.circle,
                          size: 14,
                          color: _getColor(lecture.status),
                        ),
                      ),

                      const SizedBox(width: 12),

                      // CONTENT
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // DATE
                            Text(
                              DateFormat(
                                'EEE, dd MMM yyyy',
                              ).format(lecture.markedAt),
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),

                            const SizedBox(height: 4),

                            // STATUS TEXT
                            Text(
                              _getFullLabel(lecture.status),
                              style: TextStyle(
                                color: _getColor(lecture.status),
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            const SizedBox(height: 10),

                            // CHIPS
                            Wrap(
                              spacing: 8,
                              children: AttendanceStatus.values.map((status) {
                                final isSelected = lecture.status == status;

                                return ChoiceChip(
                                  label: Text(_getLabel(status)),
                                  selected: isSelected,
                                  selectedColor: _getColor(
                                    status,
                                  ).withValues(alpha: 0.2),
                                  onSelected: (_) {
                                    context.read<AttendanceBloc>().add(
                                      UpdateLectureEvent(
                                        userId: userId,
                                        subjectId: widget.subjectId,
                                        lectureId: lecture.lectureId,
                                        status: status,
                                      ),
                                    );
                                  },
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

String _getFullLabel(AttendanceStatus status) {
  switch (status) {
    case AttendanceStatus.present:
      return "Present";
    case AttendanceStatus.absent:
      return "Absent";
    case AttendanceStatus.cancelled:
      return "Cancelled";
  }
}

String _getLabel(AttendanceStatus status) {
  switch (status) {
    case AttendanceStatus.present:
      return "P";
    case AttendanceStatus.absent:
      return "A";
    case AttendanceStatus.cancelled:
      return "C";
  }
}

Color _getColor(AttendanceStatus status) {
  switch (status) {
    case AttendanceStatus.present:
      return AppThemeHelper.colors.success;
    case AttendanceStatus.absent:
      return AppThemeHelper.colors.error;
    case AttendanceStatus.cancelled:
      return AppThemeHelper.colors.surfaceVariant;
  }
}
