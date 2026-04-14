import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:flutter/material.dart';

class LectureTypeWidget extends StatelessWidget {
  final String selectedType;
  final Function(String) onChanged;
  const LectureTypeWidget({
    super.key,
    required this.selectedType,
    required this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Type', style: Theme.of(context).textTheme.labelMedium),
        const SizedBox(height: 8),

        Row(
          children: ['Lecture', 'Lab', 'Tutorial'].map((type) {
            final isSelected = selectedType == type;

            return Expanded(
              child: GestureDetector(
                onTap: () {
                  onChanged(type);
                },
                child: Padding(
                  padding: EdgeInsets.only(right: type != 'Tutorial' ? 10 : 0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 44,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppThemeHelper.colors.primary
                          : AppThemeHelper.colors.info.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      type,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: isSelected
                            ? Colors.white
                            : AppThemeHelper.colors.textSecondary,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
