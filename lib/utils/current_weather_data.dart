import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/utils/custom_text.dart';
import 'package:weather_app/utils/weather_stats_bar.dart';

class CurrentWeatherData extends StatelessWidget {
  const CurrentWeatherData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            CustomText(text: "23", fontSize: 90),
            Transform.translate(
              offset: Offset(0, -32),
              child: CustomText(text: '°', fontSize: 50),
            ),
            Icon(Icons.cloud, color: Colors.white, size: 50),
          ],
        ),
        CustomText(
          text: "Częściowe zachmurzenie",
          fontWeight: FontWeight(400),
          fontSize: 20,
        ),
        CustomText(
          text: 'Odczuwalna 24°',
          fontSize: 15,
          fontWeight: FontWeight(200),
        ),
        WeatherStatsBar(),
      ],
    );
  }
}
