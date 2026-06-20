import 'package:flutter/material.dart';
import 'package:weather_app/api/air_quality_api.dart';
import 'package:weather_app/api/geo_api.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/hive/geo_result_adapter.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/pages/location_pick_page.dart';
import 'package:weather_app/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(GeoResultAdapter());

  await Hive.openBox<GeoResult>('geoBox');

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  var box = Hive.box<GeoResult>('geoBox');
  late GeoResult? placeData;
  WeatherResponse? weatherData;
  AirQualityResponse? airQualityData;

  @override
  void initState() {
    if (box.isNotEmpty) {
      setState(() {
        placeData = box.get("geo_data");
      });
      getWeatherData();
      getAirQualityData();
    }
    super.initState();
  }

  Future<void> getWeatherData() async {
    if (placeData == null) return;

    WeatherApi api = WeatherApi();
    var response = await api.getWeather(
      placeData!.latitude,
      placeData!.longitude,
    );

    if (response != null) {
      setState(() {
        weatherData = response;
      });
    } else {
      throw Exception("Failed to fetch weather data.");
    }
  }

  Future<void> getAirQualityData() async {
    if (placeData == null) return;

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
    late ThemeMode themeMode;

    switch (isNight(
      DateTime.now().add(Duration(hours: 8)),
      weatherData?.daily,
    )) {
      case true:
        themeMode = ThemeMode.dark;
        break;
      default:
        themeMode = ThemeMode.light;
        break;
    }

    return MaterialApp(
      themeMode: themeMode,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      debugShowCheckedModeBanner: false,
      home: box.isEmpty || weatherData == null
          ? LocationPickPage(changeLocation: changeLocation)
          : HomePage(
              placeData: placeData,
              weatherData: weatherData,
              airQualityData: airQualityData,
              changeLocation: changeLocation,
            ),
    );
  }
}
