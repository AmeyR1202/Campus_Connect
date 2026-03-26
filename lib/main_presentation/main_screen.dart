import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatefulWidget {
  final Widget child;
  const MainScreen({super.key, required this.child});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final routes = ['/home', '/attendance', 'timetable', '/profile'];

  void onTap(int index) {
    context.go(routes[index]);
  }

  int getIndex(String location) {
    if (location.startsWith('/attendance')) return 1;
    if (location.startsWith('/timetable')) return 2;
    return 0;
  }

  Widget _buildNavbar(int currentIndex) {
    return NavigationBar(
      backgroundColor: AppThemeHelper.colors.surfaceVariant,
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
    final location = GoRouterState.of(context).uri.toString();
    final currentIndex = getIndex(location);
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: _buildNavbar(currentIndex),
    );
  }
}
