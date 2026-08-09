import 'dart:async';
import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:app_links/app_links.dart';
import 'package:campus_connect/core/session/session_cubit.dart';
import 'package:campus_connect/core/theme/theme_helper.dart';
import 'package:campus_connect/features/auth/presentation/widgets/auth_submit_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class EmailSentPage extends StatefulWidget {
  final String userEmail;
  const EmailSentPage({super.key, required this.userEmail});

  @override
  State<EmailSentPage> createState() => _EmailSentPageState();
}

class _EmailSentPageState extends State<EmailSentPage> {
  late AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;

  @override
  void initState() {
    super.initState();
    _initDeepLinks();
  }

  void _initDeepLinks() {
    _appLinks = AppLinks();

    // This listens for the link when the user clicks it in Gmail
    // and the app comes back to the foreground!
    _linkSubscription = _appLinks.uriLinkStream.listen((uri) async {
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Force Firebase to check the latest verification status
        await user.reload();

        final refreshedUser = FirebaseAuth.instance.currentUser;
        if (refreshedUser != null && refreshedUser.emailVerified) {
          // It worked! Load the offline data and throw them into the app!
          if (mounted) {
            await context.read<SessionCubit>().loadOfflineUser();
            context.go('/home');
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeHelper.colors.trueBlack,
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/campus_image_2.png',
              fit: BoxFit.cover,
            ),
          ),
          // Dark Gradient Overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppThemeHelper.colors.trueBlack.withValues(alpha: 0.4),
                    AppThemeHelper.colors.trueBlack.withValues(alpha: 0.8),
                    AppThemeHelper.colors.trueBlack,
                  ],
                  stops: const [0.0, 0.6, 1.0],
                ),
              ),
            ),
          ),
          // Main Content
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 36,
                  ),
                  decoration: BoxDecoration(
                    color: AppThemeHelper.colors.trueWhite,
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [
                      BoxShadow(
                        color: AppThemeHelper.colors.trueBlack.withValues(
                          alpha: 0.35,
                        ),
                        spreadRadius: 4,
                        blurRadius: 24,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Premium Success Icon
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: AppThemeHelper.colors.themeGreen.withValues(
                            alpha: 0.1,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.mark_email_read_rounded,
                            color: AppThemeHelper.colors.themeGreen,
                            size: 40,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        "Check your inbox",
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              color: AppThemeHelper.colors.textDark1A,
                              fontWeight: FontWeight.w800,
                              fontSize: 26,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Text.rich(
                        TextSpan(
                          text: "We've sent a verification link to\n",
                          style: TextStyle(
                            color: AppThemeHelper.colors.textBlack54,
                            fontSize: 14,
                            height: 1.5,
                          ),
                          children: [
                            TextSpan(
                              text: widget.userEmail,
                              style: TextStyle(
                                color: AppThemeHelper.colors.textBlack87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const TextSpan(
                              text: "\nPlease verify your email to continue.",
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          border: Border.all(
                            color: AppThemeHelper.colors.themeOrange,
                          ),
                          color: AppThemeHelper.colors.themeOrange.withValues(
                            alpha: 0.1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.info_outline,
                              color: AppThemeHelper.colors.themeOrange,
                              size: 20,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                "Sometimes the email might land in the spam folder",
                                style: TextStyle(
                                  color: AppThemeHelper.colors.themeOrange,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      AuthSubmitButton(
                        buttonLabel: "Open Mail App",
                        onPressed: () async {
                          if (Platform.isAndroid) {
                            const AndroidIntent intent = AndroidIntent(
                              action: 'android.intent.action.MAIN',
                              category: 'android.intent.category.APP_EMAIL',
                              flags: <int>[268435456],
                            );
                            try {
                              await intent.launch();
                            } catch (e) {
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("No mail apps installed"),
                                  ),
                                );
                              }
                            }
                          } else if (Platform.isIOS) {
                            final Uri emailLaunchUri = Uri(scheme: 'message');
                            if (await canLaunchUrl(emailLaunchUri)) {
                              await launchUrl(emailLaunchUri);
                            } else {
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("No mail apps installed"),
                                  ),
                                );
                              }
                            }
                          }
                        },
                      ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: () {
                          context.go('/auth-selection');
                        },
                        child: Text(
                          "Back to Login",
                          style: TextStyle(
                            color: AppThemeHelper.colors.textBlack54,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
