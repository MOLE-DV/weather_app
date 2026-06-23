import 'package:flutter/material.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/icons/weather_icon.dart';
import 'package:weather_app/icons/weather_icons_SVG.dart';
import 'package:weather_app/resources/global_resource.dart';
import 'package:weather_app/utils/custom_text.dart';
import 'package:weather_app/utils/translations/translation.dart';
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
    Translation translation = GlobalResource.of(
      context,
    ).appTranslation.translations;

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
                    ? getWeatherIcon(
                        currentForecast!.weatherCode,
                        Theme.of(context).brightness == Brightness.dark,
                      )
                    : WeatherIconsSVG.missingData,
                size: 60,
              ),
            ),
          ],
        ),
        CustomText(
          text: currentForecast != null
              ? GlobalResource.of(context)
                    .appTranslation
                    .translations
                    .weather
                    .values[currentForecast!.weatherCode]!
              : '-',
          fontWeight: FontWeight(400),
          fontSize: 20,
        ),
        CustomText(
          text:
              '${translation.feelsLike} ${currentForecast?.apparentTemperature.round() ?? '-'}°',
          fontSize: 15,
          fontWeight: FontWeight(200),
        ),
        WeatherStatsBar(
          currentForecast: currentForecast,
          dailyForecast: dailyForecast,
          currentUnits: currentUnits,
        ),
      ],
    );
  }
}
