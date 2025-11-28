// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'combatant.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CombatantAdapter extends TypeAdapter<Combatant> {
  @override
  final int typeId = 1;

  @override
  Combatant read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Combatant()
      ..combatId = fields[0] as int
      ..name = fields[1] as String
      ..initiative = fields[2] as int
      ..hpCurrent = fields[3] as int
      ..hpMax = fields[4] as int
      ..isPlayer = fields[5] as bool
      ..armorClass = fields[6] as int
      ..hpTemp = fields[7] as int
      ..conditions = (fields[8] as List).cast<String>();
  }

  @override
  void write(BinaryWriter writer, Combatant obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.combatId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.initiative)
      ..writeByte(3)
      ..write(obj.hpCurrent)
      ..writeByte(4)
      ..write(obj.hpMax)
      ..writeByte(5)
      ..write(obj.isPlayer)
      ..writeByte(6)
      ..write(obj.armorClass)
      ..writeByte(7)
      ..write(obj.hpTemp)
      ..writeByte(8)
      ..write(obj.conditions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CombatantAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
