import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/combat.dart';
import '../../data/models/combatant.dart';
import '../../data/repositories/isar_combat_repository.dart';
import '../../domain/repositories/i_combat_repository.dart';

part 'repository_providers.g.dart';

@Riverpod(keepAlive: true)
Future<Isar> isar(IsarRef ref) async {
  final dir = await getApplicationDocumentsDirectory();
  return await Isar.open(
    [CombatSchema, CombatantSchema],
    directory: dir.path,
  );
}

@riverpod
Future<ICombatRepository> combatRepository(CombatRepositoryRef ref) async {
  final isar = await ref.watch(isarProvider.future);
  return IsarCombatRepository(isar);
}
