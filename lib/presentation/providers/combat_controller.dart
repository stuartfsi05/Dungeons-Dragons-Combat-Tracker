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

  Future<void> nextTurn(int combatId, int combatantCount) async {
    if (combatantCount == 0) return;

    final repository = await ref.read(combatRepositoryProvider.future);
    final combats = await repository.getCombats();
    final combat = combats.firstWhere((c) => c.id == combatId);

    combat.currentTurnIndex++;
    if (combat.currentTurnIndex >= combatantCount) {
      combat.currentTurnIndex = 0;
      combat.roundCount++;
    }

    await repository.updateCombat(combat);
  }
}
