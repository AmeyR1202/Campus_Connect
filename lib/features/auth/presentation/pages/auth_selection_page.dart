import 'dart:async';

import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:campus_connect/features/auth/presentation/widgets/auth_submit_button.dart';
import 'package:campus_connect/features/auth/presentation/widgets/login_bottom_sheet.dart';
import 'package:campus_connect/features/auth/presentation/widgets/sign_up_bottom_sheet.dart';
import 'package:flutter/material.dart';

class AuthSelectionPage extends StatefulWidget {
  const AuthSelectionPage({super.key});

  @override
  State<AuthSelectionPage> createState() => _AuthSelectionPageState();
}

class _AuthSelectionPageState extends State<AuthSelectionPage> {
  int _currentIndex = 0;
  final List<String> _images = [
    'assets/images/campus_image_1.png',
    'assets/images/campus_image_2.png',
    'assets/images/campus_image_3.png',
  ];
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Auto-slide every 4 seconds
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _images.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeHelper.colors.trueBlack,
      body: Stack(
        children: [
          // Background Carousel
          Positioned.fill(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 1000), // Smooth 1s fade
              child: Container(
                key: ValueKey<int>(_currentIndex),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(_images[_currentIndex]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppThemeHelper.colors.trueBlack.withValues(alpha: 0.3),
                    AppThemeHelper.colors.trueBlack.withValues(alpha: 0.8),
                    AppThemeHelper
                        .colors
                        .trueBlack, // Solid black at the very bottom
                  ],
                  stops: const [0.0, 0.6, 1.0],
                ),
              ),
            ),
          ),
          // Main Content
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome to the\nCommunity",
                        style: Theme.of(context).textTheme.headlineLarge
                            ?.copyWith(
                              color: AppThemeHelper.colors.trueWhite,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1.2,
                              fontSize: 32,
                              height: 1.2,
                            ),
                      ),
                      const SizedBox(height: 16),
                      // Thriller dynamic text added here!
                      Text(
                        "Discover events, connect with peers, and elevate your entire campus experience.",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppThemeHelper.colors.textWhite70,
                          fontWeight: FontWeight.w400,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                // Carousel Indicator Dots
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _images.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 6,
                      width: _currentIndex == index ? 24 : 6,
                      decoration: BoxDecoration(
                        color: _currentIndex == index
                            ? AppThemeHelper.colors.trueWhite
                            : AppThemeHelper.colors.trueWhite.withValues(
                                alpha: 0.5,
                              ),
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Bottom Card
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 36,
                  ),
                  decoration: BoxDecoration(
                    color: AppThemeHelper.colors.trueWhite,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AuthSubmitButton(
                        buttonLabel: "Log in",
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor:
                                AppThemeHelper.colors.trueTransparent,
                            builder: (context) => const LoginBottomSheet(),
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      AuthSubmitButton(
                        buttonLabel: "Sign up",
                        isOutlined: true,
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor:
                                AppThemeHelper.colors.trueTransparent,
                            builder: (context) => const SignUpBottomSheet(),
                          );
                        },
                      ),
                      const SizedBox(height: 24),
                      Text.rich(
                        TextSpan(
                          text:
                              "By continuing, you agree to Campus Connect's\n",
                          style: TextStyle(
                            color: AppThemeHelper.colors.textBlack54,
                            fontSize: 12,
                            height: 1.5,
                          ),
                          children: [
                            TextSpan(
                              text: "Privacy Policy",
                              style: TextStyle(
                                color: AppThemeHelper.colors.textBlack87,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            const TextSpan(text: " and "),
                            TextSpan(
                              text: "Terms of Use",
                              style: TextStyle(
                                color: AppThemeHelper.colors.textBlack87,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
