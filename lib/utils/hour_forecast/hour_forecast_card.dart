import 'package:flutter/material.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/icons/weather_icon.dart';
import 'package:weather_app/icons/weather_icons_SVG.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/resources/global_resource.dart';
import 'package:weather_app/utils/month_and_week_names.dart';
import 'package:weather_app/utils/translations/translation.dart';

class HourForecastCard extends StatelessWidget {
  final DateTime date;
  final Hourly? hourlyData;
  final Daily? dailyData;
  const HourForecastCard({
    super.key,
    required this.date,
    required this.hourlyData,
    required this.dailyData,
  });

  @override
  Widget build(BuildContext context) {
    Translation translation = GlobalResource.of(
      context,
    ).appTranslation.translations;
    var now = DateTime.now();
    bool isCurrenHour = now.hour == date.hour;

    // format the date to iso8601 string format and remove unnecessary minutes
    String formatedDateHourly = DateFormat("yyyy-MM-dd'T'HH:00").format(date);

    // get index of date in the database then search for temperature data at this index
    int weatherIndex = hourlyData?.time.indexOf(formatedDateHourly) ?? 0;
    int weatherCode = hourlyData?.weatherCode[weatherIndex] ?? 0;

    String hourText = isCurrenHour
        ? translation.now
        : "${(date.hour) < 10 ? "0" : ""}${(date.hour).toString()}:00";

    String tempText =
        '${hourlyData?.temperature2m[weatherIndex].round() ?? '-'}°';

    TextStyle? textStyle = isCurrenHour
        ? Theme.of(context).textTheme.labelMedium
        : Theme.of(context).textTheme.bodyMedium;

    return Column(
      spacing: 10,
      children: [
        Column(
          children: [
            Text(hourText, style: textStyle, textAlign: TextAlign.center),
            Text(
              now.day != date.day
                  ? getWeekName(date.weekday - 1, SupportedLanguage.pl, context)
                  : '',
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        WeatherIcon(
          icon: hourlyData != null
              ? getWeatherIcon(weatherCode, isNight(date, dailyData))
              : WeatherIconsSVG.missingData,
          size: 28,
        ),
        Text(tempText, style: textStyle),
      ],
    );
  }
}
