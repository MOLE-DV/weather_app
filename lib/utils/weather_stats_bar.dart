import 'package:flutter/material.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/resources/global_resource.dart';
import 'package:weather_app/utils/translations/translation.dart';
import 'package:weather_app/utils/weather_stat.dart';

class WeatherStatsBar extends StatelessWidget {
  final Current? currentForecast;
  final Daily? dailyForecast;
  final CurrentUnits? currentUnits;

  const WeatherStatsBar({
    super.key,
    required this.currentForecast,
    required this.dailyForecast,
    required this.currentUnits,
  });

  @override
  Widget build(BuildContext context) {
    Translation translation = GlobalResource.of(
      context,
    ).appTranslation.translations;
    return Container(
      margin: EdgeInsets.only(top: 20, left: 15, right: 15),
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.spaceBetween,
        children: [
          WeatherStat(
            label: translation.wind,
            value:
                '${currentForecast?.windSpeed10m.round() ?? "-"} ${currentUnits?.windSpeed10m}',
            icon: Icons.wind_power_outlined,
          ),
          WeatherStat(
            label: translation.humidity,
            value: '${currentForecast?.relativeHumidity2m ?? '-'}%',
            icon: Icons.water_drop_outlined,
          ),
          WeatherStat(
            label: "UV",
            value: '${dailyForecast?.uvIndexMax[0].round() ?? '-'}',
            icon: Icons.wb_sunny_outlined,
          ),
          WeatherStat(
            label: translation.pressure,
            value: '${currentForecast?.surfacePressure.round() ?? '-'} hPa',
            icon: Icons.speed_outlined,
          ),
        ],
      ),
    );
  }
}
