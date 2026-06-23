import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weather_app/themes/app_theme.dart';
import 'package:weather_app/themes/extenstions/day_cycle_slider_colors.dart';
import 'package:weather_app/themes/extenstions/gradient_theme.dart';

ThemeData lightTheme = AppTheme.base.copyWith(
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
  textSelectionTheme: TextSelectionThemeData(
    selectionColor: Colors.blueAccent[100],
    cursorColor: Colors.blueAccent[100],
    selectionHandleColor: Colors.blueAccent[100],
  ),
  scaffoldBackgroundColor: Colors.grey[100],
  cardTheme: CardThemeData(
    color: Colors.white,
    shape: RoundedRectangleBorder(
      side: BorderSide(color: Color.fromARGB(255, 242, 242, 242)),
      borderRadius: BorderRadius.circular(15),
    ),
  ),
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.inter(color: Colors.black, fontSize: 20),
    bodyLarge: GoogleFonts.inter(
      color: Colors.black,
      fontSize: 12,
      fontWeight: FontWeight(500),
    ),
    bodyMedium: GoogleFonts.inter(
      color: Colors.black,
      fontSize: 10,
      fontWeight: FontWeight(400),
    ),
    bodySmall: GoogleFonts.inter(
      color: Colors.black,
      fontSize: 8,
      fontWeight: FontWeight(400),
    ),
    labelSmall: GoogleFonts.inter(
      color: Colors.blueAccent,
      fontWeight: FontWeight(400),
      fontSize: 10,
    ),
    labelMedium: GoogleFonts.inter(
      color: Colors.blueAccent,
      fontSize: 12,
      fontWeight: FontWeight(400),
    ),
    labelLarge: GoogleFonts.inter(
      fontSize: 15,
      fontWeight: FontWeight(400),
      color: Colors.black,
    ),
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(color: Colors.white),
  extensions: <ThemeExtension<dynamic>>[
    GradientTheme(colors: [Colors.blue, Colors.blueAccent]),
    DayCycleSliderColors(
      colors: CustomSliderColors(
        dotColor: Colors.amber,
        progressBarColor: Colors.amber,
        trackColor: Colors.grey[100],
      ),
    ),
  ],
);
