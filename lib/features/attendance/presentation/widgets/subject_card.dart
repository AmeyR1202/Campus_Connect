// import 'package:flutter/material.dart';

// class SubjectCard extends StatelessWidget {
// final String subjectName;
// final double percentage;
// final String statusText;
// final Color statusColor;

// const SubjectCard({
//   super.key,
//   required this.subjectName,
//   required this.percentage,
//   required this.statusText,
//   required this.statusColor,
// });

//   @override
//   Widget build(BuildContext context) {
// return Container(
//   margin: const EdgeInsets.only(bottom: 12),
//   padding: const EdgeInsets.all(16),
//   decoration: BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.circular(18),
//     boxShadow: [
//       BoxShadow(
//         color: Colors.black.withOpacity(0.1),
//         blurRadius: 5,
//         offset: const Offset(0, 4),
//       ),
//     ],
//   ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Top Row
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
// Text(
//   subjectName,
//   style: const TextStyle(
//     fontSize: 16,
//     fontWeight: FontWeight.w600,
//   ),
// ),
//               Row(
//                 children: [
// Text(
//   "${percentage.toStringAsFixed(0)}%",
//   style: const TextStyle(
//     fontSize: 16,
//     fontWeight: FontWeight.bold,
//   ),
// ),
//         const SizedBox(width: 6),
//         CircleAvatar(radius: 6, backgroundColor: statusColor),
//       ],
//     ),
//   ],
// ),

//           const SizedBox(height: 10),

//           // Status Text
// Row(
//   children: [
//     Text(
//       'Must Attend: 3',
//       style: Theme.of(
//         context,
//       ).textTheme.labelMedium!.copyWith(color: statusColor),
//     ),

//     SizedBox(
//       height: 16,
//       child: VerticalDivider(color: Colors.grey, thickness: 1),
//     ),
//     Text(
//       'Can Bunk: 3',
//       style: Theme.of(
//         context,
//       ).textTheme.labelMedium!.copyWith(color: statusColor),
//     ),
//   ],
// ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class SubjectCard extends StatelessWidget {
  final String subjectName;
  final double percentage;
  final String statusText;
  final Color statusColor;

  const SubjectCard({
    super.key,
    required this.subjectName,
    required this.percentage,
    required this.statusText,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: statusColor.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subjectName,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    'Must Attend: 3',
                    style: Theme.of(
                      context,
                    ).textTheme.labelMedium!.copyWith(color: statusColor),
                  ),

                  SizedBox(
                    height: 16,
                    child: VerticalDivider(color: Colors.grey, thickness: 1),
                  ),
                  Text(
                    'Can Bunk: 3',
                    style: Theme.of(
                      context,
                    ).textTheme.labelMedium!.copyWith(color: statusColor),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          Text(
            "${percentage.toStringAsFixed(0)}%",
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.w700,
              color: statusColor,
            ),
          ),
        ],
      ),
    );
  }
}
