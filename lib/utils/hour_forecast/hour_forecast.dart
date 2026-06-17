import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/utils/hour_forecast/hour_forecast_card.dart';

class HourForecast extends StatelessWidget {
  final Hourly? hourlyData;
  const HourForecast({super.key, required this.hourlyData});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final children = <Widget>[];

    var screenWidth = MediaQuery.of(context).size.width;
    int childrenCount = (clampDouble(screenWidth / 90, 2, 7)).round();

    print(now.add(Duration(hours: childrenCount - 1)));

    for (int i = 0; i < childrenCount; i++) {
      children.add(
        HourForecastCard(
          date: now.add(Duration(hours: i)),
          hourlyData: hourlyData,
        ),
      );

      if (i < childrenCount - 1) {
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
