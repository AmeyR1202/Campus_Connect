import 'package:campus_connect/core/di/service_locator.dart';
import 'package:campus_connect/core/firebase/firebase_options.dart';
import 'package:campus_connect/features/attendance/domain/usecases/sync_attendance_data_usecase.dart';
import 'package:campus_connect/features/timetable/domain/usecases/sync_timetable_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    try {
      // Background isolates need their own initialization
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      // Initialize our Database and Dependency Injection
      await initDependencies();

      // Only sync if a user is currently logged in
      final userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId != null) {
        final syncTimetable = sl<SyncTimetableUsecase>();
        final syncAttendance = sl<SyncAttendanceDataUsecase>();
        
        await Future.wait([
          syncTimetable.call(userId: userId),
          syncAttendance.call(userId: userId),
        ]);
      }

      return Future.value(true);
    } catch (e) {
      debugPrint("Background Sync Failed: $e");
      return Future.value(false);
    }
  });
}

class BackgroundSyncService {
  static Future<void> initialize() async {
    await Workmanager().initialize(callbackDispatcher);

    await Workmanager().registerPeriodicTask(
      "timetable-sync",
      "syncTask",
      frequency: const Duration(minutes: 15),
      constraints: Constraints(
        networkType: NetworkType.connected, // Only run if internet is available
      ),
    );
  }
}
