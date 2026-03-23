import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.blue.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Icon(Icons.trending_up, size: 50, color: Colors.blue),
          SizedBox(height: 16),

          Text(
            "Start tracking your attendance",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),

          SizedBox(height: 8),

          Text(
            "Mark your lectures to see detailed attendance stats.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black54),
          ),

          SizedBox(height: 16),

          ElevatedButton(
            onPressed: () {
              context.go('/attendance');
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: Text(
              "Go to Attendance",
              style: Theme.of(
                context,
              ).textTheme.labelMedium!.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
