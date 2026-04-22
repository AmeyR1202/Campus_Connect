import 'package:campus_connect/core/session/session_cubit.dart';
import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:campus_connect/core/widgets/loader.dart';
import 'package:campus_connect/features/attendance/domain/entities/attendance_entity.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/attendance_bloc/attendance_bloc.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/attendance_bloc/attendance_event.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/attendance_bloc/attendance_state.dart';
import 'package:flutter/material.dart';
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

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.info, size: 18),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "You can change the status of every lecture you attended to keep your history tracking accurate.",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppThemeHelper.colors.textSecondary,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: history.length,
                  itemBuilder: (context, index) {
                    final lecture = history[index];

                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: AppThemeHelper.colors.surfaceVariant.withValues(
                          alpha: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: AppThemeHelper.colors.muted.withValues(
                            alpha: 0.1,
                          ),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Date & Status Indicator
                          Row(
                            children: [
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: _getColor(lecture.status),
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: _getColor(
                                        lecture.status,
                                      ).withValues(alpha: 0.3),
                                      blurRadius: 6,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 14),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    DateFormat(
                                      'MMM dd, yyyy',
                                    ).format(lecture.markedAt),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: AppThemeHelper.colors.textTertiary,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    _getFullLabel(lecture.status),
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: _getColor(lecture.status),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          // Full Segmented Editor
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: AppThemeHelper.colors.surface,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: AppThemeHelper.colors.muted.withValues(
                                  alpha: 0.1,
                                ),
                              ),
                            ),
                            child: Row(
                              children: AttendanceStatus.values.map((status) {
                                final isSelected = lecture.status == status;
                                return Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      if (!isSelected) {
                                        context.read<AttendanceBloc>().add(
                                          UpdateLectureEvent(
                                            userId: userId,
                                            subjectId: widget.subjectId,
                                            lectureId: lecture.lectureId,
                                            status: status,
                                          ),
                                        );
                                      }
                                    },
                                    child: AnimatedContainer(
                                      duration: const Duration(
                                        milliseconds: 200,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? _getColor(
                                                status,
                                              ).withValues(alpha: 0.15)
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        _getFullLabel(status),
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: isSelected
                                              ? FontWeight.w700
                                              : FontWeight.w500,
                                          color: isSelected
                                              ? _getColor(status)
                                              : AppThemeHelper
                                                    .colors
                                                    .textSecondary,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ); // Container
                  },
                ), // ListView.builder
              ), // Expanded
            ],
          ); // Column
        },
      ), // BlocBuilder
    ); // Scaffold
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
