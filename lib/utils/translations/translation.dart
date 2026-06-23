import 'package:weather_app/utils/translations/air_quality_translations.dart';
import 'package:weather_app/utils/translations/settings_translations.dart';
import 'package:weather_app/utils/translations/weather_translations.dart';

enum SupportedLanguage { pl, en }

class Translation {
  final String selectLocation;
  final String enterYourLocation;
  final String enterYourLocationDescription;

  final String feelsLike;
  final String wind;
  final String humidity;
  final String pressure;

  final String hourForecastLabel;
  final String sevenDayForecastLabel;
  final String sunriseAndSunsetLabel;
  final String airQualityLabel;

  final String seeMore;

  final String today;
  final String now;

  final List<String> month;
  final List<String> week;

  final WeatherTranslations weather;
  final AirQualityTranslations airQuality;
  final SettingsTranslations settings;

  final String save;
  final String close;
  final String search;

  final String ex;
  
  final String saved; 

  const Translation({
    required this.selectLocation,
    required this.enterYourLocation,
    required this.enterYourLocationDescription,
    required this.feelsLike,
    required this.wind,
    required this.humidity,
    required this.pressure,
    required this.hourForecastLabel,
    required this.sevenDayForecastLabel,
    required this.sunriseAndSunsetLabel,
    required this.airQualityLabel,
    required this.seeMore,
    required this.today,
    required this.now,
    required this.month,
    required this.week,
    required this.weather,
    required this.airQuality,
    required this.settings,
    required this.save,
    required this.close,
    required this.search,
    required this.ex,
    required this.saved
  });
}
