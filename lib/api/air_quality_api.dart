import 'dart:convert';
import 'package:http/http.dart' as http;

class AirQualityApi {
  Future<AirQualityResponse?> getAirQuality() async {
    final response = await http.get(
      Uri.parse(
        "https://air-quality-api.open-meteo.com/v1/air-quality?latitude=52.52&longitude=13.41&current=european_aqi,us_aqi&timezone=auto",
      ),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return AirQualityResponse.fromJson(data);
    } else {
      return null;
    }
  }
}

class AirQualityResponse {
  final double latitude;
  final double longitude;
  final double generationtimeMs;
  final int utcOffsetSeconds;
  final String timezone;
  final String timezoneAbbreviation;
  final double elevation;
  final CurrentUnits currentUnits;
  final Current current;

  AirQualityResponse({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.currentUnits,
    required this.current,
  });

  factory AirQualityResponse.fromJson(Map<String, dynamic> json) {
    return AirQualityResponse(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      generationtimeMs: (json['generationtime_ms'] as num).toDouble(),
      utcOffsetSeconds: json['utc_offset_seconds'],
      timezone: json['timezone'],
      timezoneAbbreviation: json['timezone_abbreviation'],
      elevation: (json['elevation'] as num).toDouble(),
      currentUnits: CurrentUnits.fromJson(json['current_units']),
      current: Current.fromJson(json['current']),
    );
  }
}

class CurrentUnits {
  final String time;
  final String inverval;
  final String europeanAqi;
  final String usAqi;

  CurrentUnits({
    required this.time,
    required this.inverval,
    required this.europeanAqi,
    required this.usAqi,
  });

  factory CurrentUnits.fromJson(Map<String, dynamic> json) {
    return CurrentUnits(
      time: json['time'],
      inverval: json['interval'],
      europeanAqi: json['european_aqi'],
      usAqi: json['us_aqi'],
    );
  }
}

class Current {
  final String time;
  final double interval;
  final double europeanAqi;
  final double usAqi;

  Current({
    required this.time,
    required this.interval,
    required this.europeanAqi,
    required this.usAqi,
  });

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      time: json['time'],
      interval: (json['interval'] as num).toDouble(),
      europeanAqi: (json['european_aqi'] as num).toDouble(),
      usAqi: (json['us_aqi'] as num).toDouble(),
    );
  }
}
