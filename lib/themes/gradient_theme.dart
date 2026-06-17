import 'package:flutter/material.dart';

class GradientTheme extends ThemeExtension<GradientTheme> {
  const GradientTheme({required this.colors});

  final List<Color>? colors;

  @override
  GradientTheme copyWith({List<Color>? colors}) {
    return GradientTheme(colors: colors ?? this.colors);
  }

  @override
  GradientTheme lerp(GradientTheme? other, double t) {
    if (other is! GradientTheme) {
      return this;
    }
    return GradientTheme(
      colors: colors?.asMap().entries.map((entry) {
        final index = entry.key;

        return Color.lerp(entry.value, other.colors?[index], t)!;
      }).toList(),
    );
  }
}
