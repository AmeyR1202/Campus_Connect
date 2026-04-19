import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/attendance_bloc/attendance_bloc.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/attendance_bloc/attendance_state.dart';
import 'package:campus_connect/features/attendance/presentation/widgets/lecture_stats_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SubjectDetailsPage extends StatelessWidget {
  final String filter;
  const SubjectDetailsPage({super.key, required this.filter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppThemeHelper.colors.iconPrimary),
        title: Text(
          filter == "safe" ? "Safe Subjects" : "Danger Subjects",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: BlocBuilder<AttendanceBloc, AttendanceState>(
        builder: (context, state) {
          final allSubjects = state.subjectStats;

          final filtered = filter == 'safe'
              ? allSubjects.where((s) => s.percentage > 75).toList()
              : allSubjects.where((s) => s.percentage < 75).toList();
          if (filtered.isEmpty) {
            return Center(
              child: Text(
                filter == 'safe'
                    ? "No Safe Subject Found"
                    : "No Danger Subject Found",
              ),
            );
          }
          return ListView.builder(
            itemCount: filtered.length,
            itemBuilder: (context, index) {
              final s = filtered[index];

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            s.subjectId.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: s.percentage >= 75
                                  ? AppThemeHelper.colors.success.withValues(
                                      alpha: 0.15,
                                    )
                                  : AppThemeHelper.colors.error.withValues(
                                      alpha: 0.15,
                                    ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "Overall: ${s.percentage.toStringAsFixed(1)}%",
                              style: TextStyle(
                                color: s.percentage >= 75
                                    ? AppThemeHelper.colors.success
                                    : AppThemeHelper.colors.error,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: s.percentage / 100,
                          minHeight: 8,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            s.percentage >= 75
                                ? AppThemeHelper.colors.success
                                : AppThemeHelper.colors.error,
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 4,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          LectureStatsChip(
                            s: s,
                            label: 'Total Lectures: ',
                            value: "${s.total}",
                          ),
                          LectureStatsChip(
                            s: s,
                            label: "Attended: ",
                            value: "${s.attended}",
                          ),
                          LectureStatsChip(
                            s: s,
                            label: 'Can Bunk: ',
                            value: "${s.canBunk}",
                          ),
                          LectureStatsChip(
                            s: s,
                            label: 'Must Attend: ',
                            value: "${s.mustAttend}",
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      InkWell(
                        onTap: () {
                          context.push('/subjects/${s.subjectId}/history');
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppThemeHelper.colors.muted.withValues(
                              alpha: 0.2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,

                            children: [
                              Icon(
                                Icons.history,
                                color: AppThemeHelper.colors.iconPrimary,
                                size: 18,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "All History",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
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
