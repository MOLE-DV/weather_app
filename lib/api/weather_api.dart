import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:weather_app/icons/weather_icons_SVG.dart';
import 'dart:convert';

import 'package:weather_app/utils/translations.dart';

var exampleResponse = {
  "latitude": 51.72,
  "longitude": 18.619999,
  "generationtime_ms": 0.47528743743896484,
  "utc_offset_seconds": 7200,
  "timezone": "Europe/Warsaw",
  "timezone_abbreviation": "GMT+2",
  "elevation": 131,
  "current_units": {
    "time": "iso8601",
    "interval": "seconds",
    "temperature_2m": "°C",
    "relative_humidity_2m": "%",
    "apparent_temperature": "°C",
    "weather_code": "wmo code",
    "surface_pressure": "hPa",
    "wind_speed_10m": "km/h",
  },
  "current": {
    "time": "2026-06-14T11:15",
    "interval": 900,
    "temperature_2m": 14.5,
    "relative_humidity_2m": 69,
    "apparent_temperature": 11,
    "weather_code": 80,
    "surface_pressure": 992.6,
    "wind_speed_10m": 22,
  },
  "hourly_units": {
    "time": "iso8601",
    "temperature_2m": "°C",
    "weather_code": "wmo code",
  },
  "hourly": {
    "time": [
      "2026-06-14T00:00",
      "2026-06-14T01:00",
      "2026-06-14T02:00",
      "2026-06-14T03:00",
      "2026-06-14T04:00",
      "2026-06-14T05:00",
      "2026-06-14T06:00",
      "2026-06-14T07:00",
      "2026-06-14T08:00",
      "2026-06-14T09:00",
      "2026-06-14T10:00",
      "2026-06-14T11:00",
      "2026-06-14T12:00",
      "2026-06-14T13:00",
      "2026-06-14T14:00",
      "2026-06-14T15:00",
      "2026-06-14T16:00",
      "2026-06-14T17:00",
      "2026-06-14T18:00",
      "2026-06-14T19:00",
      "2026-06-14T20:00",
      "2026-06-14T21:00",
      "2026-06-14T22:00",
      "2026-06-14T23:00",
      "2026-06-15T00:00",
      "2026-06-15T01:00",
      "2026-06-15T02:00",
      "2026-06-15T03:00",
      "2026-06-15T04:00",
      "2026-06-15T05:00",
      "2026-06-15T06:00",
      "2026-06-15T07:00",
      "2026-06-15T08:00",
      "2026-06-15T09:00",
      "2026-06-15T10:00",
      "2026-06-15T11:00",
      "2026-06-15T12:00",
      "2026-06-15T13:00",
      "2026-06-15T14:00",
      "2026-06-15T15:00",
      "2026-06-15T16:00",
      "2026-06-15T17:00",
      "2026-06-15T18:00",
      "2026-06-15T19:00",
      "2026-06-15T20:00",
      "2026-06-15T21:00",
      "2026-06-15T22:00",
      "2026-06-15T23:00",
      "2026-06-16T00:00",
      "2026-06-16T01:00",
      "2026-06-16T02:00",
      "2026-06-16T03:00",
      "2026-06-16T04:00",
      "2026-06-16T05:00",
      "2026-06-16T06:00",
      "2026-06-16T07:00",
      "2026-06-16T08:00",
      "2026-06-16T09:00",
      "2026-06-16T10:00",
      "2026-06-16T11:00",
      "2026-06-16T12:00",
      "2026-06-16T13:00",
      "2026-06-16T14:00",
      "2026-06-16T15:00",
      "2026-06-16T16:00",
      "2026-06-16T17:00",
      "2026-06-16T18:00",
      "2026-06-16T19:00",
      "2026-06-16T20:00",
      "2026-06-16T21:00",
      "2026-06-16T22:00",
      "2026-06-16T23:00",
      "2026-06-17T00:00",
      "2026-06-17T01:00",
      "2026-06-17T02:00",
      "2026-06-17T03:00",
      "2026-06-17T04:00",
      "2026-06-17T05:00",
      "2026-06-17T06:00",
      "2026-06-17T07:00",
      "2026-06-17T08:00",
      "2026-06-17T09:00",
      "2026-06-17T10:00",
      "2026-06-17T11:00",
      "2026-06-17T12:00",
      "2026-06-17T13:00",
      "2026-06-17T14:00",
      "2026-06-17T15:00",
      "2026-06-17T16:00",
      "2026-06-17T17:00",
      "2026-06-17T18:00",
      "2026-06-17T19:00",
      "2026-06-17T20:00",
      "2026-06-17T21:00",
      "2026-06-17T22:00",
      "2026-06-17T23:00",
      "2026-06-18T00:00",
      "2026-06-18T01:00",
      "2026-06-18T02:00",
      "2026-06-18T03:00",
      "2026-06-18T04:00",
      "2026-06-18T05:00",
      "2026-06-18T06:00",
      "2026-06-18T07:00",
      "2026-06-18T08:00",
      "2026-06-18T09:00",
      "2026-06-18T10:00",
      "2026-06-18T11:00",
      "2026-06-18T12:00",
      "2026-06-18T13:00",
      "2026-06-18T14:00",
      "2026-06-18T15:00",
      "2026-06-18T16:00",
      "2026-06-18T17:00",
      "2026-06-18T18:00",
      "2026-06-18T19:00",
      "2026-06-18T20:00",
      "2026-06-18T21:00",
      "2026-06-18T22:00",
      "2026-06-18T23:00",
      "2026-06-19T00:00",
      "2026-06-19T01:00",
      "2026-06-19T02:00",
      "2026-06-19T03:00",
      "2026-06-19T04:00",
      "2026-06-19T05:00",
      "2026-06-19T06:00",
      "2026-06-19T07:00",
      "2026-06-19T08:00",
      "2026-06-19T09:00",
      "2026-06-19T10:00",
      "2026-06-19T11:00",
      "2026-06-19T12:00",
      "2026-06-19T13:00",
      "2026-06-19T14:00",
      "2026-06-19T15:00",
      "2026-06-19T16:00",
      "2026-06-19T17:00",
      "2026-06-19T18:00",
      "2026-06-19T19:00",
      "2026-06-19T20:00",
      "2026-06-19T21:00",
      "2026-06-19T22:00",
      "2026-06-19T23:00",
      "2026-06-20T00:00",
      "2026-06-20T01:00",
      "2026-06-20T02:00",
      "2026-06-20T03:00",
      "2026-06-20T04:00",
      "2026-06-20T05:00",
      "2026-06-20T06:00",
      "2026-06-20T07:00",
      "2026-06-20T08:00",
      "2026-06-20T09:00",
      "2026-06-20T10:00",
      "2026-06-20T11:00",
      "2026-06-20T12:00",
      "2026-06-20T13:00",
      "2026-06-20T14:00",
      "2026-06-20T15:00",
      "2026-06-20T16:00",
      "2026-06-20T17:00",
      "2026-06-20T18:00",
      "2026-06-20T19:00",
      "2026-06-20T20:00",
      "2026-06-20T21:00",
      "2026-06-20T22:00",
      "2026-06-20T23:00",
    ],
    "temperature_2m": [
      12.8,
      12.3,
      11.8,
      11.3,
      11.3,
      11,
      11.2,
      11.9,
      12.4,
      13,
      13.7,
      14.5,
      14.3,
      14.9,
      15,
      15.1,
      15.6,
      15.4,
      14.9,
      14.2,
      13.3,
      12.7,
      12.2,
      12,
      12.1,
      12,
      11.9,
      11.9,
      12,
      11.6,
      11.7,
      11.9,
      12.5,
      13,
      13.6,
      15,
      16.2,
      16.6,
      17.6,
      18.4,
      18.5,
      18.2,
      18,
      17.3,
      16.5,
      15.2,
      14.3,
      14,
      13.3,
      12.9,
      12.5,
      12.3,
      12,
      11.5,
      11.6,
      12,
      12.7,
      13.9,
      15,
      16,
      16.6,
      17.8,
      18.7,
      18.7,
      19,
      19.5,
      19.5,
      18.8,
      17.3,
      15.6,
      14.9,
      14.6,
      13.9,
      13.5,
      13.1,
      12.4,
      12,
      11.5,
      12.3,
      14.2,
      16,
      17.2,
      18.2,
      18.9,
      19.2,
      19.2,
      19.4,
      20.2,
      21.2,
      21.7,
      21.3,
      20.4,
      19.6,
      18.9,
      18.3,
      17.7,
      17.1,
      16.5,
      16,
      15.5,
      15.1,
      15.1,
      15.6,
      16.5,
      17.6,
      18.8,
      20.2,
      21.5,
      22.6,
      23.7,
      24.5,
      25.2,
      25.7,
      25.9,
      25.6,
      24.9,
      24,
      22.7,
      21.1,
      19.9,
      19.4,
      19.2,
      19,
      18.6,
      18.1,
      18.1,
      19,
      20.6,
      22.1,
      23.6,
      25.1,
      26.3,
      27.2,
      27.9,
      28.5,
      28.9,
      29.2,
      29.1,
      28.7,
      27.9,
      26.9,
      25.6,
      24.1,
      22.7,
      21.7,
      20.8,
      20.1,
      19.6,
      19.2,
      19.4,
      20.3,
      21.8,
      23.4,
      25.3,
      27.4,
      29.1,
      30,
      30.4,
      30.6,
      30.7,
      30.5,
      30,
      29.2,
      28,
      26.9,
      25.7,
      24.5,
      23.6,
    ],
    "weather_code": [
      2,
      1,
      2,
      2,
      80,
      2,
      2,
      2,
      3,
      80,
      3,
      2,
      80,
      3,
      3,
      3,
      80,
      2,
      3,
      80,
      80,
      80,
      80,
      2,
      3,
      3,
      3,
      3,
      3,
      2,
      3,
      3,
      3,
      3,
      3,
      3,
      3,
      3,
      3,
      2,
      3,
      3,
      3,
      3,
      3,
      3,
      3,
      2,
      2,
      3,
      2,
      2,
      2,
      1,
      2,
      2,
      2,
      2,
      2,
      2,
      2,
      2,
      3,
      3,
      2,
      2,
      3,
      2,
      3,
      3,
      3,
      2,
      3,
      3,
      2,
      2,
      2,
      2,
      3,
      2,
      3,
      3,
      3,
      3,
      3,
      3,
      3,
      2,
      2,
      2,
      1,
      1,
      1,
      3,
      3,
      3,
      2,
      2,
      2,
      3,
      3,
      3,
      2,
      2,
      2,
      2,
      2,
      2,
      3,
      3,
      3,
      2,
      2,
      2,
      2,
      2,
      2,
      2,
      2,
      2,
      3,
      3,
      3,
      3,
      3,
      3,
      3,
      3,
      3,
      1,
      1,
      1,
      3,
      3,
      3,
      2,
      2,
      2,
      3,
      3,
      3,
      3,
      3,
      3,
      3,
      3,
      3,
      3,
      3,
      3,
      0,
      0,
      0,
      1,
      1,
      1,
      3,
      3,
      3,
      1,
      1,
      1,
      3,
      3,
      3,
      1,
      1,
      1,
    ],
  },
  "daily_units": {
    "time": "iso8601",
    "weather_code": "wmo code",
    "temperature_2m_max": "°C",
    "temperature_2m_min": "°C",
    "sunrise": "iso8601",
    "sunset": "iso8601",
    "uv_index_max": "",
  },
  "daily": {
    "time": [
      "2026-06-14",
      "2026-06-15",
      "2026-06-16",
      "2026-06-17",
      "2026-06-18",
      "2026-06-19",
      "2026-06-20",
    ],
    "weather_code": [80, 3, 3, 3, 3, 3, 3],
    "temperature_2m_max": [15.6, 18.5, 19.5, 21.7, 25.9, 29.2, 30.7],
    "temperature_2m_min": [11, 11.6, 11.5, 11.5, 15.1, 18.1, 19.2],
    "sunrise": [
      "2026-06-14T04:26",
      "2026-06-15T04:26",
      "2026-06-16T04:26",
      "2026-06-17T04:26",
      "2026-06-18T04:26",
      "2026-06-19T04:26",
      "2026-06-20T04:26",
    ],
    "sunset": [
      "2026-06-14T21:04",
      "2026-06-15T21:05",
      "2026-06-16T21:05",
      "2026-06-17T21:06",
      "2026-06-18T21:06",
      "2026-06-19T21:07",
      "2026-06-20T21:07",
    ],
    "uv_index_max": [6.35, 4.5, 6.75, 6.8, 6.9, 6.85, 6.9],
  },
};

