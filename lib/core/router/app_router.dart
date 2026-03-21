import 'package:campus_connect/core/router/page_transitions.dart';
import 'package:campus_connect/core/widgets/error_page.dart';
import 'package:campus_connect/features/attendance/presentation/pages/attendance_page.dart';
import 'package:campus_connect/features/auth/presentation/pages/email_sent_page.dart';
import 'package:campus_connect/features/attendance/presentation/pages/home_page.dart';
import 'package:campus_connect/features/auth/presentation/pages/login_page.dart';
import 'package:campus_connect/features/auth/presentation/pages/sign_up_page.dart';
import 'package:campus_connect/features/auth/presentation/pages/splash_screen.dart';
import 'package:campus_connect/features/auth/presentation/pages/welcome_page.dart';
import 'package:campus_connect/presentation/main_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/splash',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainScreen(child: child);
      },
      routes: [
        GoRoute(
          path: '/home',
          pageBuilder: (context, state) =>
              buildPageWithTransition(state: state, child: const HomePage()),
        ),
        GoRoute(
          path: '/attendance',
          pageBuilder: (context, state) => buildPageWithTransition(
            state: state,
            child: const AttendancePage(userId: '', subjectId: ''),
          ),
        ),
      ],
    ),

    GoRoute(path: '/splash', builder: (context, state) => SplashPage()),
    GoRoute(path: '/welcome', builder: (context, state) => WelcomePage()),
    GoRoute(path: '/login', builder: (context, state) => LoginPage()),
    GoRoute(path: '/signup', builder: (context, state) => SignUpPage()),
    GoRoute(
      path: '/email-success',
      builder: (context, state) => EmailSentPage(),
    ),
  ],
  errorBuilder: (context, state) {
    return ErrorPage();
  },
);
