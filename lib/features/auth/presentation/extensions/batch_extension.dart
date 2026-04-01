import 'package:campus_connect/features/auth/domain/enums/batch.dart';

extension BatchX on Batch {
  String get displayBatch {
    switch (this) {
      case Batch.b1:
        return "Batch B1";
      case Batch.b2:
        return "Batch B2";
      case Batch.b3:
        return "Batch B3";
      case Batch.b4:
        return "Batch B4";
    }
  }
}
