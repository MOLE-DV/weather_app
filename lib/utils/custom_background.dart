import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/themes/extenstions/image_background_theme.dart';

class CustomBackground extends StatelessWidget {
  Widget child;
  VoidCallback onImageFinishedLoading;
  CustomBackground({
    super.key,
    required this.child,
    required this.onImageFinishedLoading,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        SizedBox(
          width: screenWidth,
          height: clampDouble(screenHeight * 0.4, 400, 600),
          child: ShaderMask(
            shaderCallback: (rect) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black, Colors.black, Colors.transparent],
              ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
            },
            blendMode: BlendMode.dstIn,
            child: Image(
              fit: BoxFit.cover,
              alignment: Alignment.center,
              image: AssetImage(
                Theme.of(
                      context,
                    ).extension<ImageBackgroundTheme>()?.imagePath ??
                    "assets/images/clouds.jpg",
              ),
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                if (frame != null) {
                  onImageFinishedLoading();
                }
                return child;
              },
            ),
          ),
        ),
        child,
      ],
    );
  }
}
