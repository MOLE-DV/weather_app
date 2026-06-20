import 'package:flutter/material.dart';

class ImageBackgroundTheme extends ThemeExtension<ImageBackgroundTheme> {
  const ImageBackgroundTheme({required this.imagePath});

  final String? imagePath;

  @override
  ImageBackgroundTheme copyWith({String? imagePath}) {
    return ImageBackgroundTheme(imagePath: imagePath ?? this.imagePath);
  }

  @override
  ImageBackgroundTheme lerp(covariant ImageBackgroundTheme? other, double t) {
    if (other == null) return this;

    return ImageBackgroundTheme(
      imagePath: t < 0.5 ? imagePath : other.imagePath,
    );
  }
}
