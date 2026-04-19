import 'package:campus_connect/core/session/session_cubit.dart';
import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:campus_connect/core/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppShell extends StatefulWidget {
  final Widget child;
  const AppShell({super.key, required this.child});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  final routes = ['/home', '/attendance', '/manage-timetable', '/profile'];

  void onTap(int index) {
    context.push(routes[index]);
  }

  int getIndex(String location) {
    if (location.startsWith('/attendance')) return 1;
    if (location.startsWith('/manage-timetable')) return 2;
    if (location.startsWith('/profile')) return 3;
    return 0;
  }

  Widget _buildNavbar(int currentIndex) {
    return NavigationBar(
      indicatorColor: AppThemeHelper.colors.primary.withValues(alpha: 0.2),
      height: 70,
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      destinations: [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.bar_chart_outlined),
          selectedIcon: Icon(Icons.bar_chart),
          label: 'Attendance',
        ),
        NavigationDestination(
          icon: Icon(Icons.event_available),
          selectedIcon: Icon(Icons.event),
          label: 'Timetable',
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline),
          selectedIcon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final sessionUser = context.watch<SessionCubit>().state.user;

    final username = sessionUser?.username ?? "User";
    final location = GoRouterState.of(context).uri.toString();
    final currentIndex = getIndex(location);
    return Scaffold(
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
      body: widget.child,
      bottomNavigationBar: _buildNavbar(currentIndex),
    );
  }
}
