import 'package:campus_connect/features/auth/domain/enums/branch.dart';

extension BranchX on Branch {
  String get displayBranch {
    switch (this) {
      case Branch.comps:
        return "Comps";
      case Branch.iot:
        return "IoT";
      case Branch.mechanical:
        return "Mech";
      case Branch.electrical:
        return "Elect";
      case Branch.aids:
        return "AIDS";
    }
  }
}
