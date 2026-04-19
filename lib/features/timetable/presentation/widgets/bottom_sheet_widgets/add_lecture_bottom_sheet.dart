import 'package:campus_connect/core/theme/app_theme.dart';
import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:campus_connect/features/timetable/domain/entities/lecture_entity.dart';
import 'package:campus_connect/features/timetable/presentation/bloc/timetable_bloc.dart';
import 'package:campus_connect/features/timetable/presentation/bloc/timetable_event.dart';
import 'package:campus_connect/features/timetable/presentation/widgets/bottom_sheet_widgets/add_lecture_button.dart';
import 'package:campus_connect/features/timetable/presentation/widgets/bottom_sheet_widgets/lecture_type_widget.dart';
import 'package:campus_connect/features/timetable/presentation/widgets/bottom_sheet_widgets/sheet_text_field.dart';
import 'package:campus_connect/features/timetable/presentation/widgets/bottom_sheet_widgets/time_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddLectureBottomSheet extends StatefulWidget {
  final String userId;
  final String day;

  const AddLectureBottomSheet({
    super.key,
    required this.day,
    required this.userId,
  });

  @override
  State<AddLectureBottomSheet> createState() => _AddLectureBottomSheetState();
}

class _AddLectureBottomSheetState extends State<AddLectureBottomSheet> {
  String _formatTime(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';

    return '$hour:$minute $period';
  }

  String selectedType = 'Lecture';
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  Future<void> _pickTime({required bool isStart}) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        if (isStart) {
          startTime = picked;
        } else {
          endTime = picked;
        }
      });
    }
  }

  void _onSubmit() {
    final subjectName = subjectController.text.trim();

    if (subjectName.isEmpty || startTime == null || endTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    final startStr = _formatTime(startTime!);
    final endStr = _formatTime(endTime!);

    final lectureId = '${widget.day}_${startStr}_${subjectName.hashCode}';

    final entity = LectureEntity(
      lectureId: lectureId,
      subjectName: subjectName,
      day: widget.day,
      startTime: startStr,
      endTime: endStr,
      type: selectedType,
    );

    context.read<TimetableBloc>().add(
      AddLectureEvent(userId: widget.userId, entity: entity),
    );

    Navigator.of(context, rootNavigator: true).pop();
  }

  final subjectController = TextEditingController();

  @override
  void dispose() {
    subjectController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Drag Handle
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

          /// Title
          Text(
            'Add Lecture - ${widget.day}',
            style: AppTheme.light.textTheme.bodyMedium!.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 10),

          /// Subject Field
          SheetTextField(
            controller: subjectController,
            hint: 'Subject Name',
            icon: Icons.book_outlined,
          ),

          const SizedBox(height: 10),

          /// Type selector
          LectureTypeWidget(
            selectedType: selectedType,
            onChanged: (type) {
              setState(() {
                selectedType = type;
              });
            },
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              Expanded(
                child: TimePickerWidget(
                  label: "Start",
                  time: startTime,
                  onTap: () => _pickTime(isStart: true),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TimePickerWidget(
                  label: "End",
                  time: endTime,
                  onTap: () => _pickTime(isStart: false),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          AddLectureButton(
            onPressed: () {
              _onSubmit();
            },
          ),
        ],
      ),
    );
  }
}
