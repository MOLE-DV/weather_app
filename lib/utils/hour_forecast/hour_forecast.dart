import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/utils/hour_forecast/hour_forecast_card.dart';

class HourForecast extends StatelessWidget {
  const HourForecast({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final children = <Widget>[];

    var screenWidth = MediaQuery.of(context).size.width;
    int children_count = (clampDouble(screenWidth / 90, 2, 7)).round();

    for (int i = 0; i < children_count; i++) {
      children.add(HourForecastCard(hour: now.add(Duration(hours: i)).hour));

      if (i < children_count - 1) {
        children.add(const VerticalDivider());
      }
    }

    return SizedBox(
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: children,
      ),
    );
  }
}
