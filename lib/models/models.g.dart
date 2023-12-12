// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfilemodelAdapter extends TypeAdapter<Profilemodel> {
  @override
  final int typeId = 1;

  @override
  Profilemodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Profilemodel(
      gender: fields[0] as String?,
      height: fields[1] as int?,
      Weight: fields[2] as int?,
      profile: fields[4] as String?,
      BIM: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Profilemodel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.gender)
      ..writeByte(1)
      ..write(obj.height)
      ..writeByte(2)
      ..write(obj.Weight)
      ..writeByte(3)
      ..write(obj.BIM)
      ..writeByte(4)
      ..write(obj.profile);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfilemodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
