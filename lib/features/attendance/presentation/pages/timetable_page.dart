import 'package:campus_connect/core/session/session_cubit.dart';
import 'package:campus_connect/core/theme/app_theme.dart';
import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:campus_connect/core/widgets/loader.dart';
import 'package:campus_connect/features/attendance/domain/entities/attendance_entity.dart';
import 'package:campus_connect/features/attendance/domain/entities/lecture_entity.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/attendance_bloc/attendance_bloc.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/attendance_bloc/attendance_event.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/attendance_bloc/attendance_state.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/timetable_bloc/timetable_bloc.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/timetable_bloc/timetable_event.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/timetable_bloc/timetable_state.dart';
import 'package:campus_connect/features/attendance/presentation/widgets/date_selector.dart';
import 'package:campus_connect/features/attendance/presentation/widgets/lecture_list_widget.dart';
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
    // Last 7 days including today
    weekDates = List.generate(7, (index) {
      return DateTime.now().subtract(Duration(days: 6 - index));
    });

    _fetchTimetableForDate(selectedDate);
  }

  void _fetchTimetableForDate(DateTime date) {
    context.read<TimetableBloc>().add(
      FetchTimetableEvent(branch: branch, semester: semester, date: date),
    );
  }

  void _markAttendance(LectureEntity lecture, AttendanceStatus status) {
    final d = lecture.date;

    final lectureId =
        "${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}_${lecture.startTime}_${lecture.subjectId}";

    final entity = AttendanceEntity(
      lectureId: lectureId,
      subjectId: lecture.subjectId,
      status: status,
      markedAt: lecture.date,
    );

    context.read<AttendanceBloc>().add(
      AddAttendanceEvent(userId: userId, entity: entity),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Timetable",
          style: TextStyle(color: AppThemeHelper.colors.textTertiary),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
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
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
