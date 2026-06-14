import 'package:flutter/material.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/icons/weather_icon.dart';
import 'package:weather_app/icons/weather_icons_SVG.dart';
import 'package:weather_app/utils/custom_text.dart';
import 'package:intl/intl.dart';

class HourForecastCard extends StatelessWidget {
  final DateTime date;
  final Hourly? hourlyData;
  const HourForecastCard({
    super.key,
    required this.date,
    required this.hourlyData,
  });

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();

    Color accentColor = Colors.black;

    // format the date to iso8601 string format and remove unnecessary minutes
    String formatedDate = DateFormat("yyyy-MM-dd'T'HH:00").format(date);

    // get index of date in the database then search for temperature data at this index
    int weatherIndex = hourlyData != null
        ? hourlyData!.time.indexOf(formatedDate)
        : 0;
    int weatherCode = hourlyData != null
        ? hourlyData!.weatherCode[weatherIndex]
        : 0;

    if (date.hour == now.hour) {
      accentColor = Colors.blueAccent;
    }
    return Column(
      spacing: 10,
      children: [
        CustomText(
          text: date.hour == now.hour
              ? "Teraz"
              : "${(date.hour) < 10 ? "0" : ""}${(date.hour).toString()}:00",
          color: accentColor,
          fontSize: 12,
          fontWeight: FontWeight(400),
        ),
        WeatherIcon(
          icon: hourlyData != null
              ? getWeatherIcon(weatherCode)
              : WeatherIconsSVG.missingData,
          size: 28,
        ),
        CustomText(
          text: '${hourlyData?.temperature2m[weatherIndex].round() ?? '-'}°',
          color: accentColor,
          fontWeight: FontWeight(800),
        ),
      ],
    );
  }
}