class WeatherApi {
  Future<WeatherResponse?> getWeather(double latitude, double longitude) async {
    final response = await http.get(
      Uri.parse(
        "https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&daily=weather_code,temperature_2m_max,temperature_2m_min,sunrise,sunset,uv_index_max&hourly=temperature_2m,weather_code&current=temperature_2m,relative_humidity_2m,apparent_temperature,weather_code,surface_pressure,wind_speed_10m&timezone=auto",
      ),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return WeatherResponse.fromJson(data);
    } else {
      return null;
    }
  }
}

class WeatherResponse {
  final double latitude;
  final double longitude;
  final double generationtimeMs;
  final int utcOffsetSeconds;
  final String timezone;
  final String timezoneAbbreviation;
  final double elevation;
  final CurrentUnits currentUnits;
  final Current current;
  final HourlyUnits hourlyUnits;
  final Hourly hourly;
  final DailyUnits dailyUnits;
  final Daily daily;

  WeatherResponse({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.currentUnits,
    required this.current,
    required this.hourlyUnits,
    required this.hourly,
    required this.dailyUnits,
    required this.daily,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    return WeatherResponse(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      generationtimeMs: (json['generationtime_ms'] as num).toDouble(),
      utcOffsetSeconds: json['utc_offset_seconds'],
      timezone: json['timezone'],
      timezoneAbbreviation: json['timezone_abbreviation'],
      elevation: (json['elevation'] as num).toDouble(),
      currentUnits: CurrentUnits.fromJson(json['current_units']),
      current: Current.fromJson(json['current']),
      hourlyUnits: HourlyUnits.fromJson(json['hourly_units']),
      hourly: Hourly.fromJson(json['hourly']),
      dailyUnits: DailyUnits.fromJson(json['daily_units']),
      daily: Daily.fromJson(json['daily']),
    );
  }
}

class CurrentUnits {
  final String time;
  final String interval;
  final String temperature2m;
  final String relativeHumidity2m;
  final String apparentTemperature;
  final String weatherCode;
  final String surfacePressure;
  final String windSpeed10m;

