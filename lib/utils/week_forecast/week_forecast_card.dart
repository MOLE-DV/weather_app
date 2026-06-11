import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/icons/weather_icon.dart';
import 'package:weather_app/icons/weather_icons_SVG.dart';
import 'package:weather_app/utils/custom_text.dart';
import 'package:weather_app/utils/month_and_week_names.dart';

class WeekForecastCard extends StatelessWidget {
  final DateTime date;
  final String weather;
  final List<int> temps;
  const WeekForecastCard({
    super.key,
    required this.date,
    required this.weather,
    required this.temps,
  });
  @override
  Widget build(BuildContext context) {
    MonthAndWeekNames monthAndWeekNames = MonthAndWeekNames();
    String formatedDate =
        "${date.day.toString()} ${monthAndWeekNames.getMonthName(date.month - 1, SupportedLanguage.pl)}";
    DateTime now = DateTime.now();

    var screenWidth = MediaQuery.of(context).size.width;

    double weatherTextShrinkWidth = 450;
    String formatedWeatherString = weather;
    if (screenWidth <= weatherTextShrinkWidth) {
      formatedWeatherString =
          weather.substring(
            0,
            clampDouble(
              screenWidth / 4.5 / (weather.length * 0.5),
              0,
              weather.length - 1,
            ).toInt(),
          ) +
          "...";
    }
    ;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // date
        SizedBox(
          width: 85,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              CustomText(
                text: date.compareTo(now) == 0
                    ? "Dziś"
                    : monthAndWeekNames.getWeekName(
                        date.weekday - 1,
                        SupportedLanguage.pl,
                      ),
                fontWeight: FontWeight(500),
                color: Colors.black,
                fontSize: 13,
              ),
              CustomText(
                text: formatedDate,
                fontWeight: FontWeight(300),
                color: Colors.black,
                fontSize: 8,
              ),
            ],
          ),
        ),

        // current weather conditions
        SizedBox(
          width: screenWidth <= weatherTextShrinkWidth ? screenWidth / 4 : 200,
          child: Row(
            spacing: 15,
            children: [
              WeatherIcon(icon: WeatherIconsSVG.cloudy, size: 15),
              CustomText(
                text: formatedWeatherString,
                color: Colors.black,
                fontWeight: FontWeight(300),
                fontSize: 10,
              ),
            ],
          ),
        ),

        // temperatures throughout the day
        Row(
          spacing: 10,
          children: [
            CustomText(
              text: "${temps[0]}°",
              color: Colors.blueAccent,
              fontSize: 12,
            ),
            screenWidth > 480
                ? Container(
                    width: screenWidth / 10,
                    height: 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color>[Colors.blue, Colors.orangeAccent],
                      ),
                    ),
                  )
                : SizedBox.shrink(),
            CustomText(
              text: "${temps[1]}°",
              color: Colors.orangeAccent,
              fontSize: 12,
            ),
          ],
        ),
      ],
    );
  }
}
