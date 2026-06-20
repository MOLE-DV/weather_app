import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weather_app/themes/app_theme.dart';
import 'package:weather_app/themes/extenstions/day_cycle_slider_colors.dart';
import 'package:weather_app/themes/extenstions/gradient_theme.dart';
import 'package:weather_app/themes/extenstions/image_background_theme.dart';

ThemeData darkTheme = AppTheme.base.copyWith(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color.fromARGB(255, 2, 3, 5),
  cardTheme: CardThemeData(
    color: const Color.fromARGB(255, 15, 19, 22),
    shape: RoundedRectangleBorder(
      side: BorderSide(color: Color.fromARGB(255, 22, 25, 26)),
      borderRadius: BorderRadius.circular(15),
    ),
  ),
  textTheme: TextTheme(
    bodyLarge: GoogleFonts.inter(
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight(500),
    ),
    bodyMedium: GoogleFonts.inter(
      color: Colors.white,
      fontSize: 10,
      fontWeight: FontWeight(400),
    ),
    bodySmall: GoogleFonts.inter(
      color: Colors.white,
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
      color: Colors.white,
    ),
  ),
  extensions: <ThemeExtension>[
    GradientTheme(
      colors: <Color>[Colors.indigoAccent.shade700, Colors.indigo.shade700],
    ),
    ImageBackgroundTheme(imagePath: "assets/images/night.jpg"),
    DayCycleSliderColors(
      colors: CustomSliderColors(
        dotColor: const Color.fromARGB(255, 220, 220, 220),
        progressBarColor: Colors.indigo,
        trackColor: const Color.fromARGB(255, 149, 149, 149),
      ),
    ),
  ],
);