  CurrentUnits({
    required this.time,
    required this.interval,
    required this.temperature2m,
    required this.relativeHumidity2m,
    required this.apparentTemperature,
    required this.weatherCode,
    required this.surfacePressure,
    required this.windSpeed10m,
  });

  factory CurrentUnits.fromJson(Map<String, dynamic> json) {
    return CurrentUnits(
      time: json['time'],
      interval: json['interval'],
      temperature2m: json['temperature_2m'],
      relativeHumidity2m: json['relative_humidity_2m'],
      apparentTemperature: json['apparent_temperature'],
      weatherCode: json['weather_code'],
      surfacePressure: json['surface_pressure'],
      windSpeed10m: json['wind_speed_10m'],
    );
  }
}

class Current {
  final String time;
  final int interval;
  final double temperature2m;
  final int relativeHumidity2m;
  final double apparentTemperature;
  final int weatherCode;
  final double surfacePressure;
  final double windSpeed10m;

  Current({
    required this.time,
    required this.interval,
    required this.temperature2m,
    required this.relativeHumidity2m,
    required this.apparentTemperature,
    required this.weatherCode,
    required this.surfacePressure,
    required this.windSpeed10m,
  });

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      time: json['time'],
      interval: json['interval'],
      temperature2m: (json['temperature_2m'] as num).toDouble(),
      relativeHumidity2m: json['relative_humidity_2m'],
      apparentTemperature: (json['apparent_temperature'] as num).toDouble(),
      weatherCode: json['weather_code'],
      surfacePressure: (json['surface_pressure'] as num).toDouble(),
      windSpeed10m: (json['wind_speed_10m'] as num).toDouble(),
    );
  }
}

