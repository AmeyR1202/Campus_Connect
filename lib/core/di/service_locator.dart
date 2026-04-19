import 'package:campus_connect/core/session/session_cubit.dart';
import 'package:campus_connect/core/session/session_repository.dart';
import 'package:campus_connect/core/session/session_repository_impl.dart';
import 'package:campus_connect/features/attendance/data/datasource/firestore_attendance_datasource.dart';
import 'package:campus_connect/features/attendance/data/repository/attendance_repository_impl.dart';
import 'package:campus_connect/features/attendance/domain/repositories/attendance_repository.dart';
import 'package:campus_connect/features/attendance/domain/usecases/add_attendance_usecase.dart';
import 'package:campus_connect/features/attendance/domain/usecases/get_attendance_usecase.dart';
import 'package:campus_connect/features/attendance/domain/usecases/get_dashboard_stats_usecase.dart';
import 'package:campus_connect/features/attendance/domain/usecases/update_attendance_usecase.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/attendance_bloc/attendance_bloc.dart';
import 'package:campus_connect/features/auth/data/datasources/firebase_auth_datasource.dart';
import 'package:campus_connect/features/auth/data/datasources/firestore_user_datasource.dart';
import 'package:campus_connect/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:campus_connect/features/auth/domain/repository/auth_repository.dart';
import 'package:campus_connect/features/auth/domain/usecases/forget_password_usecase.dart';
import 'package:campus_connect/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:campus_connect/features/auth/domain/usecases/log_in_usecase.dart';
import 'package:campus_connect/features/auth/domain/usecases/log_out_usecase.dart';
import 'package:campus_connect/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:campus_connect/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:campus_connect/features/timetable/data/datasources/firestore_timetable_datasource.dart';
import 'package:campus_connect/features/timetable/data/repository/timetable_repository_impl.dart';
import 'package:campus_connect/features/timetable/domain/repository/timetable_repository.dart';
import 'package:campus_connect/features/timetable/domain/usecases/add_lecture_usecase.dart';
import 'package:campus_connect/features/timetable/domain/usecases/delete_lecture_usecase.dart';
import 'package:campus_connect/features/timetable/domain/usecases/get_all_lectures_usecase.dart';
import 'package:campus_connect/features/timetable/domain/usecases/get_lectures_for_day_usecase.dart';
import 'package:campus_connect/features/timetable/domain/usecases/update_lecture_usecase.dart';
import 'package:campus_connect/features/timetable/presentation/bloc/timetable_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  /// ext dependencies
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => FirebaseFirestore.instance);

  /// Session Cubit
  sl.registerLazySingleton<SessionRepository>(
    () => SessionRepositoryImpl(sl()),
  );

  sl.registerLazySingleton(() => SessionCubit(sessionRepository: sl()));

  /// <------------------------- DI OF AUTHENTICATION FEAT -------------------------->

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
  sl.registerLazySingleton(() => ForgetPasswordUsecase(sl()));

  // BLoC

  sl.registerFactory(
    () => AuthBloc(
      loginUsecase: sl(),
      signupUsecase: sl(),
      getCurrentUserUsecase: sl(),
      logoutUsecase: sl(),
      sessionCubit: sl(),
      forgetPasswordUsecase: sl(),
    ),
  );

  /// <------------------------- DI OF ATTENDANCE FEAT -------------------------->

  sl.registerLazySingleton(
    () => FirestoreAttendanceDatasource(firestore: sl()),
  );

  sl.registerLazySingleton<AttendanceRepository>(
    () => AttendanceRepositoryImpl(datasource: sl()),
  );

  // usecases
  sl.registerLazySingleton(() => AddAttendanceUsecase(sl()));
  sl.registerLazySingleton(() => GetAttendanceUsecase(sl()));

  sl.registerFactory(
    () => AttendanceBloc(
      addAttendance: sl(),
      getAttendance: sl(),
      dashboardStats: sl(),
      updateAttendanceUsecase: sl(),
    ),
  );

  // usecases
  sl.registerLazySingleton(() => GetDashboardStatsUsecase(sl()));
  sl.registerLazySingleton(() => UpdateAttendanceUsecase(sl()));

  /// <------------------------- DI OF TIMETABLE FEAT -------------------------->

  sl.registerLazySingleton(() => FirestoreTimetableDatasource(firestore: sl()));

  sl.registerLazySingleton<TimetableRepository>(
    () => TimetableRepositoryImpl(datasource: sl()),
  );

  sl.registerLazySingleton(() => AddLectureUsecase(sl()));
  sl.registerLazySingleton(() => DeleteLectureUsecase(sl()));
  sl.registerLazySingleton(() => GetLecturesForDayUsecase(sl()));
  sl.registerLazySingleton(() => GetAllLecturesUsecase(sl())); // Added
  sl.registerLazySingleton(() => UpdateLectureUsecase(sl()));

  sl.registerFactory(
    () => TimetableBloc(
      addLecture: sl(),
      updateLecture: sl(),
      deleteLecture: sl(),
      getLectures: sl(),
      getAllLectures: sl(), // Added to bloc
    ),
  );
}
