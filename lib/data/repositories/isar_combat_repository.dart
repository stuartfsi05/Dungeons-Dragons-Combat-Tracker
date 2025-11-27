import 'package:isar/isar.dart';
import '../../domain/repositories/i_combat_repository.dart';
import '../models/combat.dart';
import '../models/combatant.dart';

class IsarCombatRepository implements ICombatRepository {
  final Isar isar;

  IsarCombatRepository(this.isar);

  @override
  Future<List<Combat>> getCombats() async {
    return await isar.combats.where().findAll();
  }

  @override
  Stream<List<Combat>> watchCombats() {
    return isar.combats.where().watch(fireImmediately: true);
  }

  @override
  Stream<Combat?> watchCombat(int id) {
    return isar.combats.watchObject(id, fireImmediately: true);
  }

  @override
  Future<Combat?> getCombat(int id) async {
    return await isar.combats.get(id);
  }

  @override
  Future<List<Combatant>> getCombatants(int combatId) async {
    return await isar.combatants
        .filter()
        .combatIdEqualTo(combatId)
        .sortByInitiativeDesc()
        .findAll();
  }

  @override
  Future<void> addCombat(Combat combat) async {
    await isar.writeTxn(() async {
      await isar.combats.put(combat);
    });
  }

  @override
  Future<void> updateCombat(Combat combat) async {
    await isar.writeTxn(() async {
      await isar.combats.put(combat);
    });
  }

  @override
  Future<void> deleteCombat(int id) async {
    await isar.writeTxn(() async {
      await isar.combats.delete(id);
      // Delete associated combatants
      // Note: This relies on the generated extension methods from build_runner
      await isar.combatants.filter().combatIdEqualTo(id).deleteAll();
    });
  }

  @override
  Future<void> addCombatant(Combatant combatant) async {
    await isar.writeTxn(() async {
      await isar.combatants.put(combatant);
    });
  }

  @override
  Future<void> updateCombatant(Combatant combatant) async {
    await isar.writeTxn(() async {
      await isar.combatants.put(combatant);
    });
  }

  @override
  Future<void> deleteCombatant(int id) async {
    await isar.writeTxn(() async {
      await isar.combatants.delete(id);
    });
  }

  @override
  Stream<List<Combatant>> watchCombatants(int combatId) {
    // Auto-sort by initiative descending
    return isar.combatants
        .filter()
        .combatIdEqualTo(combatId)
        .sortByInitiativeDesc()
        .watch(fireImmediately: true);
  }
}
