import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/themes/dark_theme.dart';
import 'package:weather_app/themes/light_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData base = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: WidgetStateProperty.all(0),
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        ),
        backgroundColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.hovered)) {
            return Colors.grey.shade300.withAlpha(60);
          }
          return Colors.grey.shade300.withAlpha(70);
        }),
        side: WidgetStateProperty.all(BorderSide(color: Colors.white24)),
      ),
    ),
    inputDecorationTheme: InputDecorationThemeData(
      filled: true,
      fillColor: Colors.grey.shade300.withAlpha(40),
      hintStyle: GoogleFonts.inter(
        color: Colors.grey.shade200,
        fontWeight: FontWeight(200),
        fontSize: 13,
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.white24),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.white24),
      ),
    ),
  );

  static ThemeData light = lightTheme;
  static ThemeData dark = darkTheme;
}
