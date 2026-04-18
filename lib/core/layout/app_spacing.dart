import 'package:flutter/material.dart';
import 'device_breakpoints.dart';

class AppSpacing {
  static const double sm = 8.0;
  static const double md = 14.0;
  static const double lg = 22.0;
  static const double xl = 28.0;

  static double padding(BuildContext context) {
    switch (DeviceBreakpoints.getDeviceType(context)) {
      case DeviceType.mobileSmall:
      case DeviceType.mobile:
        return 14.0;
      case DeviceType.tablet:
        return 22.0;
      case DeviceType.desktop:
        return 28.0;
    }
  }

  static double radius(BuildContext context) {
    switch (DeviceBreakpoints.getDeviceType(context)) {
      case DeviceType.mobileSmall:
      case DeviceType.mobile:
        return 14.0;
      case DeviceType.tablet:
      case DeviceType.desktop:
        return 18.0;
    }
  }

  // Smooth scalar for fonts avoiding excessive sizes on tablet
  static double scale(BuildContext context, double base) {
    double width = MediaQuery.sizeOf(context).width;
    double scaleFactor = width / 375.0;
    scaleFactor = scaleFactor.clamp(0.85, 1.25);
    return base * scaleFactor;
  }
}
