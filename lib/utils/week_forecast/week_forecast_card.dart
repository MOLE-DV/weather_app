import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/icons/weather_icon.dart';
import 'package:weather_app/icons/weather_icons_SVG.dart';
import 'package:weather_app/resources/global_resource.dart';
import 'package:weather_app/utils/custom_text.dart';
import 'package:weather_app/utils/month_and_week_names.dart';
import 'package:weather_app/utils/translations/translation.dart';

class WeekForecastCard extends StatelessWidget {
  final DateTime date;
  final Daily? dailyForecast;
  const WeekForecastCard({
    super.key,
    required this.date,
    required this.dailyForecast,
  });

  @override
  Widget build(BuildContext context) {
    Translation translation = GlobalResource.of(
      context,
    ).appTranslation.translations;

    String formatedDate =
        "${date.day.toString()} ${getMonthName(date.month - 1, SupportedLanguage.pl, context)}";

    DateTime now = DateTime.now();

    var screenWidth = MediaQuery.of(context).size.width;

    double weatherTextShrinkWidth = 450;

    String iso8601DateNoTime = DateFormat("yyyy-MM-dd").format(date);
    int? weatherIndex = dailyForecast?.time.indexOf(iso8601DateNoTime) ?? 0;
    int? weatherCode = dailyForecast?.weatherCode[weatherIndex];
    int? temperature2mMin = dailyForecast?.temperature2mMin[weatherIndex]
        .round();
    int? temperature2mMax = dailyForecast?.temperature2mMax[weatherIndex]
        .round();

    String weather = dailyForecast != null
        ? translation.weather.values[weatherCode] ?? '-'
        : '-';

    String formatedWeatherString = weather;

    if (screenWidth <= weatherTextShrinkWidth) {
      formatedWeatherString =
          "${weather.substring(0, clampDouble(screenWidth / 3 / (weather.length * 0.5), 0, weather.length - 1).toInt())}...";
    }

    String weekName = getWeekName(
      date.weekday - 1,
      SupportedLanguage.pl,
      context,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // date
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 5,
          children: [
            Text(
              date.day == now.day
                  ? translation.today
                  : weekName.substring(0, 1).toUpperCase() +
                        weekName.substring(1),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(formatedDate, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),

        // current weather conditions
        Row(
          spacing: 15,
          children: [
            WeatherIcon(
              icon: weatherCode != null
                  ? getWeatherIcon(weatherCode, false)
                  : WeatherIconsSVG.missingData,
              size: 15,
            ),
            Text(
              weather.length > 10 ? formatedWeatherString : weather,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),

        // temperatures throughout the day
        Row(
          spacing: 10,
          children: [
            CustomText(
              text: "${temperature2mMin ?? '-'}°",
              color: Colors.blueAccent,
              fontSize: 12,
            ),
            screenWidth > 360
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
              text: "${temperature2mMax ?? '-'}°",
              color: Colors.orangeAccent,
              fontSize: 12,
            ),
          ],
        ),
      ],
    );
  }
}
