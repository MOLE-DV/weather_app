import 'package:flutter/material.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/hive/temperature_unit_adapter.dart';
import 'package:weather_app/utils/custom_text.dart';

class WeatherStat extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const WeatherStat({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        spacing: 10,
        children: [
          Icon(icon, color: Colors.white, size: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: value, fontSize: 12),
              CustomText(
                text: label,
                fontSize: 10,
                fontWeight: FontWeight(200),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
