import 'package:flutter/material.dart';
import 'package:weather_app/resources/global_resource.dart';
import 'package:weather_app/utils/translations/translation.dart';

String getMonthName(int month, SupportedLanguage lang, BuildContext context) {
  if (month < 0 || month > 12) {
    return "Error: Invalid month index provided";
  }
  return GlobalResource.of(context).appTranslation.translations.month[month];
}

String getWeekName(int day, SupportedLanguage lang, BuildContext context) {
  if (day < 0 || day > 6) {
    return "Error: Invalid week index provided";
  }
  return GlobalResource.of(context).appTranslation.translations.week[day];
}
