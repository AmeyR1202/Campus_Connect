import 'package:campus_connect/core/layout/app_spacing.dart';
import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:campus_connect/features/attendance/domain/entities/attendance_entity.dart';
import 'package:campus_connect/features/attendance/presentation/widgets/action_button.dart';
import 'package:campus_connect/features/attendance/presentation/widgets/status_chip.dart';
import 'package:campus_connect/features/timetable/domain/entities/lecture_entity.dart';
import 'package:flutter/material.dart';

class LectureCardWidget extends StatelessWidget {
  final LectureEntity lecture;
  final AttendanceEntity? attendance;
  final Function(LectureEntity, AttendanceStatus) onMark;

  const LectureCardWidget({
    super.key,
    required this.lecture,
    required this.attendance,
    required this.onMark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      padding: EdgeInsets.all(AppSpacing.padding(context)),
      decoration: BoxDecoration(
        color: AppThemeHelper.colors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radius(context)),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: AppThemeHelper.colors.muted.withValues(alpha: 0.5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Subject
          Text(
            lecture.subjectName,
            style: TextStyle(
              fontSize: AppSpacing.scale(context, 18), 
              fontWeight: FontWeight.w600
            ),
          ),

          const SizedBox(height: AppSpacing.sm),

          /// Time
          Text(
            "${lecture.startTime} - ${lecture.endTime}",
            style: TextStyle(
              color: AppThemeHelper.colors.info,
              fontSize: AppSpacing.scale(context, 14),
            ),
          ),

          const SizedBox(height: AppSpacing.md),

          /// Actions
          if (attendance == null)
            Row(
              children: [
                Expanded(
                  child: ActionButton(
                    text: "Mark Present",
                    color: AppThemeHelper.colors.success,
                    isOutlined: false,
                    onTap: () => onMark(lecture, AttendanceStatus.present),
                  ),
                ),
                SizedBox(width: AppSpacing.scale(context, 12)),
                Expanded(
                  child: ActionButton(
                    text: "Mark Absent",
                    color: AppThemeHelper.colors.error,
                    isOutlined: true,
                    onTap: () => onMark(lecture, AttendanceStatus.absent),
                  ),
                ),
              ],
            )
          else
            Row(
              children: [
                Expanded(
                  child: StatusChip(
                    text: attendance!.status == AttendanceStatus.present
                        ? "Present"
                        : "Absent",
                    icon: attendance!.status == AttendanceStatus.present
                        ? Icons.check_circle
                        : Icons.cancel,
                    color: attendance!.status == AttendanceStatus.present
                        ? AppThemeHelper.colors.success
                        : AppThemeHelper.colors.error,
                  ),
                ),
                SizedBox(width: AppSpacing.scale(context, 12)),
                Expanded(
                  child: ActionButton(
                    text: attendance!.status == AttendanceStatus.present
                        ? "Change to Absent"
                        : "Change to Present",
                    color: AppThemeHelper.colors.textSecondary,
                    isOutlined: true,
                    onTap: () => onMark(
                      lecture,
                      attendance!.status == AttendanceStatus.present
                          ? AttendanceStatus.absent
                          : AttendanceStatus.present,
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