class HourlyUnits {
  final String time;
  final String temperature2m;
  final String weatherCode;

  HourlyUnits({
    required this.time,
    required this.temperature2m,
    required this.weatherCode,
  });

  factory HourlyUnits.fromJson(Map<String, dynamic> json) {
    return HourlyUnits(
      time: json['time'],
      temperature2m: json['temperature_2m'],
      weatherCode: json['weather_code'],
    );
  }
}

class Hourly {
  final List<String> time;
  final List<double> temperature2m;
  final List<int> weatherCode;

  Hourly({
    required this.time,
    required this.temperature2m,
    required this.weatherCode,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) {
    return Hourly(
      time: List<String>.from(json['time']),
      temperature2m: (json['temperature_2m'] as List)
          .map((e) => (e as num).toDouble())
          .toList(),
      weatherCode: List<int>.from(json['weather_code']),
    );
  }
}

class DailyUnits {
  final String time;
  final String weatherCode;
  final String temperature2mMax;
  final String temperature2mMin;
  final String sunrise;
  final String sunset;
  final String uvIndexMax;

  DailyUnits({
    required this.time,
    required this.weatherCode,
    required this.temperature2mMax,
    required this.temperature2mMin,
    required this.sunrise,
    required this.sunset,
    required this.uvIndexMax,
  });

  factory DailyUnits.fromJson(Map<String, dynamic> json) {
    return DailyUnits(
      time: json['time'],
      weatherCode: json['weather_code'],
      temperature2mMax: json['temperature_2m_max'],
      temperature2mMin: json['temperature_2m_min'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      uvIndexMax: json['uv_index_max'],
    );
  }
}

class Daily {
  final List<String> time;
  final List<int> weatherCode;
  final List<double> temperature2mMax;
  final List<double> temperature2mMin;
  final List<String> sunrise;
  final List<String> sunset;
  final List<double> uvIndexMax;

