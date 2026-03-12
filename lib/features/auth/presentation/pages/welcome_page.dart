import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              "WELCOME TO CAMPUS CONNECT\n The ultimate super app for your campus",
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
