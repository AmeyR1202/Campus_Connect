import 'package:campus_connect/core/errors/failures.dart';
import 'package:campus_connect/core/session/session_cubit.dart';
import 'package:campus_connect/features/attendance/domain/entities/attendance_entity.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/attendance_bloc/attendance_bloc.dart';
import 'package:campus_connect/features/attendance/presentation/bloc/attendance_bloc/attendance_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';

class HistorySection extends StatelessWidget {
  final String subjectId;

  const HistorySection({super.key, required this.subjectId});

  @override
  Widget build(BuildContext context) {
    final userId = context.read<SessionCubit>().state.user!.id;

    return FutureBuilder(
      future: context.read<AttendanceBloc>().getAttendance(
        userId: userId,
        subjectId: subjectId,
      ),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SizedBox();

        final result = snapshot.data as Either<Failure, List<AttendanceEntity>>;

        return result.fold((failure) => Text("Error: ${failure.message}"), (
          list,
        ) {
          return Column(
            children: list.map((a) {
              return ListTile(
                title: Text(a.markedAt.toString()),
                trailing: Switch(
                  value: a.status == AttendanceStatus.present,
                  onChanged: (val) {
                    final updated = AttendanceEntity(
                      lectureId: a.lectureId,
                      subjectId: a.subjectId,
                      status: val
                          ? AttendanceStatus.present
                          : AttendanceStatus.absent,
                      markedAt: a.markedAt,
                    );

                    context.read<AttendanceBloc>().add(
                      AddAttendanceEvent(userId: userId, entity: updated),
                    );
                  },
                ),
              );
            }).toList(),
          );
        });
      },
    );
  }
}
