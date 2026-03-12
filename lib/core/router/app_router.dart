import 'package:campus_connect/features/auth/presentation/pages/splash_screen.dart';
import 'package:campus_connect/features/auth/presentation/pages/welcome_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => SplashScreen()),
    GoRoute(path: '/welcome', builder: (context, state) => WelcomePage()),
  ],
);
