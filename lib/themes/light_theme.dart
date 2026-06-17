import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/themes/app_theme.dart';
import 'package:weather_app/themes/gradient_theme.dart';

ThemeData lightTheme = AppTheme.base.copyWith(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
  textSelectionTheme: TextSelectionThemeData(
    selectionColor: Colors.blueAccent[100],
    cursorColor: Colors.blueAccent[100],
    selectionHandleColor: Colors.blueAccent[100],
  ),
  scaffoldBackgroundColor: Colors.grey[100],
  cardTheme: CardThemeData(
    color: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  ),
  extensions: <ThemeExtension<dynamic>>[
    GradientTheme(colors: [Colors.blue, Colors.blueAccent]),
  ],
);
