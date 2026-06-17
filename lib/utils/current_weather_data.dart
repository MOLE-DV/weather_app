import 'package:flutter/material.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/icons/weather_icon.dart';
import 'package:weather_app/icons/weather_icons_SVG.dart';
import 'package:weather_app/utils/custom_text.dart';
import 'package:weather_app/utils/translations.dart';
import 'package:weather_app/utils/weather_stats_bar.dart';

class CurrentWeatherData extends StatelessWidget {
  final Current? currentForecast;
  final Daily? dailyForecast;
  final CurrentUnits? currentUnits;
  final DailyUnits? dailyUnits;

  const CurrentWeatherData({
    super.key,
    required this.currentForecast,
    required this.dailyForecast,
    required this.currentUnits,
    required this.dailyUnits,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            CustomText(
              text: '${currentForecast?.temperature2m.round() ?? "-"}',
              fontSize: 90,
            ),
            Transform.translate(
              offset: Offset(0, -32),
              child: CustomText(text: '°', fontSize: 50),
            ),
            Transform.translate(
              offset: Offset(20, 50),
              child: WeatherIcon(
                icon: currentForecast != null
                    ? getWeatherIcon(currentForecast!.weatherCode)
                    : WeatherIconsSVG.missingData,
                size: 60,
              ),
            ),
          ],
        ),
        CustomText(
          text: currentForecast != null
              ? translations[SupportedLanguage.pl]!['weather'][currentForecast!
                    .weatherCode]
              : '-',
          fontWeight: FontWeight(400),
          fontSize: 20,
        ),
        CustomText(
          text:
              'Odczuwalna ${currentForecast?.apparentTemperature.round() ?? '-'}°',
          fontSize: 15,
          fontWeight: FontWeight(200),
        ),
        WeatherStatsBar(
          currentForecast: currentForecast,
          dailyForecast: dailyForecast,
        ),
      ],
    );
  }
}
