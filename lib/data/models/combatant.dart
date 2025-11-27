import 'package:isar/isar.dart';

part 'combatant.g.dart';

@collection
class Combatant {
  Id id = Isar.autoIncrement;

  @Index()
  late int combatId;

  late String name;

  @Index(type: IndexType.value)
  late int initiative;

  late int hpCurrent;

  late int hpMax;

  late bool isPlayer;
}
