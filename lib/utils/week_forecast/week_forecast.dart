import 'package:flutter/material.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/utils/week_forecast/week_forecast_card.dart';

class WeekForecast extends StatelessWidget {
  final Daily? dailyForecast;
  const WeekForecast({super.key, required this.dailyForecast});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    final children = <Widget>[];

    for (int i = 0; i < 7; i++) {
      children.add(
        WeekForecastCard(
          date: now.add(Duration(days: i)),
          dailyForecast: dailyForecast,
        ),
      );
    }

    return Column(spacing: 15, children: children);
  }
}
