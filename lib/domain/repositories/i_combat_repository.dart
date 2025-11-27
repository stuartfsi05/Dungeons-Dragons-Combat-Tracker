import '../../data/models/combat.dart';
import '../../data/models/combatant.dart';

abstract class ICombatRepository {
  // Combat CRUD
  Future<List<Combat>> getCombats();
  Stream<List<Combat>> watchCombats();
  Stream<Combat?> watchCombat(int id);
  Future<Combat?> getCombat(int id);
  Future<void> addCombat(Combat combat);
  Future<void> updateCombat(Combat combat);
  Future<void> deleteCombat(int id);

  // Combatant Management
  Future<List<Combatant>> getCombatants(int combatId);
  Future<void> addCombatant(Combatant combatant);
  Future<void> updateCombatant(Combatant combatant);
  Future<void> deleteCombatant(int id);
  Stream<List<Combatant>> watchCombatants(int combatId);
}
