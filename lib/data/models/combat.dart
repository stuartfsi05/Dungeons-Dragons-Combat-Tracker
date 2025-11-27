import 'package:isar/isar.dart';

part 'combat.g.dart';

@collection
class Combat {
  Id id = Isar.autoIncrement;

  late String name;

  late DateTime createdAt;

  @enumerated
  late CombatStatus status;

  int roundCount = 1;

  int currentTurnIndex = 0;
}

enum CombatStatus {
  active,
  finished,
}
