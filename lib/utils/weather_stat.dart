import 'package:flutter/material.dart';
import 'package:weather_app/utils/custom_text.dart';

enum statType { wind, humidity, uv, pressure }

class WeatherStat extends StatelessWidget {
  final statType type;
  WeatherStat({super.key, required this.type});
  @override
  Widget build(BuildContext context) {
    String value;
    String name;
    IconData weather_icon;

    switch (type) {
      case statType.wind:
        value = '11 km/h';
        name = 'Wiatr';
        weather_icon = Icons.wind_power_outlined;
        break;
      case statType.humidity:
        value = '45%';
        name = 'Wilgotność';
        weather_icon = Icons.water_drop_outlined;
        break;
      case statType.uv:
        value = '5';
        name = 'UV';
        weather_icon = Icons.wb_sunny_outlined;
        break;
      case statType.pressure:
        value = '1016 hPa';
        name = 'Ciśnienie';
        weather_icon = Icons.lock_clock_outlined;
        break;
    }
    return FittedBox(
      child: Row(
        spacing: 10,
        children: [
          Icon(weather_icon, color: Colors.white, size: 20),
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
