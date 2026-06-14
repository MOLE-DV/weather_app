import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/icons/weather_icon.dart';
import 'package:weather_app/icons/weather_icons_SVG.dart';
import 'package:weather_app/utils/custom_text.dart';

class SunriseAndSunsetTime extends StatelessWidget {
  final Daily? dailyWeather;
  const SunriseAndSunsetTime({super.key, required this.dailyWeather});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    // split iso8601 string to show onlt the time after "T" for example : 2026-06-13T02:42
    String sunrise = dailyWeather?.sunrise[0].split("T")[1] ?? '-';
    String sunset = dailyWeather?.sunset[0].split("T")[1] ?? '-';

    return Row(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          spacing: 5,
          children: [
            WeatherIcon(icon: WeatherIconsSVG.day, size: 20),
            CustomText(text: sunrise, color: Colors.black, fontSize: 10),
          ],
        ),
        SleekCircularSlider(
          min: 0,
          max: 1440,
          initialValue: now.hour.toDouble() * 60,
          appearance: CircularSliderAppearance(
            size: 90,
            startAngle: 180,
            angleRange: 180,
            customWidths: CustomSliderWidths(
              progressBarWidth: 2,
              trackWidth: 2,
              handlerSize: 7,
            ),
            customColors: CustomSliderColors(
              dotColor: Colors.amber,
              progressBarColor: Colors.amber,
              trackColor: Colors.grey[100],
            ),
            infoProperties: InfoProperties(
              modifier: (_) {
                return "${now.hour < 10 ? "0" : ""}${now.hour}:${now.minute < 10 ? "0" : ""}${now.minute}";
              },
            ),
          ),
        ),
        Column(
          spacing: 5,
          children: [
            WeatherIcon(icon: WeatherIconsSVG.night, size: 20),
            CustomText(text: sunset, color: Colors.black, fontSize: 10),
          ],
        ),
      ],
    );
  }
}
