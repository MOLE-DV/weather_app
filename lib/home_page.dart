import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/utils/current_weather_data.dart';
import 'package:weather_app/utils/custom_background.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/utils/hour_forecast/hour_forecast.dart';
import 'package:weather_app/utils/weather_box/custom_card.dart';
import 'package:weather_app/utils/week_forecast/week_forecast.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Color.fromARGB(0, 0, 0, 0),
        iconTheme: IconThemeData(color: Colors.white),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 8,
              children: [
                Icon(Icons.location_pin, size: 18),
                Text("Warszawa", style: GoogleFonts.inter(color: Colors.white)),
              ],
            ),
            Text(
              "woj. mazowieckie",
              style: GoogleFonts.inter(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () => print("sda"),
            icon: Icon(Icons.notifications_outlined),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 0),
        children: [
          CustomBackground(
            child: Padding(
              padding: EdgeInsetsGeometry.only(left: 20, right: 20, top: 80),
              child: Column(
                spacing: 15,
                children: [
                  CurrentWeatherData(),
                  CustomCard(
                    topPanelText: "Prognoza godzinowa",
                    showSeeMoreButton: true,
                    child: HourForecast(),
                  ),
                  CustomCard(
                    topPanelText: "Prognoza 7-dniowa",
                    showSeeMoreButton: true,
                    child: WeekForecast(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
