import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              SvgPicture.asset('assets/images/welcome.svg'),
              Text(
                "Welcome to Campus Connect",
                style: GoogleFonts.aBeeZee(
                  color: Color.fromRGBO(45, 43, 46, 1),
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "The ultimate super app for your campus.",
                style: GoogleFonts.dmSans(
                  color: Color.fromRGBO(45, 43, 46, 0.5),
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      debugPrint('Continue btn clicked');
                      context.go('/signup');
                    },
                    child: Text(
                      "Continue",
                      style: GoogleFonts.rubik(
                        fontSize: 18,
                        // color: Color.fromRGBO(45, 43, 46, 0.5),
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Icon(Icons.navigate_next),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
