import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {
  Widget child;
  CustomBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        SizedBox(
          width: screenWidth,
          height: clampDouble(screenHeight * 0.45, 450, 600),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
            child: Image(
              fit: BoxFit.cover,
              alignment: Alignment.center,
              image: AssetImage('assets/images/clouds.jpg'),
            ),
          ),
        ),
        child,
      ],
    );
  }
}
