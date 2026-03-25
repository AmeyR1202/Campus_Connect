import 'package:campus_connect/core/session/session_cubit.dart';
import 'package:campus_connect/features/attendance/data/datasource/firestore_attendance_datasource.dart';
import 'package:campus_connect/features/attendance/data/datasource/firestore_timetable_datasource.dart';
import 'package:campus_connect/features/attendance/data/repository/attendance_repository_impl.dart';
import 'package:campus_connect/features/attendance/data/repository/timetable_repository_impl.dart';
import 'package:campus_connect/features/attendance/domain/repositories/attendance_repository.dart';
import 'package:campus_connect/features/attendance/domain/repositories/timetable_repository.dart';
import 'package:campus_connect/features/attendance/domain/usecase/add_attendance_usecase.dart';
import 'package:campus_connect/features/attendance/domain/usecase/get_attendance_usecase.dart';
import 'package:campus_connect/features/attendance/domain/usecase/get_dashboard_stats_usecase.dart';
import 'package:campus_connect/features/attendance/domain/usecase/get_timetable_usecase.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/attendance_bloc/attendance_bloc.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/timetable_bloc/timetable_bloc.dart';
import 'package:campus_connect/features/auth/data/datasources/firebase_auth_datasource.dart';
import 'package:campus_connect/features/auth/data/datasources/firestore_user_datasource.dart';
import 'package:campus_connect/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:campus_connect/features/auth/domain/repository/auth_repository.dart';
import 'package:campus_connect/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:campus_connect/features/auth/domain/usecases/log_in_usecase.dart';
import 'package:campus_connect/features/auth/domain/usecases/log_out_usecase.dart';
import 'package:campus_connect/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:campus_connect/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // ext dependencies
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => FirebaseFirestore.instance);

  // Datasources
  sl.registerLazySingleton(() => FirebaseAuthDatasource(sl()));
  sl.registerLazySingleton(() => FirestoreUserDatasource(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authDatasource: sl(), firestoreDatasource: sl()),
  );

  // usecases
  sl.registerLazySingleton(() => LoginUsecase(sl()));

  sl.registerLazySingleton(() => SignupUsecase(sl()));

  sl.registerLazySingleton(() => GetCurrentUserUsecase(sl()));

  sl.registerLazySingleton(() => LogoutUsecase(sl()));

  // BLoC

  sl.registerFactory(
    () => AuthBloc(
      loginUsecase: sl(),
      signupUsecase: sl(),
      getCurrentUserUsecase: sl(),
      logoutUsecase: sl(),
      sessionCubit: sl(),
    ),
  );

  sl.registerLazySingleton(() => SessionCubit());

  // Attendance DataSources
  sl.registerLazySingleton(
    () => FirestoreAttendanceDatasource(firestore: sl()),
  );

  sl.registerLazySingleton<AttendanceRepository>(
    () => AttendanceRepositoryImpl(datasource: sl()),
  );

  // Usecases
  sl.registerLazySingleton(() => AddAttendanceUsecase(sl()));
  sl.registerLazySingleton(() => GetAttendanceUsecase(sl()));

  sl.registerFactory(
    () => AttendanceBloc(
      addAttendance: sl(),
      getAttendance: sl(),
      dashboardStats: sl(),
    ),
  );

  // timetable datasources
  sl.registerLazySingleton(() => FirestoreTimetableDatasource(firestore: sl()));

  sl.registerLazySingleton<TimetableRepository>(
    () => TimetableRepositoryImpl(datasource: sl()),
  );

  // usecases
  sl.registerLazySingleton(() => GetTimetableUsecase(sl()));
  sl.registerLazySingleton(() => GetDashboardStatsUsecase(sl()));

  sl.registerFactory(() => TimetableBloc(getTimetableUsecase: sl()));
}
