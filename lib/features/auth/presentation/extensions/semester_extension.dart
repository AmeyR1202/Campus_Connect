import 'package:campus_connect/features/auth/domain/enums/semester.dart';

extension SemesterX on Semester {
  String get displayName {
    return "Sem ${index + 1}";
  }
}
