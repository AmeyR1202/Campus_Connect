import 'package:flutter/material.dart';

enum DeviceType {
  mobileSmall,
  mobile,
  tablet,
  desktop,
}

class DeviceBreakpoints {
  static DeviceType getDeviceType(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    if (width < 360) return DeviceType.mobileSmall;
    if (width < 600) return DeviceType.mobile;
    if (width < 900) return DeviceType.tablet;
    return DeviceType.desktop;
  }
}
