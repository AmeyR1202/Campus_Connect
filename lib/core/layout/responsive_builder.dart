import 'package:flutter/material.dart';
import 'device_breakpoints.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ResponsiveBuilder({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    final device = DeviceBreakpoints.getDeviceType(context);

    if (device == DeviceType.desktop && desktop != null) {
      return desktop!;
    }

    if ((device == DeviceType.tablet || device == DeviceType.desktop) && tablet != null) {
      return tablet!;
    }

    return mobile;
  }
}
