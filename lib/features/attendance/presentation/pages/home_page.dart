import 'package:campus_connect/core/widgets/drawer.dart';
import 'package:campus_connect/features/attendance/presentation/widgets/dashboard_card.dart';
import 'package:campus_connect/features/attendance/presentation/widgets/feature_cards.dart';
import 'package:campus_connect/features/attendance/presentation/widgets/subject_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_event.dart';
import '../../../auth/presentation/bloc/auth_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthUnauthenticated) {
          context.go('/welcome');
        }

        if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        String? userId;
        String? username;

        if (state is AuthAuthenticated) {
          userId = state.user.id;
          username = state.user.username;
        }

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              'Hey, $username!',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            backgroundColor: Colors.white,
            centerTitle: false,
          ),
          endDrawer: AppDrawer(),

          body: CustomScrollView(
            slivers: [
              /// DASHBOARD GRID
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 2.5,
                  ),
                  delegate: SliverChildListDelegate([
                    DashboardCard(
                      title: 'Overall Attendance',
                      value: '86%',
                      icon: Icons.check_circle,
                      color: Colors.green,
                    ),
                    DashboardCard(
                      title: 'GPA',
                      value: '7.5/10',
                      icon: Icons.check_circle,
                      color: Colors.green,
                    ),
                    DashboardCard(
                      title: "Safe to Bunk",
                      value: "3 Subjects",
                      icon: Icons.check_circle,
                      color: Colors.orange,
                    ),
                    DashboardCard(
                      title: "In Danger",
                      value: "2 Subjects",
                      icon: Icons.warning,
                      color: Colors.red,
                    ),
                  ]),
                ),
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

              /// FEATURES GRID
              SliverPadding(
                padding: const EdgeInsets.all(016),
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
                      color: Colors.blue,
                      onTap: () {},
                    ),
                    FeatureCard(
                      title: "Events",
                      subtitle: "3 upcoming",
                      icon: Icons.event,
                      color: Colors.purple,
                      onTap: () {},
                    ),
                    FeatureCard(
                      title: "Discussions",
                      subtitle: "5 active threads",
                      icon: Icons.forum,
                      color: Colors.orange,
                      onTap: () {},
                    ),
                    FeatureCard(
                      title: "Blogs",
                      subtitle: "Latest posts",
                      icon: Icons.article,
                      color: Colors.teal,
                      onTap: () {},
                    ),
                  ]),
                ),
              ),

              /// TITLE
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Attendance Breakdown',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),

              /// SUBJECT LIST
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    SubjectCard(
                      subjectName: "DBMS",
                      percentage: 68,
                      statusText: "Must attend next 4 lectures",
                      statusColor: Colors.red,
                    ),
                    SubjectCard(
                      subjectName: "Operating Systems",
                      percentage: 82,
                      statusText: "Can bunk 3 lectures",
                      statusColor: Colors.green,
                    ),
                    SubjectCard(
                      subjectName: "Computer Networks",
                      percentage: 75,
                      statusText: "Maintain carefully",
                      statusColor: Colors.orange,
                    ),
                    SubjectCard(
                      subjectName: "Software Engineering",
                      percentage: 82,
                      statusText: "Can bunk 3 lectures",
                      statusColor: Colors.green,
                    ),
                    SubjectCard(
                      subjectName: "OOP",
                      percentage: 82,
                      statusText: "Can bunk 3 lectures",
                      statusColor: Colors.green,
                    ),
                  ]),
                ),
              ),

              /// FEATURES TITLE
            ],
          ),
        );
      },
    );
  }
}
