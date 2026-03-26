import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:campus_connect/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:campus_connect/features/auth/presentation/bloc/auth_event.dart';
import 'package:campus_connect/features/auth/presentation/bloc/auth_state.dart';
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

  bool isAnimationDone = false;
  AuthState? latestState;

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
        isAnimationDone = true;
        navigateIfReady();
      }
    });

    context.read<AuthBloc>().add(
      CheckAuthStatus(),
    ); // initiating the auth_check
  }

  void navigateIfReady() {
    if (!isAnimationDone || latestState == null) return;

    if (latestState is AuthAuthenticated) {
      context.go('/home');
    } else {
      context.go('/welcome');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        latestState = state;
        navigateIfReady();
      },
      child: Scaffold(
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
                        child: Container(
                          color: AppThemeHelper.colors.surface,
                        ), // revealing slide color
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// here the checkAuthStatus event is fired which checks if user is present or not
/// if user is present it goes to home page and if not it goes to sign-up page
/// now the problem is i wanted an animation scaling logo of the app and it will redirect user once auth check is done
/// but if network is slow like 5-10 secs it will stay stuck in splash screen and if i apply it a artificial timer it may happen that timer completed but still data not available
/// then it will have no idea about where to navigate
/// i have added a timeout to splash screen of 5 secs, if not done in 5 secs then safely redirect it to unauthenticated
