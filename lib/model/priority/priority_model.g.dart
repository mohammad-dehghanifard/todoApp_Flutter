// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'priority_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PriorityModelAdapter extends TypeAdapter<PriorityModel> {
  @override
  final int typeId = 2;

  @override
  PriorityModel read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return PriorityModel.low;
      case 1:
        return PriorityModel.normal;
      case 2:
        return PriorityModel.height;
      default:
        return PriorityModel.low;
    }
  }

  @override
  void write(BinaryWriter writer, PriorityModel obj) {
    switch (obj) {
      case PriorityModel.low:
        writer.writeByte(0);
        break;
      case PriorityModel.normal:
        writer.writeByte(1);
        break;
      case PriorityModel.height:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PriorityModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
