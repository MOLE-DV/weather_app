import 'package:flutter/material.dart';
import 'package:weather_app/icons/weather_icon.dart';
import 'package:weather_app/icons/weather_icons_SVG.dart';
import 'package:weather_app/utils/custom_text.dart';

class HourForecastCard extends StatelessWidget {
  final int hour;
  const HourForecastCard({super.key, required this.hour});

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    int current_hour = now.hour;
    Color accent_color = Colors.black;

    if (hour == current_hour) {
      accent_color = Colors.blueAccent;
    }
    return Column(
      spacing: 10,
      children: [
        CustomText(
          text: hour == current_hour
              ? "Teraz"
              : "${(hour) < 10 ? "0" : ""}${(hour).toString()}:00",
          color: accent_color,
          fontSize: 12,
          fontWeight: FontWeight(400),
        ),
        WeatherIcon(icon: WeatherIconsSVG.cloudyDay1, size: 28),
        CustomText(
          text: "23°",
          color: accent_color,
          fontWeight: FontWeight(800),
        ),
      ],
    );
  }
}
