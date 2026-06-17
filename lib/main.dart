import 'package:flutter/material.dart';
import 'package:weather_app/api/geo_api.dart';
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
  final box = Hive.box<GeoResult>('geoBox');
  GeoResult? placeData;

  Future<void> changeLocation(GeoResult result) async {
    await box.add(result);

    setState(() {
      placeData = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      debugShowCheckedModeBanner: false,
      home: box.isEmpty
          ? LocationPickPage(onPick: changeLocation)
          : HomePage(placeData: placeData, changeLocation: changeLocation),
    );
  }
}
