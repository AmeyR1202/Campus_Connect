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
      padding: const EdgeInsets.all(16.0),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<AttendanceBloc, AttendanceState>(
                builder: (context, state) {
                  final stats = state.subjectStats;
                  // print(stats);

                  if (stats.isEmpty) {
                    return EmptyStateWidget();
                  }

                  final totalClasses = stats.fold(0, (sum, s) => sum + s.total);
                  final totalAttended = stats.fold(
                    0,
                    (sum, s) => sum + s.attended,
                  );
                  final safeSubjects = stats
                      .where((s) => s.percentage >= 75)
                      .toList();
                  final dangerSubjects = stats
                      .where((s) => s.percentage < 75)
                      .toList();

                  final safeCount = safeSubjects.length;
                  final dangerCount = dangerSubjects.length;

                  final overallPercentage = totalClasses == 0
                      ? 0.0
                      : (totalAttended / totalClasses) * 100;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: AspectRatio(
                              aspectRatio: 2.5,
                              child: AttendanceStatsCard(
                                title: 'Overall Attendance',
                                value:
                                    '${overallPercentage.toStringAsFixed(1)}%',
                                icon: Icons.check_circle,
                                color: AppThemeHelper.colors.success,
                                onPressed: () {},
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: AspectRatio(
                              aspectRatio: 2.5,
                              child: AttendanceStatsCard(
                                title: "Safe to Bunk",
                                value: safeCount > 1
                                    ? "$safeCount Subjects"
                                    : "$safeCount Subject",
                                icon: Icons.check_circle,
                                color: AppThemeHelper.colors.success,
                                onPressed: () {
                                  context.push(
                                    '/subject-details',
                                    extra: "safe",
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: AspectRatio(
                              aspectRatio: 2.5,
                              child: AttendanceStatsCard(
                                title: "In Danger",
                                value: dangerCount > 1
                                    ? "$dangerCount Subjects"
                                    : "$dangerCount Subject",
                                icon: Icons.warning,
                                color: AppThemeHelper.colors.error,
                                onPressed: () {
                                  context.push(
                                    '/subject-details',
                                    extra: "danger",
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: AspectRatio(
                              aspectRatio: 2.5,
                              child: BlocBuilder<TimetableBloc, TimetableState>(
                                builder: (context, timetableState) {
                                  final count =
                                      timetableState.lectures?.length ?? 0;
                                  final isLoading = timetableState.isLoading;

                                  return AttendanceStatsCard(
                                    title: "Today's Lectures",
                                    value: isLoading
                                        ? '...'
                                        : '$count Lectures',
                                    icon: Icons.calendar_today,
                                    color: AppThemeHelper.colors.info,
                                    onPressed: () {
                                      context.push('/timetable');
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Bunk Planning',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(height: 10),
                      BunkPlannerCard(
                        safeSubjects: safeSubjects,
                        dangerSubjects: dangerSubjects,
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 10),
              Text(
                'Campus Features',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                ),
              ),
              SizedBox(height: 10),

              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 2.2,
                          child: FeatureCard(
                            title: "Lost & Found",
                            subtitle: "2 new items",
                            icon: Icons.search,
                            color: Feature.lostFound,
                            onTap: () => context.go('/lost&found'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 2.2,
                          child: FeatureCard(
                            title: "Events",
                            subtitle: "3 upcoming",
                            icon: Icons.event,
                            color: Feature.timetable,
                            onTap: () => context.go('/events'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 2.2,
                          child: FeatureCard(
                            title: "Discussions",
                            subtitle: "5 active threads",
                            icon: Icons.forum,
                            color: Feature.discussions,
                            onTap: () {
                              context.go('/discussions');
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 2.2,
                          child: FeatureCard(
                            title: "Blogs",
                            subtitle: "Latest posts",
                            icon: Icons.article,
                            color: Feature.blogs,
                            onTap: () => context.go('/blogs'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
