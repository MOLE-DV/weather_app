import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WeatherIcon extends StatelessWidget {
  final String icon;
  final double size;
  const WeatherIcon({super.key, required this.icon, required this.size});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 2,
      child: SvgPicture.asset(
        icon.toString(),
        height: size,
        width: size,
        fit: BoxFit.fill,
      ),
    );
  }
}
