import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;
  final bool isOutlined;

  const ActionButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.color,
    this.isOutlined = false,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isOutlined ? Colors.transparent : color;

    final borderColor = color;

    final textColor = isOutlined ? color : Colors.white;

    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          side: BorderSide(color: borderColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
      ),
    );
  }
}
