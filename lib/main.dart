import 'package:campus_connect/core/di/service_locator.dart';
import 'package:campus_connect/core/firebase/firebase_options.dart';
import 'package:campus_connect/core/router/app_router.dart';
import 'package:campus_connect/core/session/session_cubit.dart';
import 'package:campus_connect/core/theme/app_theme.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/attendance_bloc/attendance_bloc.dart';
import 'package:campus_connect/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:campus_connect/features/timetable/presentation/bloc/timetable_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<AuthBloc>()),
        BlocProvider(create: (_) => sl<SessionCubit>()),
        BlocProvider(create: (_) => sl<AttendanceBloc>()),
        BlocProvider(create: (_) => sl<TimetableBloc>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.light,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
