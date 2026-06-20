import 'package:flutter/material.dart';
import 'package:weather_app/api/air_quality_api.dart';
import 'package:weather_app/api/geo_api.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/icons/weather_icon.dart';
import 'package:weather_app/icons/weather_icons_SVG.dart';
import 'package:weather_app/utils/air_quality.dart';
import 'package:weather_app/utils/appbar_location_indicator.dart';
import 'package:weather_app/utils/current_weather_data.dart';
import 'package:weather_app/utils/custom_background.dart';
import 'package:weather_app/utils/hour_forecast/hour_forecast.dart';
import 'package:weather_app/utils/sunset_and_sunrise_time.dart';
import 'package:weather_app/utils/weather_box/custom_card.dart';
import 'package:weather_app/utils/week_forecast/week_forecast.dart';

class HomePage extends StatelessWidget {
  final GeoResult? placeData;
  final Function changeLocation;
  final WeatherResponse? weatherData;
  final AirQualityResponse? airQualityData;

  const HomePage({
    super.key,
    required this.placeData,
    required this.changeLocation,
    required this.weatherData,
    required this.airQualityData,
  });

  void onImageFinishedLoading() {
    print("finished Loading");
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,

      // weather app bar
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Color.fromARGB(0, 0, 0, 0),
        iconTheme: IconThemeData(color: Colors.white),
        title: AppBarLocationIndicator(
          placeData: placeData,
          changeLocation: changeLocation,
        ),
      ),

      // body
      body: ListView(
        padding: EdgeInsets.only(top: 0, bottom: 20),
        children: [
          CustomBackground(
            onImageFinishedLoading: onImageFinishedLoading,
            child: Padding(
              padding: EdgeInsetsGeometry.only(left: 20, right: 20, top: 80),
              child: Column(
                spacing: 15,
                children: [
                  CurrentWeatherData(
                    currentForecast: weatherData?.current,
                    dailyForecast: weatherData?.daily,
                    currentUnits: weatherData?.currentUnits,
                    dailyUnits: weatherData?.dailyUnits,
                  ),
                  CustomCard(
                    topPanelText: "Prognoza godzinowa",
                    showSeeMoreButton: true,
                    child: HourForecast(
                      hourlyData: weatherData?.hourly,
                      dailyData: weatherData?.daily,
                    ),
                  ),
                  CustomCard(
                    topPanelText: "Prognoza 7-dniowa",
                    showSeeMoreButton: true,
                    child: WeekForecast(dailyForecast: weatherData?.daily),
                  ),

                  // // two inline boxes on the bottom
                  LayoutBuilder(
                    builder: (context, constraints) {
                      double spacing = 8;
                      double maxWidth =
                          (constraints.maxWidth / 2) - (spacing / 2);

                      if (screenWidth < 465) {
                        maxWidth = constraints.maxWidth;
                      }
                      ;

                      return Wrap(
                        spacing: 8,
                        runSpacing: 15,
                        children: [
                          SizedBox(
                            width: maxWidth,
                            child: CustomCard(
                              topPanelText: "Wschód i zachód słońca",
                              showSeeMoreButton: false,
                              panelRightWidget: Transform.scale(
                                scale: 2.5,
                                child: WeatherIcon(
                                  icon: WeatherIconsSVG.day,
                                  size: 10,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: SunriseAndSunsetTime(
                                  dailyWeather: weatherData?.daily,
                                ),
                              ),
                            ),
                          ),

                          // air quality card
                          SizedBox(
                            width: maxWidth,
                            child: CustomCard(
                              topPanelText: "Jakość powietrza",
                              showSeeMoreButton: false,
                              child: AirQuality(
                                currentAirQuality: airQualityData?.current,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
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
