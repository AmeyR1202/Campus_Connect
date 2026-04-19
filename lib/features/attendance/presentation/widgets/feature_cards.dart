import 'package:campus_connect/core/layout/app_spacing.dart';
import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:flutter/material.dart';

class FeatureCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const FeatureCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSpacing.radius(context)),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.scale(context, 12),
          vertical: AppSpacing.scale(context, 8),
        ),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(AppSpacing.radius(context)),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: AppSpacing.scale(context, 18),
              backgroundColor: color.withValues(alpha: 0.25),
              child: Icon(
                icon,
                color: color,
                size: AppSpacing.scale(context, 20),
              ),
            ),
            SizedBox(width: AppSpacing.scale(context, 8)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.visible,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: AppSpacing.scale(context, 2)),
                  Text(
                    subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: AppThemeHelper.colors.muted,
                      height: 1.1,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: AppSpacing.scale(context, 4)),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: AppSpacing.scale(context, 14),
              color: AppThemeHelper.colors.textTertiary,
            ),
          ],
        ),
      ),
    );
  }
}
