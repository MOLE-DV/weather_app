import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weather_app/api/air_quality_api.dart';
import 'package:weather_app/resources/global_resource.dart';
import 'package:weather_app/utils/custom_text.dart';
import 'package:weather_app/utils/translations/translation.dart';

class AirQuality extends StatelessWidget {
  final Current? currentAirQuality;
  const AirQuality({super.key, required this.currentAirQuality});

  @override
  Widget build(BuildContext context) {
    GlobalResource globalResource = GlobalResource.of(context);

    var airQualityColors = {
      "very_good": Colors.blueAccent,
      "good": Colors.lightGreen,
      "fair": Colors.yellow,
      "poor": Colors.orange,
      "very_poor": Colors.deepPurple,
      "hazardous": Colors.red,
    };
    double maxSliderValue = 100;
    Color accentColor = airQualityColors['good']!;
    String airQualityName = "-";

    switch (currentAirQuality?.europeanAqi ?? -1) {
      case >= 0 && <= 33:
        maxSliderValue = 33;
        accentColor = airQualityColors['very_good']!;
        airQualityName =
            globalResource.appTranslation.translations.airQuality.veryGood;
        break;
      case >= 34 && <= 66:
        maxSliderValue = 66;
        accentColor = airQualityColors['good']!;
        airQualityName =
            globalResource.appTranslation.translations.airQuality.good;
        break;
      case >= 67 && <= 99:
        maxSliderValue = 99;
        accentColor = airQualityColors['fair']!;
        airQualityName =
            globalResource.appTranslation.translations.airQuality.fair;
        break;
      case >= 100 && <= 149:
        maxSliderValue = 149;
        accentColor = airQualityColors['poor']!;
        airQualityName =
            globalResource.appTranslation.translations.airQuality.poor;
        break;
      case >= 150 && <= 200:
        maxSliderValue = 200;
        accentColor = airQualityColors['very_poor']!;
        airQualityName =
            globalResource.appTranslation.translations.airQuality.veryPoor;
        break;
      case > 200:
        maxSliderValue = 500;
        accentColor = airQualityColors['hazardous']!;
        airQualityName =
            globalResource.appTranslation.translations.airQuality.hazardous;
        break;
      default:
        maxSliderValue = 0;
        accentColor = Colors.white;
        airQualityName = "-";
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 7,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: accentColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox(height: 12, width: 12),
            ),
            Text(airQualityName, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        SleekCircularSlider(
          initialValue: clampDouble(
            currentAirQuality?.europeanAqi ?? 0,
            0,
            500,
          ),
          max: maxSliderValue,
          appearance: CircularSliderAppearance(
            size: 90,
            startAngle: 270,
            angleRange: 360,
            infoProperties: InfoProperties(
              modifier: (_) {
                return '${currentAirQuality?.europeanAqi ?? '-'}';
              },
              mainLabelStyle: Theme.of(context).textTheme.labelLarge,
            ),
            customWidths: CustomSliderWidths(
              trackWidth: 5,
              progressBarWidth: 5,
            ),
            customColors: CustomSliderColors(
              progressBarColor: accentColor,
              trackColor: Colors.grey[300],
              dotColor: accentColor,
            ),
          ),
        ),
      ],
    );
  }
}
