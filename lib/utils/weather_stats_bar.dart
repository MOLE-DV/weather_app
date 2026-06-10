import 'package:flutter/material.dart';
import 'package:weather_app/utils/weather_stat.dart';

class WeatherStatsBar extends StatelessWidget {
  const WeatherStatsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.spaceBetween,
        children: [
          WeatherStat(type: statType.wind),
          WeatherStat(type: statType.humidity),
          WeatherStat(type: statType.uv),
          WeatherStat(type: statType.pressure),
        ],
      ),
    );
  }
}
