import 'package:flutter/material.dart';
import 'package:weather_app/icons/weather_icon.dart';
import 'package:weather_app/icons/weather_icons_SVG.dart';
import 'package:weather_app/utils/custom_text.dart';

class WeekForecastCard extends StatelessWidget {
  const WeekForecastCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          spacing: 5,
          children: [
            CustomText(
              text: "Dziś",
              fontWeight: FontWeight(500),
              color: Colors.black,
              fontSize: 15,
            ),
            CustomText(
              text: "24 MAJ",
              fontWeight: FontWeight(300),
              color: Colors.black,
              fontSize: 8,
            ),
          ],
        ),
        Row(
          spacing: 15,
          children: [
            WeatherIcon(icon: WeatherIconsSVG.cloudy, size: 20),
            CustomText(
              text: "Częściowe zachmurzenie",
              color: Colors.black,
              fontWeight: FontWeight(400),
              fontSize: 12,
            ),
          ],
        ),
      ],
    );
  }
}
