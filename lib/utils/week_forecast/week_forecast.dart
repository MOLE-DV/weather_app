import 'package:flutter/material.dart';
import 'package:weather_app/utils/week_forecast/week_forecast_card.dart';

class WeekForecast extends StatelessWidget {
  const WeekForecast({super.key});

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];

    for (int i = 0; i < 7; i++) {
      children.add(WeekForecastCard());
    }

    return Column(spacing: 15, children: children);
  }
}
