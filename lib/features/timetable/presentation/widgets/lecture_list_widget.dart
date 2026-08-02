import 'package:campus_connect/features/attendance/domain/entities/attendance_entity.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/attendance_bloc/attendance_state.dart';
import 'package:campus_connect/features/timetable/domain/entities/lecture_entity.dart';
import 'package:campus_connect/features/timetable/presentation/widgets/lecture_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LectureListWidget extends StatelessWidget {
  final List<LectureEntity> lectures;
  final AttendanceState attendanceState;
  final DateTime selectedDate;
  final Function(LectureEntity, AttendanceStatus) onMark;

  const LectureListWidget({
    super.key,
    required this.lectures,
    required this.attendanceState,
    required this.onMark,
    required this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: lectures.length,
      itemBuilder: (context, index) {
        final lecture = lectures[index];

        final d = selectedDate;

        final startFormatted = DateFormat.jm()
            .format(lecture.startTime)
            .replaceFirst(' ', ' '); // Remove narrow no-break space if any
        final lectureId =
            "${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}_${startFormatted}_${lecture.subjectName}";
        
        final AttendanceEntity? attendanceRecord = attendanceState.getAttendanceForLecture(lectureId);

        return LectureCardWidget(
          lecture: lecture,
          attendance: attendanceRecord,
          onMark: onMark,
        );
      },
    );
  }
}
