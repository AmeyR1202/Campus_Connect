import 'package:campus_connect/core/session/session_cubit.dart';
import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:campus_connect/features/attendance/domain/entities/attendance_entity.dart';
import 'package:campus_connect/features/attendance/domain/entities/lecture_entity.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/attendance_bloc/attendance_bloc.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/attendance_bloc/attendance_event.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/timetable_bloc/timetable_bloc.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/timetable_bloc/timetable_event.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/timetable_bloc/timetable_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimetablePage extends StatefulWidget {
  const TimetablePage({super.key});

  @override
  State<TimetablePage> createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
  late String userId;
  String branch = 'IT';
  int semester = 6;

  @override
  void initState() {
    super.initState();

    final session = context.read<SessionCubit>().state;

    userId = session.user!.id;
    branch = branch;
    semester = semester;

    context.read<TimetableBloc>().add(
      FetchTimetableEvent(branch: branch, semester: semester),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Today's Lectures"), centerTitle: true),
      body: BlocBuilder<TimetableBloc, TimetableState>(
        builder: (context, state) {
          return Stack(
            children: [
              if (state.lectures == null)
                const SizedBox()
              else if (state.lectures!.isEmpty)
                _buildEmptyState()
              else
                _buildLectureList(state.lectures!),

              if (state.isLoading)
                const Center(child: CircularProgressIndicator()),

              if (state.error != null) Center(child: Text(state.error!)),
            ],
          );
        },
      ),
    );
  }

  // -----------------------------
  // Lecture List
  // -----------------------------
  Widget _buildLectureList(List<LectureEntity> lectures) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: lectures.length,
      itemBuilder: (context, index) {
        final lecture = lectures[index];
        return _lectureCard(context, lecture);
      },
    );
  }

  Widget _lectureCard(BuildContext context, LectureEntity lecture) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppThemeHelper.colors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: AppThemeHelper.colors.textTertiary.withValues(alpha: 0.05),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Subject
          Text(
            lecture.subjectName,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 8),

          // Time
          Text(
            "${lecture.startTime} - ${lecture.endTime}",
            style: TextStyle(color: AppThemeHelper.colors.info),
          ),

          const SizedBox(height: 16),

          // Buttons
          Row(
            children: [
              Expanded(
                child: _actionButton(
                  text: "Present",
                  color: AppThemeHelper.colors.success,
                  onTap: () => _markAttendance(
                    context,
                    lecture,
                    AttendanceStatus.present,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _actionButton(
                  text: "Absent",
                  color: AppThemeHelper.colors.error,
                  onTap: () => _markAttendance(
                    context,
                    lecture,
                    AttendanceStatus.absent,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _actionButton({
    required String text,
    required Color color,
    required VoidCallback onTap,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: onTap,
      child: Text(text),
    );
  }

  void _markAttendance(
    BuildContext context,
    LectureEntity lecture,
    AttendanceStatus status,
  ) {
    final now = DateTime.now();

    final lectureId =
        "${now.year}${now.month}${now.day}_${lecture.startTime}_${lecture.subjectId}";

    final entity = AttendanceEntity(
      lectureId: lectureId,
      subjectId: lecture.subjectId,
      status: status,
      markedAt: now,
    );

    context.read<AttendanceBloc>().add(
      AddAttendanceEvent(userId: userId, entity: entity),
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Text("No lectures today", style: TextStyle(fontSize: 16)),
    );
  }
}
