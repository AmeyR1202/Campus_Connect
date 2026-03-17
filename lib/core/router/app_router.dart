import 'package:campus_connect/features/auth/presentation/pages/home_page.dart';
import 'package:campus_connect/features/auth/presentation/pages/login_page.dart';
import 'package:campus_connect/features/auth/presentation/pages/sign_up_page.dart';
import 'package:campus_connect/features/auth/presentation/pages/splash_screen.dart';
import 'package:campus_connect/features/auth/presentation/pages/welcome_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/welcome',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => SplashScreen()),
    GoRoute(path: '/welcome', builder: (context, state) => WelcomePage()),
    GoRoute(path: '/signup', builder: (context, state) => SignUpPage()),
    GoRoute(path: '/login', builder: (context, state) => LoginPage()),
    GoRoute(path: '/home', builder: (context, state) => HomePage()),
  ],
);
