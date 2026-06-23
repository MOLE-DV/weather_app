import 'package:hive_flutter/hive_flutter.dart';

enum WindSpeedUnit { kmh, ms, mph, kn }

class WindSpeedUnitAdapter extends TypeAdapter<WindSpeedUnit> {
  @override
  final int typeId = 4;

  @override
  WindSpeedUnit read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return WindSpeedUnit.kmh;
      case 1:
        return WindSpeedUnit.mph;
      case 2:
        return WindSpeedUnit.ms;
      case 3:
        return WindSpeedUnit.kn;
      default:
        return WindSpeedUnit.kmh;
    }
  }

  @override
  void write(BinaryWriter writer, WindSpeedUnit obj) {
    switch (obj) {
      case WindSpeedUnit.kmh:
        writer.writeByte(0);
        break;
      case WindSpeedUnit.mph:
        writer.writeByte(1);
        break;
      case WindSpeedUnit.ms:
        writer.writeByte(2);
        break;
      case WindSpeedUnit.kn:
        writer.writeByte(3);
        break;
    }
  }
}
