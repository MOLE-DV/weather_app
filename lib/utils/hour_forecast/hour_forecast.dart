import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/utils/hour_forecast/hour_forecast_card.dart';

class HourForecast extends StatelessWidget {
  final Hourly? hourlyData;
  final Daily? dailyData;
  const HourForecast({
    super.key,
    required this.hourlyData,
    required this.dailyData,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final children = <Widget>[];

    var screenWidth = MediaQuery.of(context).size.width;
    double childrenCount = clampDouble(
      20,
      0,
      hourlyData?.time.length.toDouble() ?? 0,
    );

    for (int i = 0; i < childrenCount; i++) {
      children.add(
        HourForecastCard(
          date: now.add(Duration(hours: i)),
          hourlyData: hourlyData,
          dailyData: dailyData,
        ),
      );

      if (i < childrenCount - 1) {
        children.add(const VerticalDivider());
      }
    }

    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(spacing: 20, children: children),
          ),
        ],
      ),
    );
  }
}
