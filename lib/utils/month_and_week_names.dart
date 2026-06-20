import 'package:weather_app/utils/translations.dart';

String getMonthName(int month, SupportedLanguage lang) {
  if (month < 0 || month > 12) {
    return "Error: Invalid month index provided";
  }
  return translations[lang]!["month"]![month];
}

String getWeekName(int day, SupportedLanguage lang) {
  if (day < 0 || day > 6) {
    return "Error: Invalid week index provided";
  }
  return translations[lang]!["week"]![day];
}
