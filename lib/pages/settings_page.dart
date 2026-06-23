import 'package:flutter/material.dart';
import 'package:weather_app/hive/app_settings_adapter.dart';
import 'package:weather_app/hive/temperature_unit_adapter.dart';
import 'package:weather_app/hive/wind_speed_unit_adapter.dart';
import 'package:weather_app/resources/global_resource.dart';
import 'package:weather_app/themes/app_theme.dart';
import 'package:weather_app/utils/settings_dropdown.dart';
import 'package:weather_app/utils/translations/translation.dart';
import 'package:weather_app/utils/translations/app_translation.dart';
import 'package:weather_app/utils/weather_box/custom_card.dart';

const List<List<String>> temperatureUnits = [
  ['°C', 'celsius'],
  ['°F', 'fahrenheit'],
];

const List<List<String>> windSpeedUnits = [
  ['km/h', 'kmh'],
  ['mp/h', 'mph'],
  ['m/s', 'ms'],
  ['knots', 'kn'],
];

const List<List<String>> languages = [
  ['Polski', 'pl'],
  ['English', 'en'],
];

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late GlobalResource globalResource;
  late AppSettings updatedAppSettings;
  late AppTranslation translation;

  void changeTemperatureUnit(String? unitString) {
    if (unitString == null) return;

    TemperatureUnit unit = TemperatureUnit.values.firstWhere(
      (TemperatureUnit unit) => unit.name == unitString,
    );

    setState(() {
      updatedAppSettings.temperatureUnit = unit;
    });
  }

  void changeWindSpeedUnit(String? unitString) {
    if (unitString == null) return;

    WindSpeedUnit unit = WindSpeedUnit.values.firstWhere(
      (WindSpeedUnit unit) => unit.name == unitString,
    );

    setState(() {
      updatedAppSettings.windSpeedUnit = unit;
    });
  }

  void changeLanguage(String? langString) {
    if (langString == null) return;

    SupportedLanguage lang = SupportedLanguage.values.firstWhere(
      (SupportedLanguage lang) => lang.name == langString,
    );

    setState(() {
      updatedAppSettings.language = lang;
    });
  }

  void saveButtonHanlder() {
    globalResource.changeSettings(updatedAppSettings);
    globalResource.changeTranslation(
      AppTranslation(language: updatedAppSettings.language),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          translation.translations.saved,
          style: AppTheme.dark.textTheme.bodyLarge,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    globalResource = GlobalResource.of(context);
    translation = globalResource.appTranslation;
    updatedAppSettings = globalResource.appSettings;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          translation.translations.settings.settings,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        iconTheme: IconThemeData(color: Theme.of(context).iconTheme.color),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                CustomCard(
                  topPanelText: translation.translations.settings.units,
                  showSeeMoreButton: false,
                  child: Column(
                    children: [
                      SettingsDropdown(
                        list: temperatureUnits,
                        value: updatedAppSettings.temperatureUnit.name,
                        onChanged: changeTemperatureUnit,
                        text: translation.translations.settings.temperature,
                      ),
                      SettingsDropdown(
                        list: windSpeedUnits,
                        value: updatedAppSettings.windSpeedUnit.name,
                        onChanged: changeWindSpeedUnit,
                        text: translation.translations.settings.windSpeed,
                      ),
                    ],
                  ),
                ),
                CustomCard(
                  topPanelText: translation.translations.settings.interface,
                  showSeeMoreButton: false,
                  child: Column(
                    children: [
                      SettingsDropdown(
                        list: languages,
                        value: updatedAppSettings.language.name,
                        onChanged: changeLanguage,
                        text: translation.translations.settings.language,
                      ),
                      ElevatedButton(
                        onPressed: saveButtonHanlder,
                        child: Text(
                          translation.translations.save,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
