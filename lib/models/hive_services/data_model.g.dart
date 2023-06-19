// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DrinkboxAdapter extends TypeAdapter<Drinkbox> {
  @override
  final int typeId = 0;

  @override
  Drinkbox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Drinkbox(
      time: fields[0] as String,
      addWater: fields[1] as int,
      date: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Drinkbox obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.time)
      ..writeByte(1)
      ..write(obj.addWater)
      ..writeByte(2)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DrinkboxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MedicinesAddAdapter extends TypeAdapter<MedicinesAdd> {
  @override
  final int typeId = 1;

  @override
  MedicinesAdd read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MedicinesAdd(
      date: fields[5] as DateTime,
      medTime: fields[4] as String,
      medicinename: fields[1] as String,
      reason: fields[2] as String,
      category: fields[3] as String,
    )..isCompleted = fields[0] as bool;
  }

  @override
  void write(BinaryWriter writer, MedicinesAdd obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.isCompleted)
      ..writeByte(1)
      ..write(obj.medicinename)
      ..writeByte(2)
      ..write(obj.reason)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.medTime)
      ..writeByte(5)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MedicinesAddAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WatergoalAdapter extends TypeAdapter<Watergoal> {
  @override
  final int typeId = 2;

  @override
  Watergoal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Watergoal(
      addgoal: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Watergoal obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.addgoal);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WatergoalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MedCompletedAdapter extends TypeAdapter<MedCompleted> {
  @override
  final int typeId = 3;

  @override
  MedCompleted read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MedCompleted(
      medicinename: fields[0] as String,
      reason: fields[1] as String,
      category: fields[2] as String,
      medTime: fields[3] as String,
      date: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, MedCompleted obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.medicinename)
      ..writeByte(1)
      ..write(obj.reason)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.medTime)
      ..writeByte(4)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MedCompletedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class IndicatorValueAdapter extends TypeAdapter<IndicatorValue> {
  @override
  final int typeId = 4;

  @override
  IndicatorValue read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IndicatorValue(
      indicatorValue: fields[0] as double,
    );
  }

  @override
  void write(BinaryWriter writer, IndicatorValue obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.indicatorValue);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IndicatorValueAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
