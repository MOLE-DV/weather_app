import 'package:flutter/material.dart';
import 'package:weather_app/utils/week_forecast/week_forecast_card.dart';

class WeekForecast extends StatelessWidget {
  const WeekForecast({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    final children = <Widget>[];
    List<String> exampleWeather = [
      "Częściowe zachmurzenie",
      "Słonecznie",
      "Przelotne opady",
      "Zachmurzenie duże",
      "Częściowe zachmurzenie",
      "Słonecznie",
      "Częściowe zachmurzenie",
    ];
    List<List<int>> exampleTemps = [
      [15, 26],
      [14, 27],
      [13, 22],
      [12, 20],
      [13, 23],
      [15, 25],
      [15, 24],
    ];

    for (int i = 0; i < 7; i++) {
      children.add(
        WeekForecastCard(
          date: now.add(Duration(days: i)),
          weather: exampleWeather[i],
          temps: exampleTemps[i],
        ),
      );
    }

    return Column(spacing: 15, children: children);
  }
}
