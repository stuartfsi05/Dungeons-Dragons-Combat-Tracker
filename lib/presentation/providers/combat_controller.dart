import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/combat.dart';
import 'repository_providers.dart';

part 'combat_controller.g.dart';

@riverpod
class CombatController extends _$CombatController {
  @override
  Stream<List<Combat>> build() async* {
    final repository = await ref.watch(combatRepositoryProvider.future);
    yield* repository.watchCombats();
  }

  Future<void> addCombat(String name) async {
    final repository = await ref.read(combatRepositoryProvider.future);
    final combat = Combat()
      ..name = name
      ..createdAt = DateTime.now()
      ..status = CombatStatus.active;
    await repository.addCombat(combat);
  }

  Future<void> deleteCombat(int id) async {
    final repository = await ref.read(combatRepositoryProvider.future);
    await repository.deleteCombat(id);
  }

  Future<void> nextTurn(int combatId) async {
    final repository = await ref.read(combatRepositoryProvider.future);
    final combat = await repository.getCombat(combatId);
    if (combat == null) return;

    final combatants = await repository.getCombatants(combatId);
    if (combatants.isEmpty) return;

    // Sort by initiative descending (matching UI)
    combatants.sort((a, b) => b.initiative.compareTo(a.initiative));

    int nextIndex = combat.currentTurnIndex + 1;
    bool foundNext = false;

    // Search for next alive combatant in current round
    for (int i = nextIndex; i < combatants.length; i++) {
      if (combatants[i].hpCurrent > 0) {
        combat.currentTurnIndex = i;
        foundNext = true;
        break;
      }
    }

    // If not found, wrap around to start (next round)
    if (!foundNext) {
      combat.roundCount++;
      combat.currentTurnIndex = 0; // Default to 0 if all dead
      for (int i = 0; i < combatants.length; i++) {
        if (combatants[i].hpCurrent > 0) {
          combat.currentTurnIndex = i;
          break;
        }
      }
    }

    await repository.updateCombat(combat);
  }
}
