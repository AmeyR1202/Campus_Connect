# Consolidate Attendance into Timetable Page

The goal is to centralize marking attendance to a single source of truth: the Timetable Page. We will remove the redundant `AttendancePage` completely, modify `HomePage` and `SubjectDetailsPage` to be read-only views, and upgrade `TimetablePage` to support viewing and editing lectures for both today and the past 7 days.

## User Review Required

> [!WARNING]
> This will completely delete the `AttendancePage` (`lib/features/attendance/presentation/pages/attendance_page.dart`) as per the requirement. Is there any logic inside `AttendancePage` (besides marking present/absent) that should be preserved? The plan currently assumes we just delete it and remove its route.

## Proposed Changes

### 1. Attendance Data and UseCases

To support fetching timetable lectures for specific days, we will update the data layer to use the given `DateTime`.

#### [MODIFY] `timetable_event.dart`

- Add `DateTime date` property to `FetchTimetableEvent`.

#### [MODIFY] `timetable_bloc.dart`

- Pass `event.date` to `getTimetableUsecase`.

#### [MODIFY] `get_timetable_usecase.dart`

- Accept `DateTime date` as a parameter.

#### [MODIFY] `timetable_repository.dart`

- Accept `DateTime date` as a parameter.

#### [MODIFY] `timetable_repository_impl.dart`

- Use the passed `DateTime date` instead of `DateTime.now()` to determine `todayDay` and generate entities via `m.toEntity(date)`.

---

### 2. UI - Timetable Page (The Core Feature)

The `TimetablePage` must act as the primary interface for marking and editing attendance.

#### [MODIFY] `timetable_page.dart`

- **Date Selector**: Add a horizontal scrolling list of dates combining the last 7 days and today.
- **Fetch Logic**: When a user selects a date, triggering `FetchTimetableEvent` with the selected date.
- **Marking/Editing Attendance**: Retrieve the user's previously marked attendance records from `context.read<AttendanceBloc>().state.attendance`. Match each lecture's `lectureId` with the `AttendanceEntity.lectureId`.
  - Display whether it was marked **Present**, **Absent**, or **Unmarked**.
  - Provide inline toggle buttons/chips to mark or switch between Present/Absent, firing `AddAttendanceEvent` to overwrite/upsert the record.

---

### 3. UI - Read-Only Views

Enforce the rule that only Timetable can write attendance. Home Page and Subject Details will serve as read-only stats.

#### [MODIFY] `app_router.dart`

- Remove the `/attendance` route that navigates to `AttendancePage`.

#### [DELETE] `attendance_page.dart`

- Completely remove the file.

#### [MODIFY] `home_page.dart`

- Remove the `GestureDetector` around `SubjectCard` that incorrectly navigates to `/attendance`. Tapping the card can either do nothing or open subject history.
- Ensure there is a clear CTA stating "Go to Timetable" placed prominently at the top of the Home layout which will route the user to `/timetable`.

#### [MODIFY] `subject_details_page.dart`

- No writing operations found, but will confirm that it only contains historical stats routing and UI visualization.

## Open Questions

- When tapping a Subject Card on the `HomePage`, should it navigate to `/subjects/:subjectId/history`, or should it just be un-tappable/read-only? I plan to make it navigate to the history page instead of marking attendance. Is that correct?

## Verification Plan

### Manual Verification

1. Verify `AttendancePage` is deleted.
2. Launch the app and view `HomePage`. Check that tapping standard subjects navigates to History. Click the new "Go to Timetable" CTA Button and confirm it goes to `TimetablePage`.
3. In `TimetablePage`, observe the date strip. Ensure it displays dates up to 7 days in the past.
4. Select a past date, mark it as Present. Change selection away and back. Verify attendance is now "Present".
5. Select a past date, change a "Present" to "Absent" (Toggle), verify the edit reflects properly.
6. Verify no other pages contain attendance marking options.
