import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends StatelessWidget {
  final String? errorMessage;

  const ErrorPage({super.key, this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Text(
                "This feature is coming soon...",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50),
              SvgPicture.asset('assets/images/404.svg'),
              SizedBox(height: 50),
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
                        color: Colors.grey.shade500,
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
              Spacer(),

              // 🔘 Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.go('/home');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Go Home",
                    style: Theme.of(
                      context,
                    ).textTheme.labelMedium!.copyWith(color: Colors.white),
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
