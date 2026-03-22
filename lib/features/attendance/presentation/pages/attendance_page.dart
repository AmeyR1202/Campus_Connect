import 'package:campus_connect/features/attendance/domain/entities/attendance_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/attendance_bloc/attendance_bloc.dart';
import '../bloc/attendance_bloc/attendance_event.dart';
import '../bloc/attendance_bloc/attendance_state.dart';

class AttendancePage extends StatelessWidget {
  final String userId;
  final String subjectId;

  const AttendancePage({
    super.key,
    required this.userId,
    required this.subjectId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Attendance')),
      body: BlocBuilder<AttendanceBloc, AttendanceState>(
        builder: (context, state) {
          return Stack(
            children: [
              Column(
                children: [
                  _buildStatsSection(state),

                  Expanded(child: _buildAttendanceList(state)),

                  _buildActionButtons(context),
                ],
              ),

              if (state.isLoading)
                const Center(child: CircularProgressIndicator()),

              if (state.error != null) Center(child: Text(state.error!)),
            ],
          );
        },
      ),
    );
  }

  Widget _buildStatsSection(AttendanceState state) {
    final stats = state.stats;

    if (stats == null) {
      return const SizedBox();
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            '${stats.percentage.toStringAsFixed(1)}%',
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Text('Attended: ${stats.attendedClasses}'),
          Text('Total: ${stats.totalClasses}'),
          Text('Can bunk: ${stats.canBunk}'),
          Text('Must attend: ${stats.mustAttend}'),
        ],
      ),
    );
  }

  Widget _buildAttendanceList(AttendanceState state) {
    final list = state.attendance;

    if (list == null) {
      return const Center(child: Text('No data'));
    }

    if (list.isEmpty) {
      return const Center(child: Text('No attendance yet'));
    }

    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        final item = list[index];

        return ListTile(
          title: Text(item.subjectId),
          subtitle: Text(item.markedAt.toString()),
          trailing: Text(item.status.name),
        );
      },
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              final entity = AttendanceEntity(
                lectureId: DateTime.now().toString(),
                subjectId: subjectId,
                status: AttendanceStatus.present,
                markedAt: DateTime.now(),
              );
              context.read<AttendanceBloc>().add(
                AddAttendanceEvent(userId: userId, entity: entity),
              );
            },
            child: const Text('Present'),
          ),
          ElevatedButton(
            onPressed: () {
              final entity = AttendanceEntity(
                lectureId: DateTime.now().toString(),
                subjectId: subjectId,
                status: AttendanceStatus.absent,
                markedAt: DateTime.now(),
              );
              context.read<AttendanceBloc>().add(
                AddAttendanceEvent(userId: userId, entity: entity),
              );
            },
            child: const Text('Absent'),
          ),
        ],
      ),
    );
  }
}
