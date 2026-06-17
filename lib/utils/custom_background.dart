import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(10),
            ),
            child: Image(
              fit: BoxFit.cover,
              alignment: Alignment.center,
              image: AssetImage('assets/images/clouds.jpg'),
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
