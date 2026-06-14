import 'package:flutter/material.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/utils/custom_text.dart';

enum statType { wind, uv, humidity, pressure }

class WeatherStat extends StatelessWidget {
  final statType type;
  final Current? currentForecast;
  final Daily? dailyForecast;

  const WeatherStat({
    super.key,
    required this.type,
    required this.currentForecast,
    required this.dailyForecast,
  });
  @override
  Widget build(BuildContext context) {
    String value;
    String name;
    IconData weatherIcon;

    switch (type) {
      case statType.wind:
        value = '${currentForecast?.windSpeed10m.round() ?? "-"} km/h';
        name = 'Wiatr';
        weatherIcon = Icons.wind_power_outlined;
        break;
      case statType.humidity:
        value = '${currentForecast?.relativeHumidity2m ?? '-'}%';
        name = 'Wilgotność';
        weatherIcon = Icons.water_drop_outlined;
        break;
      case statType.uv:
        value = '${dailyForecast?.uvIndexMax[0].round() ?? '-'}';
        name = 'UV';
        weatherIcon = Icons.wb_sunny_outlined;
        break;
      case statType.pressure:
        value = '${currentForecast?.surfacePressure.round() ?? '-'} hPa';
        name = 'Ciśnienie';
        weatherIcon = Icons.lock_clock_outlined;
        break;
    }
    return FittedBox(
      child: Row(
        spacing: 10,
        children: [
          Icon(weatherIcon, color: Colors.white, size: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: value, fontSize: 12),
              CustomText(text: name, fontSize: 10, fontWeight: FontWeight(200)),
            ],
          ),
        ],
      ),
    );
  }
}
