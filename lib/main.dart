import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/features/splash/presentation/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          headlineLarge: GoogleFonts.sourceSans3(
            fontSize: 40,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          headlineMedium: GoogleFonts.sourceSans3(
            fontSize: 28,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          headlineSmall: GoogleFonts.sourceSans3(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          bodySmall: GoogleFonts.sourceSans3(
            fontSize: 16,
            color: AppColors.greyColor,
          ),
        ),
      ),
      home: SplashScreen(),
    );
  }
}
