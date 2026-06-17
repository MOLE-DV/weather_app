import 'package:flutter/material.dart';
import 'package:weather_app/themes/app_theme.dart';
import 'package:weather_app/themes/gradient_theme.dart';

ThemeData darkTheme = AppTheme.base.copyWith(
  scaffoldBackgroundColor: Colors.indigo.shade900,
  cardColor: Colors.indigo,
  extensions: <ThemeExtension>[
    GradientTheme(
      colors: <Color>[Colors.indigoAccent.shade700, Colors.indigo.shade700],
    ),
  ],
);
