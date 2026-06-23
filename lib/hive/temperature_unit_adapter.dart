import 'package:hive_flutter/hive_flutter.dart';

enum TemperatureUnit { celsius, fahrenheit }

class TemperatureUnitAdapter extends TypeAdapter<TemperatureUnit> {
  @override
  final int typeId = 2;

  @override
  TemperatureUnit read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TemperatureUnit.celsius;
      case 1:
        return TemperatureUnit.fahrenheit;
      default:
        return TemperatureUnit.celsius;
    }
  }

  @override
  void write(BinaryWriter writer, TemperatureUnit obj) {
    switch (obj) {
      case TemperatureUnit.celsius:
        writer.writeByte(0);
        break;
      case TemperatureUnit.fahrenheit:
        writer.writeByte(1);
        break;
    }
  }
}
