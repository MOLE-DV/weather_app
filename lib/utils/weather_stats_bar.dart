import 'package:flutter/material.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/utils/weather_stat.dart';

class WeatherStatsBar extends StatelessWidget {
  final Current? currentForecast;
  final Daily? dailyForecast;

  const WeatherStatsBar({
    super.key,
    required this.currentForecast,
    required this.dailyForecast,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 15, right: 15),
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.spaceBetween,
        children: [
          WeatherStat(
            type: statType.wind,
            dailyForecast: dailyForecast,
            currentForecast: currentForecast,
          ),
          WeatherStat(
            type: statType.humidity,
            dailyForecast: dailyForecast,
            currentForecast: currentForecast,
          ),
          WeatherStat(
            type: statType.uv,
            dailyForecast: dailyForecast,
            currentForecast: currentForecast,
          ),
          WeatherStat(
            type: statType.pressure,
            dailyForecast: dailyForecast,
            currentForecast: currentForecast,
          ),
        ],
      ),
    );
  }
}