  Daily({
    required this.time,
    required this.weatherCode,
    required this.temperature2mMax,
    required this.temperature2mMin,
    required this.sunrise,
    required this.sunset,
    required this.uvIndexMax,
  });

  factory Daily.fromJson(Map<String, dynamic> json) {
    return Daily(
      time: List<String>.from(json['time']),
      weatherCode: List<int>.from(json['weather_code']),
      temperature2mMax: (json['temperature_2m_max'] as List)
          .map((e) => (e as num).toDouble())
          .toList(),
      temperature2mMin: (json['temperature_2m_min'] as List)
          .map((e) => (e as num).toDouble())
          .toList(),
      sunrise: List<String>.from(json['sunrise']),
      sunset: List<String>.from(json['sunset']),
      uvIndexMax: (json['uv_index_max'] as List)
          .map((e) => (e as num).toDouble())
          .toList(),
    );
  }
}

String decodeWeatherCode(int weatherCode, SupportedLanguage lang) {
  return translations[lang]!['weather'][weatherCode];
}

bool isNight(DateTime now, Daily? dailyData) {
  if (dailyData == null) {
    return false;
  }

  String date = DateFormat('yyyy-MM-dd').format(now);

  int dayIndex = dailyData.time.indexOf(date);

  DateTime sunrise = DateTime.parse(dailyData.sunrise[dayIndex]);
  DateTime sunset = DateTime.parse(dailyData.sunset[dayIndex]);

  if (now.compareTo(sunrise) < 0 || now.compareTo(sunset) > 0) {
    return true;
  }

  return false;
}

String getWeatherIcon(int weatherCode, bool isNight) {
  Map<int, String> weatherCodeIcons = isNight
      ? {
          0: WeatherIconsSVG.clearNight,
          1: WeatherIconsSVG.fairNight,
          2: WeatherIconsSVG.cloudyNight1,
          3: WeatherIconsSVG.cloudy,
          45: WeatherIconsSVG.fog,
          48: WeatherIconsSVG.frost,
          51: WeatherIconsSVG.rainy4,
          53: WeatherIconsSVG.rainy5,
          55: WeatherIconsSVG.rainy5,
          56: WeatherIconsSVG.snowy4,
          57: WeatherIconsSVG.snowy5,
          61: WeatherIconsSVG.rainy4,
          63: WeatherIconsSVG.rainy5,
          65: WeatherIconsSVG.rainy6,
          67: WeatherIconsSVG.rainy7,
          71: WeatherIconsSVG.snowy4,
          73: WeatherIconsSVG.snowy5,
          75: WeatherIconsSVG.snowy6,
          77: WeatherIconsSVG.sleet,
          80: WeatherIconsSVG.rainy5,
          81: WeatherIconsSVG.rainy4,
          82: WeatherIconsSVG.rainy5,
          85: WeatherIconsSVG.snowy4,
          86: WeatherIconsSVG.snowy5,
          95: WeatherIconsSVG.thunder,
          96: WeatherIconsSVG.thunder,
          99: WeatherIconsSVG.thunder,
        }
      : {
          0: WeatherIconsSVG.clearDay,
          1: WeatherIconsSVG.fairDay,
          2: WeatherIconsSVG.cloudyDay1,
          3: WeatherIconsSVG.cloudy,
          45: WeatherIconsSVG.fog,
          48: WeatherIconsSVG.frost,
          51: WeatherIconsSVG.rainy2,
          53: WeatherIconsSVG.rainy3,
          55: WeatherIconsSVG.rainy3,
          56: WeatherIconsSVG.snowy2,
          57: WeatherIconsSVG.snowy3,
          61: WeatherIconsSVG.rainy4,
          63: WeatherIconsSVG.rainy5,
          65: WeatherIconsSVG.rainy6,
          67: WeatherIconsSVG.rainy7,
          71: WeatherIconsSVG.snowy4,
          73: WeatherIconsSVG.snowy5,
          75: WeatherIconsSVG.snowy6,
          77: WeatherIconsSVG.sleet,
          80: WeatherIconsSVG.rainy1,
          81: WeatherIconsSVG.rainy2,
          82: WeatherIconsSVG.rainy3,
          85: WeatherIconsSVG.snowy2,
          86: WeatherIconsSVG.snowy3,
          95: WeatherIconsSVG.thunder,
          96: WeatherIconsSVG.thunder,
          99: WeatherIconsSVG.thunder,
        };

  if (!weatherCodeIcons.containsKey(weatherCode)) {
    return WeatherIconsSVG.missingData;
  }

  return weatherCodeIcons[weatherCode]!;
}
