import 'package:campus_connect/core/session/session_cubit.dart';
import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _revealAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _revealAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.decelerate));

    _controller.forward(); // this will initiate my text animation

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        navigateIfReady();
      }
    });
  }

  Future<void> navigateIfReady() async {
    final isLoggedIn = FirebaseAuth.instance.currentUser != null;

    if (isLoggedIn) {
      await context.read<SessionCubit>().loadOfflineUser();

      if (mounted) {
        context.go('/home');
      }
    } else {
      if (mounted) {
        context.go('/welcome');
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              'Campus Connect',
              style: Theme.of(
                context,
              ).textTheme.headlineLarge!.copyWith(fontSize: 28),
            ),
            AnimatedBuilder(
              animation: _revealAnimation,
              builder: (context, child) {
                return Positioned.fill(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: FractionallySizedBox(
                      widthFactor: _revealAnimation.value,
                      child: Container(color: AppThemeHelper.colors.surface),
                    ),
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
