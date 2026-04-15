import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:campus_connect/core/widgets/loader.dart';
import 'package:campus_connect/features/timetable/presentation/bloc/timetable_bloc.dart';
import 'package:campus_connect/features/timetable/presentation/bloc/timetable_event.dart';
import 'package:campus_connect/features/timetable/presentation/bloc/timetable_state.dart';
import 'package:campus_connect/features/timetable/presentation/widgets/bottom_sheet_widgets/add_lecture_bottom_sheet.dart';
import 'package:campus_connect/features/timetable/presentation/widgets/timetable_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageTimetablePage extends StatefulWidget {
  final String userId;
  const ManageTimetablePage({super.key, required this.userId});

  @override
  State<ManageTimetablePage> createState() => _ManageTimetablePageState();
}

class _ManageTimetablePageState extends State<ManageTimetablePage>
    with SingleTickerProviderStateMixin {
  static const List<String> weekDays = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    // "Sun",
  ];

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: weekDays.length, vsync: this);
    super.initState();

    // Fetch all lectures once so they populate across all tabs
    context.read<TimetableBloc>().add(
      GetAllLecturesEvent(userId: widget.userId),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Timetable",
          style: TextStyle(color: AppThemeHelper.colors.textTertiary),
        ),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: weekDays.map((day) => Tab(text: day)).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: weekDays.map((day) {
          return BlocBuilder<TimetableBloc, TimetableState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: Loader());
              }

              if (state.error != null) {
                return Center(child: Text(state.error!));
              }
              final lectures = state.lectures ?? [];
              final filteredLectures = lectures
                  .where((l) => l.day == day)
                  .toList();

              if (filteredLectures.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.event_busy_rounded,
                        size: 64,
                        color: AppThemeHelper.colors.textSecondary.withValues(
                          alpha: 0.4,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "No lectures found for $day",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppThemeHelper.colors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Tap + to add one',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppThemeHelper.colors.textSecondary.withValues(
                            alpha: 0.6,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: filteredLectures.length,
                itemBuilder: (context, index) {
                  final lecture = filteredLectures[index];
                  return TimetableCardWidget(lecture: lecture);
                },
              );
            },
          );
        }).toList(),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final selectedDay = weekDays[_tabController.index];
          final timetableBloc = context.read<TimetableBloc>();
          showModalBottomSheet(
            context: context,
            useRootNavigator: true,
            builder: (_) => BlocProvider.value(
              value: timetableBloc,
              child: AddLectureBottomSheet(
                day: selectedDay,
                userId: widget.userId,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
