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
import 'package:campus_connect/features/timetable/presentation/pages/manage_timetable_page.dart';
import 'package:campus_connect/features/timetable/presentation/widgets/date_selector.dart';
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

  final String branch = 'IT';
  final int semester = 6;

  DateTime selectedDate = DateTime.now();
  late List<DateTime> weekDates;

  @override
  void initState() {
    super.initState();

    final session = context.read<SessionCubit>().state;
    userId = session.user!.id;
    context.read<AttendanceBloc>().add(
      FetchAllSubjectsStatsEvent(userId: userId),
    );
    context.read<AttendanceBloc>().add(
      FetchAttendanceEvent(
        userId: userId,
      ), // Fetches all attendance records globally
    );
    // Last 7 days including today
    weekDates = List.generate(7, (index) {
      return DateTime.now().subtract(Duration(days: 6 - index));
    });

    _fetchTimetableForDate(selectedDate);
  }

  void _fetchTimetableForDate(DateTime date) {
    context.read<TimetableBloc>().add(
      GetLecturesForDayEvent(userId: userId, date: date),
    );
  }

  void _markAttendance(LectureEntity lecture, AttendanceStatus status) {
    final d = selectedDate;

    final lectureId =
        "${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}_${lecture.startTime}_${lecture.subjectId}";

    final entity = AttendanceEntity(
      lectureId: lectureId,
      subjectId: lecture.subjectId,
      status: status,
      markedAt: selectedDate,
    );

    context.read<AttendanceBloc>().add(
      AddAttendanceEvent(userId: userId, entity: entity),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            "Timetable",
            style: AppTheme.light.textTheme.headlineLarge?.copyWith(
              color: AppThemeHelper.colors.textTertiary,
            ),
          ),
          SizedBox(height: 20),

          /// Date Selector
          DateSelectorWidget(
            dates: weekDates,
            selectedDate: selectedDate,
            onDateSelected: (date) {
              setState(() => selectedDate = date);
              _fetchTimetableForDate(date);
            },
          ),

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

                if (timetableState.lectures == null ||
                    timetableState.lectures!.isEmpty) {
                  return const Center(
                    child: Text("No lectures found for this date."),
                  );
                }

                return BlocBuilder<AttendanceBloc, AttendanceState>(
                  builder: (context, attendanceState) {
                    return LectureListWidget(
                      lectures: timetableState.lectures!,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ManageTimetablePage(userId: userId),
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
