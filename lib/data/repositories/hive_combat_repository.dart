import 'package:hive_flutter/hive_flutter.dart';
import '../../domain/repositories/i_combat_repository.dart';
import '../models/combat.dart';
import '../models/combatant.dart';

class HiveCombatRepository implements ICombatRepository {
  final Box<Combat> combatBox;
  final Box<Combatant> combatantBox;

  HiveCombatRepository(this.combatBox, this.combatantBox);

  @override
  Future<List<Combat>> getCombats() async {
    return combatBox.values.toList();
  }

  @override
  Stream<List<Combat>> watchCombats() {
    return combatBox.watch().map((event) => combatBox.values.toList()).startWith(combatBox.values.toList());
  }

  @override
  Stream<Combat?> watchCombat(int id) {
    return combatBox.watch(key: id).map((event) => combatBox.get(id)).startWith(combatBox.get(id));
  }

  @override
  Future<Combat?> getCombat(int id) async {
    return combatBox.get(id);
  }

  @override
  Future<List<Combatant>> getCombatants(int combatId) async {
    final combatants = combatantBox.values
        .where((c) => c.combatId == combatId)
        .toList();
    combatants.sort((a, b) => b.initiative.compareTo(a.initiative));
    return combatants;
  }

  @override
  Future<void> addCombat(Combat combat) async {
    await combatBox.add(combat);
  }

  @override
  Future<void> updateCombat(Combat combat) async {
    await combat.save();
  }

  @override
  Future<void> deleteCombat(int id) async {
    await combatBox.delete(id);
    // Delete associated combatants manually
    final combatantsToDelete = combatantBox.values
        .where((c) => c.combatId == id)
        .map((c) => c.key)
        .toList();
    await combatantBox.deleteAll(combatantsToDelete);
  }

  @override
  Future<void> addCombatant(Combatant combatant) async {
    await combatantBox.add(combatant);
  }

  @override
  Future<void> updateCombatant(Combatant combatant) async {
    await combatant.save();
  }

  @override
  Future<void> deleteCombatant(int id) async {
    await combatantBox.delete(id);
  }

  @override
  Stream<List<Combatant>> watchCombatants(int combatId) {
    // Watch the box and filter manually
    // Note: Hive watch emits events, not the full list, so we map to the list
    return combatantBox.watch().map((_) {
      final combatants = combatantBox.values
          .where((c) => c.combatId == combatId)
          .toList();
      combatants.sort((a, b) => b.initiative.compareTo(a.initiative));
      return combatants;
    }).startWith(
      // Emit initial value
      combatantBox.values
          .where((c) => c.combatId == combatId)
          .toList()
        ..sort((a, b) => b.initiative.compareTo(a.initiative)),
    );
  }
}

// Extension to emit initial value for Stream
extension StreamStartWith<T> on Stream<T> {
  Stream<T> startWith(T initial) async* {
    yield initial;
    yield* this;
  }
}
