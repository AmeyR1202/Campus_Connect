import 'package:campus_connect/core/session/session_cubit.dart';
import 'package:campus_connect/core/session/session_state.dart';
import 'package:campus_connect/core/theme/feature_colors.dart';
import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:campus_connect/core/widgets/drawer.dart';
import 'package:campus_connect/core/widgets/empty_state_widget.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/attendance_bloc/attendance_bloc.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/attendance_bloc/attendance_event.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/attendance_bloc/attendance_state.dart';
import 'package:campus_connect/features/attendance/presentation/widgets/attendance_stats_card.dart';
import 'package:campus_connect/features/attendance/presentation/widgets/feature_cards.dart';
import 'package:campus_connect/features/attendance/presentation/widgets/subject_card.dart';
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
      context.go('/welcome');
      return;
    }

    final userId = sessionUser.id;
    context.read<AttendanceBloc>().add(
      FetchAllSubjectsStatsEvent(userId: userId),
    );
  }

  @override
  Widget build(BuildContext context) {
    final sessionUser = context.watch<SessionCubit>().state.user;

    final username = sessionUser?.username ?? "User";
    return BlocListener<SessionCubit, SessionState>(
      listener: (context, state) {
        if (!state.isAuthenticated) {
          context.go('/welcome');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppThemeHelper.colors.iconPrimary),
          title: Text(
            'Hey, $username!',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: false,
        ),
        endDrawer: AppDrawer(),

        body: CustomScrollView(
          slivers: [
            BlocBuilder<AttendanceBloc, AttendanceState>(
              builder: (context, state) {
                final stats = state.subjectStats;
                // print(stats);

                if (stats.isEmpty) {
                  return SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: EmptyStateWidget(),
                    ),
                  );
                }

                // final safeCount = subjects
                //     .where((s) => s.percentage >= 75)
                //     .length;

                // final dangerCount = subjects
                //     .where((s) => s.percentage < 75)
                //     .length;

                // final totalClasses = subjects.fold(0, (sum, s) => sum + s.total);

                // final totalAttended = subjects.fold(
                //   0,
                //   (sum, s) => sum + s.attended,
                // );

                final totalClasses = stats.fold(0, (sum, s) => sum + s.total);
                final totalAttended = stats.fold(
                  0,
                  (sum, s) => sum + s.attended,
                );
                final safeCount = stats.where((s) => s.percentage > 75).length;
                final dangerCount = stats
                    .where((s) => s.percentage < 75)
                    .length;

                final overallPercentage = totalClasses == 0
                    ? 0.0
                    : (totalAttended / totalClasses) * 100;
                return SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 2.5,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        AttendanceStatsCard(
                          title: 'Overall Attendance',
                          value: '${overallPercentage.toStringAsFixed(1)}%',
                          icon: Icons.check_circle,
                          color: AppThemeHelper.colors.success,
                          onPressed: () {},
                        ),
                        AttendanceStatsCard(
                          title: "Safe to Bunk",
                          value: "$safeCount Subject(s)",
                          icon: Icons.check_circle,
                          color: AppThemeHelper.colors.success,
                          onPressed: () {
                            context.push('/subject-details', extra: "safe");
                          },
                        ),
                        AttendanceStatsCard(
                          title: "In Danger",
                          value: "$dangerCount Subject(s)",
                          icon: Icons.warning,
                          color: AppThemeHelper.colors.error,
                          onPressed: () {
                            context.push('/subject-details', extra: "danger");
                          },
                        ),
                        AttendanceStatsCard(
                          title: "GPA",
                          value: '--/10',
                          icon: Icons.grade,
                          color: AppThemeHelper.colors.info,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Campus Features',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                  ),
                ),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 2.2,
                ),
                delegate: SliverChildListDelegate([
                  FeatureCard(
                    title: "Lost & Found",
                    subtitle: "2 new items",
                    icon: Icons.search,
                    color: Feature.lostFound,
                    onTap: () => context.go('/lost&found'),
                  ),
                  FeatureCard(
                    title: "Events",
                    subtitle: "3 upcoming",
                    icon: Icons.event,
                    color: Feature.timetable,
                    onTap: () => context.go('/events'),
                  ),
                  FeatureCard(
                    title: "Discussions",
                    subtitle: "5 active threads",
                    icon: Icons.forum,
                    color: Feature.discussions,
                    onTap: () {
                      context.go('/discussions');
                    },
                  ),
                  FeatureCard(
                    title: "Blogs",
                    subtitle: "Latest posts",
                    icon: Icons.article,
                    color: Feature.blogs,
                    onTap: () => context.go('/blogs'),
                  ),
                ]),
              ),
            ),

            BlocBuilder<AttendanceBloc, AttendanceState>(
              builder: (context, state) {
                final stats = state.subjectStats;

                if (stats.isEmpty) {
                  return const SliverToBoxAdapter(child: SizedBox.shrink());
                }
                return SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Subjects',
                          style: Theme.of(context).textTheme.bodyLarge!
                              .copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 22,
                              ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: stats.map((s) {
                            final isSafe = s.percentage >= 75;

                            return GestureDetector(
                              onTap: () {
                                context.push('/attendance', extra: s.subjectId);
                              },
                              child: SubjectCard(
                                subjectName: s.subjectId.toUpperCase(),
                                percentage: s.percentage,
                                statusText: s.total == 0
                                    ? "Start tracking"
                                    : (isSafe
                                          ? "Can bunk ${s.canBunk}"
                                          : "Must attend ${s.mustAttend}"),
                                statusColor: isSafe
                                    ? AppThemeHelper.colors.success
                                    : AppThemeHelper.colors.error,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
