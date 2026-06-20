import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class DayCycleSliderColors extends ThemeExtension<DayCycleSliderColors> {
  const DayCycleSliderColors({required this.colors});

  final CustomSliderColors? colors;

  @override
  DayCycleSliderColors copyWith({CustomSliderColors? colors}) {
    return DayCycleSliderColors(colors: colors ?? this.colors);
  }

  @override
  DayCycleSliderColors lerp(covariant DayCycleSliderColors? other, double t) {
    if (other is! DayCycleSliderColors) {
      return this;
    }
    return DayCycleSliderColors(
      colors: CustomSliderColors(
        trackColor: Color.lerp(colors?.trackColor, other.colors?.trackColor, t),
        progressBarColor: Color.lerp(
          colors?.progressBarColor,
          other.colors?.progressBarColor,
          t,
        ),
        progressBarColors: colors?.progressBarColors?.asMap().entries.map((
          entry,
        ) {
          final index = entry.key;

          return Color.lerp(
            entry.value,
            other.colors?.progressBarColors?[index],
            t,
          )!;
        }).toList(),
        gradientStartAngle: lerpDouble(
          colors?.gradientStartAngle,
          other.colors?.gradientStartAngle,
          t,
        ),
        gradientEndAngle: lerpDouble(
          colors?.gradientEndAngle,
          other.colors?.gradientEndAngle,
          t,
        ),
        trackColors: colors?.trackColors?.asMap().entries.map((entry) {
          final index = entry.key;

          return Color.lerp(entry.value, other.colors?.trackColors?[index], t)!;
        }).toList(),
        trackGradientStartAngle: lerpDouble(
          colors?.trackGradientStartAngle,
          other.colors?.trackGradientStartAngle,
          t,
        ),
        trackGradientEndAngle: lerpDouble(
          colors?.trackGradientEndAngle,
          other.colors?.trackGradientEndAngle,
          t,
        ),
        hideShadow: t < 0.5
            ? colors?.hideShadow ?? false
            : other.colors?.hideShadow ?? false,

        shadowColor: Color.lerp(
          colors?.shadowColor,
          other.colors?.shadowColor,
          t,
        ),
        shadowMaxOpacity: lerpDouble(
          colors?.shadowMaxOpacity,
          other.colors?.shadowMaxOpacity,
          t,
        ),
        shadowStep: lerpDouble(colors?.shadowStep, other.colors?.shadowStep, t),
        dotColor: Color.lerp(colors?.dotColor, other.colors?.dotColor, t),
        dynamicGradient: t < 0.5
            ? colors?.dynamicGradient ?? false
            : other.colors?.dynamicGradient ?? false,
      ),
    );
  }
}
