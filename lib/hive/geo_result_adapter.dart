import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/api/geo_api.dart';

class GeoResultAdapter extends TypeAdapter<GeoResult> {
  @override
  final int typeId = 1;

  @override
  GeoResult read(BinaryReader reader) {
    final int id = reader.readInt();
    final String name = reader.readString();
    final double latitude = reader.readDouble();
    final double longitude = reader.readDouble();
    final double elevation = reader.readDouble();
    final String admin1 = reader.readString();
    final String featureCode = reader.readString();
    final String countryCode = reader.readString();
    final String timezone = reader.readString();
    final List<String> postcodes = reader.readStringList();
    final int countryId = reader.readInt();
    final String country = reader.readString();

    return GeoResult(
      id: id,
      name: name,
      latitude: latitude,
      longitude: longitude,
      elevation: elevation,
      admin1: admin1,
      featureCode: featureCode,
      countryCode: countryCode,
      timezone: timezone,
      postcodes: postcodes,
      countryId: countryId,
      country: country,
    );
  }

  @override
  void write(BinaryWriter writer, GeoResult obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.name);
    writer.writeDouble(obj.latitude);
    writer.writeDouble(obj.longitude);
    writer.writeDouble(obj.elevation);
    writer.writeString(obj.admin1);
    writer.writeString(obj.featureCode);
    writer.writeString(obj.countryCode);
    writer.writeString(obj.timezone);
    writer.writeStringList(obj.postcodes);
    writer.writeInt(obj.countryId);
    writer.writeString(obj.country);
  }
}
