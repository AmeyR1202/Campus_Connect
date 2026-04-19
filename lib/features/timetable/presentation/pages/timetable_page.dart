import 'package:campus_connect/core/session/session_cubit.dart';
import 'package:campus_connect/core/theme/app_theme.dart';
import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:campus_connect/core/widgets/loader.dart';
import 'package:campus_connect/features/attendance/domain/entities/attendance_entity.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/attendance_bloc/attendance_bloc.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/attendance_bloc/attendance_event.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/attendance_bloc/attendance_state.dart';
import 'package:campus_connect/features/timetable/domain/entities/lecture_entity.dart';
import 'package:campus_connect/features/timetable/presentation/bloc/timetable_bloc.dart';
import 'package:campus_connect/features/timetable/presentation/bloc/timetable_event.dart';
import 'package:campus_connect/features/timetable/presentation/bloc/timetable_state.dart';
import 'package:campus_connect/features/timetable/presentation/widgets/lecture_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimetablePage extends StatefulWidget {
  const TimetablePage({super.key});

  @override
  State<TimetablePage> createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
  late String userId;

  @override
  void initState() {
    super.initState();

    final session = context.read<SessionCubit>().state;
    userId = session.user!.id;

    final cachedLectures = context.read<TimetableBloc>().state.lectures;
    if (cachedLectures == null) {
      context.read<TimetableBloc>().add(GetAllLecturesEvent(userId: userId));
    }
  }

  void _markAttendance(LectureEntity lecture, AttendanceStatus status) {
    final d = DateTime.now();

    final lectureId =
        "${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}_${lecture.startTime}_${lecture.subjectName}";

    final entity = AttendanceEntity(
      lectureId: lectureId,
      subjectId: "${lecture.subjectName} (${lecture.type})",

      /// Combining subject name and it's type because DBMS can have DBMS as Lecture and DBMS as Lab so earlier it is used to get tracked as one single thing
      status: status,
      markedAt: DateTime.now(),
    );

    context.read<AttendanceBloc>().add(
      AddAttendanceEvent(userId: userId, entity: entity),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(),
        title: Text(
          "Today's Schedule",
          style: AppTheme.light.textTheme.headlineLarge?.copyWith(
            color: AppThemeHelper.colors.textTertiary,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            /// Content
            Expanded(
              child: BlocBuilder<TimetableBloc, TimetableState>(
                builder: (context, timetableState) {
                  if (timetableState.isLoading) {
                    return const Center(child: Loader());
                  }

                  if (timetableState.error != null) {
                    return Center(child: Text(timetableState.error!));
                  }

                  final todayLectures = timetableState.todayLectures;

                  if (todayLectures.isEmpty) {
                    return const Center(
                      child: Text("No lectures found for Today."),
                    );
                  }

                  return BlocBuilder<AttendanceBloc, AttendanceState>(
                    builder: (context, attendanceState) {
                      return LectureListWidget(
                        lectures: todayLectures,
                        attendance: attendanceState.attendance ?? [],
                        onMark: (lecture, status) {
                          _markAttendance(lecture, status);
                        },
                        selectedDate: DateTime.now(),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
