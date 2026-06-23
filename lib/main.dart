import 'package:flutter/material.dart';
import 'package:weather_app/api/air_quality_api.dart';
import 'package:weather_app/api/geo_api.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/hive/app_settings_adapter.dart';
import 'package:weather_app/hive/geo_result_adapter.dart';
import 'package:weather_app/hive/temperature_unit_adapter.dart';
import 'package:weather_app/hive/wind_speed_unit_adapter.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/pages/location_pick_page.dart';
import 'package:weather_app/resources/global_resource.dart';
import 'package:weather_app/themes/app_theme.dart';
import 'package:weather_app/utils/loading_screen.dart';
import 'package:weather_app/utils/translations/app_translation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(GeoResultAdapter());
  Hive.registerAdapter(TemperatureUnitAdapter());
  Hive.registerAdapter(WindSpeedUnitAdapter());
  Hive.registerAdapter(AppSettingsAdapter());

  await Hive.openBox('appBox');

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  var box = Hive.box('appBox');

  GeoResult? placeData;
  WeatherResponse? weatherData;
  AirQualityResponse? airQualityData;
  AppSettings? appSettings;
  AppTranslation? appTranslation;
  ThemeMode themeMode = ThemeMode.system;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    print("Loading...");
    // showDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   builder: (BuildContext context) {
    //     return Dialog(
    //       child: Row(
    //         mainAxisSize: MainAxisSize.min,
    //         children: [CircularProgressIndicator(), Text("Loading")],
    //       ),
    //     );
    //   },
    // );
    GeoResult? storedPlaceData = await box.get("geo_data");
    AppSettings? storedAppSettings = await box.get('app_settings');
    WeatherResponse? fetchedWeatherData;
    AirQualityResponse? fetchedAirQualityData;

    if (storedAppSettings == null) {
      storedAppSettings = AppSettings();

      await box.put('app_settings', appSettings);
    }

    if (storedPlaceData != null) {
      // get weather data if place data is not null
      try {
        print("Loading weather data...");
        WeatherApi api = WeatherApi();
        var response = await api.getWeather(
          storedPlaceData.latitude,
          storedPlaceData.longitude,
          storedAppSettings.temperatureUnit,
          storedAppSettings.windSpeedUnit,
        );

        if (response != null) {
          fetchedWeatherData = response;
        } else {
          throw Exception("Failed to fetch weather data.");
        }
      } catch (e) {
        print('Weather api error: $e');
      }
      print("Finished loading weather data...");

      // get air quality data if place data is not null
      print("Loading air quality data...");
      try {
        AirQualityApi api = AirQualityApi();
        var response = await api.getAirQuality(
          storedPlaceData.latitude,
          storedPlaceData.longitude,
        );

        if (response != null) {
          fetchedAirQualityData = response;
        } else {
          throw Exception("Failed to fetch air quality data.");
        }
      } catch (e) {
        print('Air quality api error: $e');
      }
      print("Finished loading air quality data...");
    }

    setState(() {
      if (fetchedWeatherData != null) {
        themeMode = isNight(DateTime.now(), fetchedWeatherData.daily)
            ? ThemeMode.dark
            : ThemeMode.light;
      }

      placeData = storedPlaceData;
      appSettings = storedAppSettings!;
      appTranslation = AppTranslation(language: storedAppSettings.language);
      weatherData = fetchedWeatherData;
      airQualityData = fetchedAirQualityData;
      loading = false;
    });
    print("Finished loading");
  }

  Future<void> changeSettings(AppSettings updatedAppSettings) async {
    print("changing settings");
    await box.put('app_settings', updatedAppSettings);
    setState(() {
      appSettings = updatedAppSettings;
    });
    getWeatherData();
  }

  void changeTranslation(AppTranslation Translation) {
    setState(() {
      appTranslation = Translation;
    });
  }

  Future<void> getWeatherData() async {
    if (placeData == null) return;

    try {
      WeatherApi api = WeatherApi();
      var response = await api.getWeather(
        placeData!.latitude,
        placeData!.longitude,
        appSettings?.temperatureUnit ?? TemperatureUnit.celsius,
        appSettings?.windSpeedUnit ?? WindSpeedUnit.kmh,
      );

      if (response != null) {
        setState(() {
          weatherData = response;
          themeMode = isNight(DateTime.now(), response.daily)
              ? ThemeMode.dark
              : ThemeMode.light;
        });
      } else {
        throw Exception("Failed to fetch weather data.");
      }
    } catch (e) {
      print('Weather api error: $e');
    }
  }

  Future<void> getAirQualityData() async {
    if (placeData == null) return;

    try {
      AirQualityApi api = AirQualityApi();
      var response = await api.getAirQuality(
        placeData!.latitude,
        placeData!.longitude,
      );

      if (response != null) {
        setState(() {
          airQualityData = response;
        });
      } else {
        throw Exception("Failed to fetch air quality data.");
      }
    } catch (e) {
      print('Air quality api error: $e');
    }
  }

  Future<void> changeLocation(GeoResult result) async {
    await box.put("geo_data", result);

    setState(() {
      placeData = result;
    });

    await getWeatherData();
    await getAirQualityData();
  }

  @override
  Widget build(BuildContext context) {
    return GlobalResource(
      appSettings: appSettings ?? AppSettings(),
      appTranslation: appTranslation ?? AppTranslation(),
      changeSettings: changeSettings,
      changeTranslation: changeTranslation,
      child: MaterialApp(
        themeMode: themeMode,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        debugShowCheckedModeBanner: false,
        home: loading
            ? LoadingScreen()
            : placeData != null
            ? HomePage(
                placeData: placeData,
                changeLocation: changeLocation,
                weatherData: weatherData,
                airQualityData: airQualityData,
              )
            : LocationPickPage(changeLocation: changeLocation),
      ),
    );
  }
}
