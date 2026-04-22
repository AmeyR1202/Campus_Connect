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
  final attendedController = TextEditingController();
  final missedController = TextEditingController();

  Future<void> _submit() async {
    final attendedStr = attendedController.text.trim();
    final missedStr = missedController.text.trim();

    if (attendedStr.isEmpty || missedStr.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill out both fields')),
      );
      return;
    }

    final attended = int.tryParse(attendedStr) ?? 0;
    final missed = int.tryParse(missedStr) ?? 0;

    final userId = context.read<SessionCubit>().state.user?.id ?? '';

    if (userId.isNotEmpty) {
      context.read<AttendanceBloc>().add(
        SetBaseStatsEvent(
          userId: userId,
          subjectId: widget.subjectId,
          attended: attended,
          missed: missed,
        ),
      );
    }

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    attendedController.dispose();
    missedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
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
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: AppThemeHelper.colors.muted,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Text(
            'Edit Base Stats',
            style: AppTheme.light.textTheme.bodyMedium!.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Input stats from before you started using the app.',
            style: TextStyle(
              fontSize: 14,
              color: AppThemeHelper.colors.textSecondary,
            ),
          ),
          const SizedBox(height: 24),
          _StatField(
            label: 'Attended Classes',
            controller: attendedController,
            color: Colors.green,
          ),
          const SizedBox(height: 16),
          _StatField(
            label: 'Missed Classes',
            controller: missedController,
            color: Colors.redAccent,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: _submit,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppThemeHelper.colors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Save Base Stats',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Color color;

  const _StatField({
    required this.label,
    required this.controller,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'e.g. 10',
            filled: true,
            fillColor: AppThemeHelper.colors.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),
      ],
    );
  }
}
