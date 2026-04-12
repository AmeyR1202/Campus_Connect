import 'package:flutter/material.dart';

class CustomBottomSheet {
  static void show(BuildContext context) {
    showModalBottomSheet(
      // isScrollControlled: true,
      useRootNavigator: true,
      context: context,
      builder: (BuildContext context) {
        return Container(color: Colors.grey.shade200);
      },
    );
  }
}
