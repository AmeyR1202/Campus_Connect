import 'package:campus_connect/features/auth/domain/enums/year.dart';

extension YearX on Year {
  String get displayYear {
    switch (this) {
      case Year.fe:
        return "FE";
      case Year.se:
        return "SE";
      case Year.te:
        return "TE";
      case Year.be:
        return "BE";
    }
  }
}
