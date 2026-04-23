import 'package:campus_connect/core/layout/app_spacing.dart';
import 'package:campus_connect/core/session/session_cubit.dart';
import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:campus_connect/core/widgets/empty_state_widget.dart';
import 'package:campus_connect/core/widgets/loader.dart';
import 'package:campus_connect/features/attendance/domain/entities/subject_stats.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/attendance_bloc/attendance_bloc.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/attendance_bloc/attendance_event.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/attendance_bloc/attendance_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  @override
  void initState() {
    super.initState();
    final user = context.read<SessionCubit>().state.user;
    if (user != null) {
      context.read<AttendanceBloc>().add(
        FetchAllSubjectsStatsEvent(userId: user.id),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AttendanceBloc, AttendanceState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: Loader());
          }

          if (state.error != null) {
            return Center(child: Text(state.error!));
          }

          final stats = state.subjectStats;
          if (stats.isEmpty) {
            return Padding(
              padding: EdgeInsets.all(AppSpacing.padding(context)),
              child: const Column(children: [EmptyStateWidget()]),
            );
          }

          final totalClasses = stats.fold(0, (sum, s) => sum + s.total);
          final totalAttended = stats.fold(0, (sum, s) => sum + s.attended);
          final overallPercentage = totalClasses == 0
              ? 0.0
              : (totalAttended / totalClasses) * 100;

          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: _buildHeader(overallPercentage)),
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return _buildSubjectCard(context, stats[index]);
                  }, childCount: stats.length),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeader(double percentage) {
    final isSafe = percentage >= 75;
    final color = isSafe
        ? AppThemeHelper.colors.success
        : AppThemeHelper.colors.error;

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Overall Attendance',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppThemeHelper.colors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${percentage.toStringAsFixed(1)}%',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                      color: color,
                    ),
                  ),
                ],
              ),
              Icon(
                isSafe
                    ? Icons.sentiment_very_satisfied
                    : Icons.warning_amber_rounded,
                size: 48,
                color: color,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            isSafe
                ? "You're maintaining a strong overall attendance. Keep it up!"
                : "Your overall attendance is below 75%. You need to start attending more lectures.",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppThemeHelper.colors.textSecondary,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppThemeHelper.colors.surfaceVariant.withValues(
                alpha: 0.5,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("💡", style: TextStyle(fontSize: 16)),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "Fun Fact: Bunking 1 lecture requires you to attend 3 more lectures just to safely cover it up. Choose wisely! 💀",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppThemeHelper.colors.textTertiary,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubjectCard(BuildContext context, SubjectStats stat) {
    final isSafe = stat.percentage >= 75;
    final color = isSafe
        ? AppThemeHelper.colors.success
        : AppThemeHelper.colors.error;

    return GestureDetector(
      onTap: () {
        context.push('/subjects/${stat.subjectId}/history');
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppThemeHelper.colors.surfaceVariant.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppThemeHelper.colors.muted.withValues(alpha: 0.1),
          ),
        ),
        child: Row(
          children: [
            // Circular Progress
            SizedBox(
              width: 50,
              height: 50,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    value: stat.total == 0 ? 0 : stat.percentage / 100,
                    strokeWidth: 5,
                    backgroundColor: AppThemeHelper.colors.muted.withValues(
                      alpha: 0.2,
                    ),
                    color: color,
                    strokeCap: StrokeCap.round,
                  ),
                  Center(
                    child: Text(
                      '${stat.percentage.toStringAsFixed(0)}%',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppThemeHelper.colors.textTertiary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),

            // Text info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    stat.subjectId.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        '${stat.attended}/${stat.total} Attended',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppThemeHelper.colors.textSecondary,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: color.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          isSafe
                              ? 'Can Bunk: ${stat.canBunk}'
                              : 'Must Attend: ${stat.mustAttend}',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: color,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Arrow indicator
            Icon(Icons.chevron_right, color: AppThemeHelper.colors.muted),
          ],
        ),
      ),
    );
  }
}
