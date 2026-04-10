import 'package:campus_connect/features/auth/domain/enums/batch.dart';

extension BatchX on Batch {
  String get displayBatch {
    switch (this) {
      case Batch.b1:
        return "B1";
      case Batch.b2:
        return "B2";
      case Batch.b3:
        return "B3";
      case Batch.b4:
        return "B4";
    }
  }
}
