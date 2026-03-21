import 'package:flutter/material.dart';

class StudentHeroCard extends StatelessWidget {
  final String name;
  final String semester;
  final String year;
  final String branch;

  const StudentHeroCard({
    super.key,
    required this.name,
    required this.semester,
    required this.year,
    required this.branch,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(20),
        child: ColoredBox(
          color: Colors.blue.withValues(alpha: 0.2),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('Name: ', style: _labelStyle()),
                    Text(name, style: _valueStyle()),
                    const Spacer(),
                    Text('Year: ', style: _labelStyle()),
                    Text(year, style: _valueStyle()),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text('Semester: ', style: _labelStyle()),
                    Text(semester, style: _valueStyle()),
                    const Spacer(),
                    Text('Branch: ', style: _labelStyle()),
                    Text(branch, style: _valueStyle()),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextStyle _labelStyle() {
    return TextStyle(
      color: Colors.grey.shade600,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle _valueStyle() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );
  }
}
