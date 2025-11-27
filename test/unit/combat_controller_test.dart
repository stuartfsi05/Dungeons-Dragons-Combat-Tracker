import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dnd_combat_tracker/presentation/providers/combat_controller.dart';
import 'package:dnd_combat_tracker/presentation/providers/repository_providers.dart';
import 'package:dnd_combat_tracker/domain/repositories/i_combat_repository.dart';
import 'package:dnd_combat_tracker/data/models/combat.dart';
import 'package:dnd_combat_tracker/data/models/combatant.dart';

// Manual Mock
class MockCombatRepository implements ICombatRepository {
  final List<Combat> _combats = [];

  @override
  Future<void> addCombat(Combat combat) async {
    combat.id = _combats.length + 1; // Simulate ID generation
    _combats.add(combat);
  }

  @override
  Future<void> deleteCombat(int id) async {
    _combats.removeWhere((c) => c.id == id);
  }

  @override
  Future<List<Combat>> getCombats() async {
    return _combats;
  }

  @override
  Future<void> updateCombat(Combat combat) async {
    final index = _combats.indexWhere((c) => c.id == combat.id);
    if (index != -1) {
      _combats[index] = combat;
    }
  }

  @override
  Stream<List<Combat>> watchCombats() {
    return Stream.value(_combats);
  }

  final List<Combatant> _combatants = [];

  @override
  Future<Combat?> getCombat(int id) async {
    try {
      return _combats.firstWhere((c) => c.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<List<Combatant>> getCombatants(int combatId) async {
    return _combatants.where((c) => c.combatId == combatId).toList();
  }

  @override
  Future<void> addCombatant(Combatant combatant) async {
    combatant.id = _combatants.length + 1;
    _combatants.add(combatant);
  }

  @override
  Future<void> deleteCombatant(int id) async {}
  @override
  Future<void> updateCombatant(Combatant combatant) async {
    final index = _combatants.indexWhere((c) => c.id == combatant.id);
    if (index != -1) {
      _combatants[index] = combatant;
    }
  }
  @override
  Stream<Combat?> watchCombat(int id) => Stream.value(null);
  @override
  Stream<List<Combatant>> watchCombatants(int combatId) => Stream.value([]);
}

void main() {
  late ProviderContainer container;
  late MockCombatRepository mockRepository;

  setUp(() {
    mockRepository = MockCombatRepository();
    container = ProviderContainer(
      overrides: [
        combatRepositoryProvider.overrideWith((ref) => mockRepository),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  test('addCombat adds a combat to the repository', () async {
    final controller = container.read(combatControllerProvider.notifier);

    await controller.addCombat('Test Combat');

    final combats = await mockRepository.getCombats();
    expect(combats.length, 1);
    expect(combats.first.name, 'Test Combat');
  });

  test('deleteCombat removes a combat', () async {
    final controller = container.read(combatControllerProvider.notifier);
    await controller.addCombat('To Delete');
    final combatsBefore = await mockRepository.getCombats();
    final id = combatsBefore.first.id;

    await controller.deleteCombat(id);

    final combatsAfter = await mockRepository.getCombats();
    expect(combatsAfter.isEmpty, true);
  });

  test('nextTurn increments turn index', () async {
    final controller = container.read(combatControllerProvider.notifier);
    await controller.addCombat('Turn Test');
    final combats = await mockRepository.getCombats();
    final combatId = combats.first.id;

    // Simulate 2 combatants
    await mockRepository.addCombatant(Combatant()
      ..combatId = combatId
      ..name = 'C1'
      ..initiative = 10
      ..hpMax = 10
      ..hpCurrent = 10
      ..isPlayer = true);
    await mockRepository.addCombatant(Combatant()
      ..combatId = combatId
      ..name = 'C2'
      ..initiative = 5
      ..hpMax = 10
      ..hpCurrent = 10
      ..isPlayer = false);

    await controller.nextTurn(combatId);

    final updatedCombats = await mockRepository.getCombats();
    expect(updatedCombats.first.currentTurnIndex, 1);
    expect(updatedCombats.first.roundCount, 1); // Starts at 1
  });

  test('nextTurn resets turn index and increments round', () async {
    final controller = container.read(combatControllerProvider.notifier);
    await controller.addCombat('Round Test');
    final combats = await mockRepository.getCombats();
    final combatId = combats.first.id;

    // Add combatants
    await mockRepository.addCombatant(Combatant()
      ..combatId = combatId
      ..name = 'C1'
      ..initiative = 10
      ..hpMax = 10
      ..hpCurrent = 10
      ..isPlayer = true);
    await mockRepository.addCombatant(Combatant()
      ..combatId = combatId
      ..name = 'C2'
      ..initiative = 5
      ..hpMax = 10
      ..hpCurrent = 10
      ..isPlayer = false);

    // Set initial state: last turn
    combats.first.currentTurnIndex = 1;
    await mockRepository.updateCombat(combats.first);

    // Move to next (should wrap around)
    await controller.nextTurn(combatId);

    final updatedCombats = await mockRepository.getCombats();
    expect(updatedCombats.first.currentTurnIndex, 0);
    expect(updatedCombats.first.roundCount, 2);
  });
}
