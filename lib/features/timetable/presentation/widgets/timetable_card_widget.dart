import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:campus_connect/features/timetable/domain/entities/lecture_entity.dart';
import 'package:campus_connect/features/timetable/presentation/widgets/session_type_chip.dart';
import 'package:flutter/material.dart';

class TimetableCardWidget extends StatelessWidget {
  final LectureEntity lecture;
  const TimetableCardWidget({super.key, required this.lecture});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppThemeHelper.colors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: AppThemeHelper.colors.textTertiary.withValues(alpha: 0.05),
          ),
        ],
      ),
      child: Row(
        children: [
          // Time columns
          Column(
            children: [
              Text(
                lecture.startTime,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppThemeHelper.colors.primary,
                ),
              ),
              Container(
                width: 1.5,
                height: 16,
                color: AppThemeHelper.colors.primary.withValues(alpha: 0.3),
              ),
              Text(
                lecture.endTime,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppThemeHelper.colors.textSecondary,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lecture.subjectName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        SessionTypeChip(type: lecture.type),
                        const SizedBox(width: 8),
                        Text(
                          lecture.subjectId,
                          style: TextStyle(
                            fontSize: 12,
                            color: AppThemeHelper.colors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.edit_outlined,
                  size: 20,
                  color: AppThemeHelper.colors.info,
                ),
                onPressed: () {},
                // onPressed: () => _showAddEditSheet(existing: lecture),
              ),
              IconButton(
                icon: Icon(
                  Icons.delete_outline_rounded,
                  size: 20,
                  color: AppThemeHelper.colors.error,
                ),
                onPressed: () {},
                // onPressed: () => _deleteLecture(lecture),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
