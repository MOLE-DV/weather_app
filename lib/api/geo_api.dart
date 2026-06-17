import 'dart:convert';

import 'package:http/http.dart' as http;

class GeoApi {
  Future<GeoResponse?> getLocations(String name, String? countryCode) async {
    var response = await http.get(
      Uri.parse(
        'https://geocoding-api.open-meteo.com/v1/search?name=$name&count=10&language=en&format=json${countryCode != null ? '&countryCode=$countryCode' : ''}',
      ),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return GeoResponse.fromJson(data);
    } else {
      return null;
    }
  }
}

class GeoResponse {
  final List<GeoResult>? results;
  final double generationtimeMs;

  GeoResponse({required this.results, required this.generationtimeMs});

  factory GeoResponse.fromJson(Map<String, dynamic> json) {
    return GeoResponse(
      results:
          (json['results'] as List<dynamic>?)
              ?.map((e) => GeoResult.fromJson(e))
              .toList() ??
          [],
      generationtimeMs: (json['generationtime_ms'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'results': results?.map((e) => e.toJson()).toList() ?? [],
      'generationtime_ms': generationtimeMs,
    };
  }
}

class GeoResult {
  final int id;
  final String name;
  final double latitude;
  final double longitude;
  final double elevation;
  final String admin1;
  final String featureCode;
  final String countryCode;
  final String timezone;
  final List<String> postcodes;
  final int countryId;
  final String country;

  GeoResult({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.elevation,
    required this.admin1,
    required this.featureCode,
    required this.countryCode,
    required this.timezone,
    required this.postcodes,
    required this.countryId,
    required this.country,
  });

  factory GeoResult.fromJson(Map<String, dynamic> json) {
    return GeoResult(
      id: json['id'],
      name: json['name'],
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      elevation: (json['elevation'] as num).toDouble(),
      admin1: json['admin1'],
      featureCode: json['feature_code'],
      countryCode: json['country_code'],
      timezone: json['timezone'],
      postcodes: List<String>.from(json['postcodes'] ?? []),
      countryId: json['country_id'],
      country: json['country'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
      'elevation': elevation,
      'feature_code': featureCode,
      'country_code': countryCode,
      'timezone': timezone,
      'postcodes': postcodes,
      'country_id': countryId,
      'country': country,
    };
  }
}
