import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "WELCOME TO CAMPUS CONNECT\n The ultimate super app for your campus",
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context.go('/signup');
              },
              child: Text("Continue"),
            ),
          ],
        ),
      ),
    );
  }
}
