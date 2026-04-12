import 'package:campus_connect/features/attendance/domain/entities/attendance_entity.dart';
import 'package:campus_connect/features/timetable/domain/entities/lecture_entity.dart';
import 'package:campus_connect/features/timetable/presentation/widgets/lecture_card_widget.dart';
import 'package:flutter/material.dart';

class LectureListWidget extends StatelessWidget {
  final List<LectureEntity> lectures;
  final List<AttendanceEntity> attendance;
  final DateTime selectedDate;
  final Function(LectureEntity, AttendanceStatus) onMark;

  const LectureListWidget({
    super.key,
    required this.lectures,
    required this.attendance,
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

        final lectureId =
            "${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}_${lecture.startTime}_${lecture.subjectId}";
        AttendanceEntity? attendanceRecord;

        final matches = attendance
            .where((a) => a.lectureId == lectureId)
            .toList();

        if (matches.isNotEmpty) {
          attendanceRecord = matches.first;
        }
        return LectureCardWidget(
          lecture: lecture,
          attendance: attendanceRecord,
          onMark: onMark,
        );
      },
    );
  }
}
