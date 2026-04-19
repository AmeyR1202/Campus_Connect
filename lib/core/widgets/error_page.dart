import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends StatelessWidget {
  final String? errorMessage;

  const ErrorPage({super.key, this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                "This feature is coming soon...",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppThemeHelper.colors.textTertiary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              SvgPicture.asset('assets/images/404.svg'),
              const SizedBox(height: 50),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: "Currently a Solo Dev.\n",
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: AppThemeHelper.colors.muted,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: "Scaling fast...",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                      // keeps default color from theme
                    ),
                  ],
                ),
              ),
              const Spacer(),

              // 🔘 Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.go('/home');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppThemeHelper.colors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Go Home",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: AppThemeHelper.colors.textPrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
