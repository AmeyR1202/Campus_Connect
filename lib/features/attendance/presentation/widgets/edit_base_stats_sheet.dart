import 'package:campus_connect/core/session/session_cubit.dart';
import 'package:campus_connect/core/theme/app_theme.dart';
import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/attendance_bloc/attendance_bloc.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/attendance_bloc/attendance_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditBaseStatsSheet extends StatefulWidget {
  final String subjectId;

  const EditBaseStatsSheet({super.key, required this.subjectId});

  @override
  State<EditBaseStatsSheet> createState() => _EditBaseStatsSheetState();
}

class _EditBaseStatsSheetState extends State<EditBaseStatsSheet> {
  int _presentCount = 0;
  int _absentCount = 0;
  int _cancelledCount = 0;

  Future<void> _submit() async {
    final userId = context.read<SessionCubit>().state.user?.id ?? '';

    if (userId.isNotEmpty) {
      context.read<AttendanceBloc>().add(
        SetBaseStatsEvent(
          userId: userId,
          subjectId: widget.subjectId,
          attended: _presentCount,
          missed: _absentCount,
          cancelled: _cancelledCount,
        ),
      );
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 24),
              decoration: BoxDecoration(
                color: AppThemeHelper.colors.muted,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Text(
            'Edit Past Attendance',
            style: AppTheme.light.textTheme.bodyMedium!.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'You can track your past attendance as present, absent, and cancelled to accurately sync your history before you started using the app.',
            style: TextStyle(
              fontSize: 14,
              color: AppThemeHelper.colors.textSecondary,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 32),

          _StepperRow(
            label: 'Present',
            value: _presentCount,
            color: Colors.green,
            onChanged: (val) => setState(() => _presentCount = val),
          ),
          const SizedBox(height: 16),

          _StepperRow(
            label: 'Absent',
            value: _absentCount,
            color: Colors.redAccent,
            onChanged: (val) => setState(() => _absentCount = val),
          ),
          const SizedBox(height: 16),

          _StepperRow(
            label: 'Cancelled',
            value: _cancelledCount,
            color: AppThemeHelper.colors.primary,
            onChanged: (val) => setState(() => _cancelledCount = val),
          ),

          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton(
              onPressed: _submit,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppThemeHelper.colors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Save Attendance',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StepperRow extends StatelessWidget {
  final String label;
  final int value;
  final Color color;
  final ValueChanged<int> onChanged;

  const _StepperRow({
    required this.label,
    required this.value,
    required this.color,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.05),
        border: Border.all(color: color.withValues(alpha: 0.2)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.circle, color: color, size: 12),
              const SizedBox(width: 12),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Row(
            children: [
              _StepperButton(
                icon: Icons.remove,
                onTap: value > 0 ? () => onChanged(value - 1) : null,
              ),
              Container(
                width: 48,
                alignment: Alignment.center,
                child: Text(
                  value.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              _StepperButton(
                icon: Icons.add,
                onTap: () => onChanged(value + 1),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StepperButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const _StepperButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: onTap != null
              ? AppThemeHelper.colors.textTertiary
              : AppThemeHelper.colors.muted,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          size: 20,
          color: onTap != null
              ? AppThemeHelper.colors.textPrimary
              : AppThemeHelper.colors.textPrimary,
        ),
      ),
    );
  }
}
