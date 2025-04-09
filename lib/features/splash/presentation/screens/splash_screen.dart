import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 24, 47),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: Column(
            children: [
              Image.asset("assets/Group 3090.png"),
              Text(
                "Dicover all about sport",
                style: GoogleFonts.sourceSans3(fontSize: 50),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
