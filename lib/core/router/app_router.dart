import 'package:campus_connect/core/router/page_transitions.dart';
import 'package:campus_connect/features/auth/presentation/pages/home_page.dart';
import 'package:campus_connect/features/auth/presentation/pages/login_page.dart';
import 'package:campus_connect/features/auth/presentation/pages/sign_up_page.dart';
import 'package:campus_connect/features/auth/presentation/pages/splash_screen.dart';
import 'package:campus_connect/features/auth/presentation/pages/welcome_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => SplashPage()),
    GoRoute(
      path: '/welcome',
      pageBuilder: (context, state) =>
          buildPageWithTransition(state: state, child: const WelcomePage()),
    ),
    GoRoute(
      path: '/signup',
      pageBuilder: (context, state) =>
          buildPageWithTransition(state: state, child: const SignUpPage()),
    ),
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) =>
          buildPageWithTransition(state: state, child: const LoginPage()),
    ),
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) =>
          buildPageWithTransition(state: state, child: const HomePage()),
    ),
  ],
);
