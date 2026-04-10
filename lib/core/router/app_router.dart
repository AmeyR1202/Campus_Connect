import 'package:campus_connect/core/router/page_transitions.dart';
import 'package:campus_connect/core/widgets/error_page.dart';
import 'package:campus_connect/features/attendance/presentation/pages/subject_details_page.dart';
import 'package:campus_connect/features/attendance/presentation/pages/subject_history_page.dart';
import 'package:campus_connect/features/attendance/presentation/pages/timetable_page.dart';
import 'package:campus_connect/features/auth/presentation/pages/email_sent_page.dart';
import 'package:campus_connect/features/attendance/presentation/pages/home_page.dart';
import 'package:campus_connect/features/auth/presentation/pages/login_page.dart';
import 'package:campus_connect/features/auth/presentation/pages/sign_up_page.dart';
import 'package:campus_connect/features/auth/presentation/pages/splash_screen.dart';
import 'package:campus_connect/features/auth/presentation/pages/welcome_page.dart';
import 'package:campus_connect/core/app/app_shell.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/splash',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return AppShell(child: child);
      },
      routes: [
        GoRoute(
          path: '/home',
          pageBuilder: (context, state) =>
              buildPageWithTransition(state: state, child: const HomePage()),
        ),
        GoRoute(
          path: '/timetable',
          pageBuilder: (context, state) => buildPageWithTransition(
            state: state,
            child: const TimetablePage(),
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
    GoRoute(
      path: '/subject-details',
      builder: (context, state) {
        final filter = state.extra as String; // "safe" or "danger"
        return SubjectDetailsPage(filter: filter);
      },
    ),
    GoRoute(
      path: '/subjects/:subjectId/history',
      builder: (context, state) {
        final subjectId = state.pathParameters['subjectId']!;
        return SubjectHistoryPage(subjectId: subjectId);
      },
    ),
  ],
  errorBuilder: (context, state) {
    return ErrorPage();
  },
);
