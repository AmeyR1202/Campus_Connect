import 'package:campus_connect/core/layout/app_spacing.dart';
import 'package:campus_connect/core/layout/responsive_builder.dart';
import 'package:campus_connect/core/session/session_cubit.dart';
import 'package:campus_connect/core/theme/feature_colors.dart';
import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:campus_connect/core/widgets/empty_state_widget.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/attendance_bloc/attendance_bloc.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/attendance_bloc/attendance_event.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/attendance_bloc/attendance_state.dart';
import 'package:campus_connect/features/attendance/presentation/widgets/attendance_stats_card.dart';
import 'package:campus_connect/features/attendance/presentation/widgets/bunker_planner.dart';
import 'package:campus_connect/features/attendance/presentation/widgets/feature_cards.dart';
import 'package:campus_connect/features/timetable/presentation/bloc/timetable_bloc.dart';
import 'package:campus_connect/features/timetable/presentation/bloc/timetable_event.dart';
import 'package:campus_connect/features/timetable/presentation/bloc/timetable_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    final sessionUser = context.read<SessionCubit>().state.user;

    if (sessionUser == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go('/welcome');
      });
      return;
    }

    final userId = sessionUser.id;
    context.read<AttendanceBloc>().add(
      FetchAllSubjectsStatsEvent(userId: userId),
    );

    context.read<TimetableBloc>().add(
      GetLecturesForDayEvent(userId: userId, date: DateTime.now()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSpacing.padding(context)),
      child: Scaffold(
        body: ResponsiveBuilder(
          mobile: _buildLayout(context, isTablet: false),
          tablet: _buildLayout(context, isTablet: true),
        ),
      ),
    );
  }

  Widget _buildLayout(BuildContext context, {required bool isTablet}) {
    final double gridAspectRatio = isTablet ? 1.8 : 2.4;
    final double maxFeatureExtent = isTablet ? 300 : 250;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<AttendanceBloc, AttendanceState>(
            builder: (context, state) {
              final stats = state.subjectStats;
              if (stats.isEmpty) {
                return const EmptyStateWidget();
              }

              final totalClasses = stats.fold(0, (sum, s) => sum + s.total);
              final totalAttended = stats.fold(0, (sum, s) => sum + s.attended);
              final safeSubjects = stats
                  .where((s) => s.percentage >= 75)
                  .toList();
              final dangerSubjects = stats
                  .where((s) => s.percentage < 75)
                  .toList();
              final overallPercentage = totalClasses == 0
                  ? 0.0
                  : (totalAttended / totalClasses) * 100;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: maxFeatureExtent,
                      mainAxisSpacing: AppSpacing.md,
                      crossAxisSpacing: AppSpacing.md,
                      childAspectRatio: gridAspectRatio,
                    ),
                    children: [
                      AttendanceStatsCard(
                        title: 'Summary',
                        value: '${overallPercentage.toStringAsFixed(1)}%',
                        icon: Icons.check_circle,
                        color: AppThemeHelper.colors.success,
                        onPressed: () {},
                      ),
                      AttendanceStatsCard(
                        title: "Safe to Bunk",
                        value: safeSubjects.length > 1
                            ? "${safeSubjects.length} Subjects"
                            : "${safeSubjects.length} Subject",
                        icon: Icons.check_circle,
                        color: AppThemeHelper.colors.success,
                        onPressed: () =>
                            context.push('/subject-details', extra: "safe"),
                      ),
                      AttendanceStatsCard(
                        title: "In Danger",
                        value: dangerSubjects.length > 1
                            ? "${dangerSubjects.length} Subjects"
                            : "${dangerSubjects.length} Subject",
                        icon: Icons.warning,
                        color: AppThemeHelper.colors.error,
                        onPressed: () =>
                            context.push('/subject-details', extra: "danger"),
                      ),
                      BlocBuilder<TimetableBloc, TimetableState>(
                        builder: (context, timetableState) {
                          final todayLecture = timetableState.todayLectures;

                          final count = todayLecture.length;
                          return AttendanceStatsCard(
                            title: "Today's Lectures",
                            value: timetableState.isLoading
                                ? '...'
                                : '$count Lectures',
                            icon: Icons.calendar_today,
                            color: AppThemeHelper.colors.info,
                            onPressed: () => context.push('/timetable'),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Text(
                    'Bunk Planning',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  BunkPlannerCard(
                    safeSubjects: safeSubjects,
                    dangerSubjects: dangerSubjects,
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            'Campus Features',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: AppSpacing.md),
          GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: maxFeatureExtent,
              mainAxisSpacing: AppSpacing.md,
              crossAxisSpacing: AppSpacing.md,
              childAspectRatio: gridAspectRatio,
            ),
            children: [
              FeatureCard(
                title: "Lost & Found",
                subtitle: "2 new items",
                icon: Icons.search,
                color: Feature.lostFound,
                onTap: () => context.go('/lost&found'),
              ),
              FeatureCard(
                title: "Timetable",
                subtitle: 'My schedule',
                icon: Icons.event,
                color: Feature.timetable,
                onTap: () => context.push('/manage-timetable'),
              ),
              FeatureCard(
                title: "Discussions",
                subtitle: "5 active threads",
                icon: Icons.forum,
                color: Feature.discussions,
                onTap: () => context.go('/discussions'),
              ),
              FeatureCard(
                title: "Blogs",
                subtitle: "Latest posts",
                icon: Icons.article,
                color: Feature.blogs,
                onTap: () => context.go('/blogs'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
