import 'package:hive/hive.dart';
import 'package:weather_app/hive/temperature_unit_adapter.dart';
import 'package:weather_app/hive/wind_speed_unit_adapter.dart';
import 'package:weather_app/utils/translations/app_translation.dart';
import 'package:weather_app/utils/translations/translation.dart';

class AppSettings {
  TemperatureUnit temperatureUnit;
  WindSpeedUnit windSpeedUnit;
  SupportedLanguage language;

  AppSettings({
    this.temperatureUnit = TemperatureUnit.celsius,
    this.windSpeedUnit = WindSpeedUnit.kmh,
    this.language = SupportedLanguage.en,
  });
}

class AppSettingsAdapter extends TypeAdapter<AppSettings> {
  @override
  final int typeId = 3;

  @override
  AppSettings read(BinaryReader reader) {
    return AppSettings(
      temperatureUnit: TemperatureUnit.values[reader.readByte()],
      windSpeedUnit: WindSpeedUnit.values[reader.readByte()],
      language: SupportedLanguage.values[reader.readByte()],
    );
  }

  @override
  void write(BinaryWriter writer, AppSettings obj) {
    writer.writeByte(obj.temperatureUnit.index);
    writer.writeByte(obj.windSpeedUnit.index);
    writer.writeByte(obj.language.index);
  }
}
