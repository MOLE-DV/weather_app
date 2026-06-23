import 'package:flutter/material.dart';
import 'package:weather_app/themes/extenstions/gradient_theme.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors:
                Theme.of(context).extension<GradientTheme>()?.colors ??
                <Color>[],
          ),
        ),
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
