// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GoalEntityAdapter extends TypeAdapter<GoalEntity> {
  @override
  final int typeId = 0;

  @override
  GoalEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GoalEntity(
      fields[0] as String,
      fields[1] as double,
      fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, GoalEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.goalTitle)
      ..writeByte(1)
      ..write(obj.goalTarget)
      ..writeByte(2)
      ..write(obj.goalBalance);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GoalEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
