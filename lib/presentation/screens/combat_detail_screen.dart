import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/combat.dart';
import '../../data/models/combatant.dart';
import '../providers/combat_controller.dart';
import '../providers/repository_providers.dart';
import '../widgets/combatant_card.dart';
import 'package:dnd_combat_tracker/l10n/app_localizations.dart';

class CombatDetailScreen extends ConsumerWidget {
  final int combatId;
  final String combatName;

  const CombatDetailScreen({
    super.key,
    required this.combatId,
    required this.combatName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repositoryAsync = ref.watch(combatRepositoryProvider);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<Combat?>(
            stream: repositoryAsync.valueOrNull?.watchCombat(combatId),
            builder: (context, snapshot) {
              final combat = snapshot.data;
              return Column(
                children: [
                  Text(combatName),
                  if (combat != null)
                    Text(
                      '${l10n.round} ${combat.roundCount}',
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.normal),
                    ),
                ],
              );
            }),
        actions: const [],
      ),
      body: repositoryAsync.when(
        data: (repository) {
          return StreamBuilder<Combat?>(
              stream: repository.watchCombat(combatId),
              builder: (context, combatSnapshot) {
                final combat = combatSnapshot.data;

                return StreamBuilder<List<Combatant>>(
                  stream: repository.watchCombatants(combatId),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                          child: Text('${l10n.error}: ${snapshot.error}'));
                    }
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final combatants = snapshot.data!;
                    return Column(
                      children: [
                        Expanded(
                          child: combatants.isEmpty
                              ? Center(child: Text(l10n.addCombatantsToStart))
                              : ListView.builder(
                                  itemCount: combatants.length,
                                  itemBuilder: (context, index) {
                                    final combatant = combatants[index];
                                    final isActive = combat != null &&
                                        index == combat.currentTurnIndex;

                                    return CombatantCard(
                                      combatant: combatant,
                                      isActive: isActive,
                                      onMinus: (amount) =>
                                          _updateHp(ref, combatant, -amount),
                                      onPlus: (amount) =>
                                          _updateHp(ref, combatant, amount),
                                      onEdit: () => _showCombatantDialog(
                                          context, ref,
                                          combatant: combatant),
                                      onDelete: () =>
                                          _deleteCombatant(ref, combatant.id),
                                    );
                                  },
                                ),
                        ),

                        // Buttons
                        SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16),
                                      backgroundColor:
                                          Theme.of(context).colorScheme.primary,
                                      foregroundColor: Colors.white,
                                    ),
                                    onPressed: () =>
                                        _showCombatantDialog(context, ref),
                                    child: Text(
                                      l10n.addCombatant,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16),
                                      backgroundColor: Colors.amber[800],
                                      foregroundColor: Colors.white,
                                    ),
                                    onPressed: () {
                                      ref
                                          .read(
                                              combatControllerProvider.notifier)
                                          .nextTurn(combatId);
                                    },
                                    child: Text(
                                      l10n.nextTurn,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              });
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) =>
            Center(child: Text('${l10n.errorLoadingRepo}: $err')),
      ),
    );
  }

  Future<void> _updateHp(WidgetRef ref, Combatant combatant, int amount) async {
    final repository = await ref.read(combatRepositoryProvider.future);
    final newHp = (combatant.hpCurrent + amount).clamp(0, combatant.hpMax);

    final updatedCombatant = combatant..hpCurrent = newHp;

    await repository.updateCombatant(updatedCombatant);
  }

  Future<void> _deleteCombatant(WidgetRef ref, int id) async {
    final repository = await ref.read(combatRepositoryProvider.future);
    await repository.deleteCombatant(id);
  }

  Future<void> _showCombatantDialog(BuildContext context, WidgetRef ref,
      {Combatant? combatant}) async {
    final isEditing = combatant != null;
    final nameController = TextEditingController(text: combatant?.name ?? '');
    final initController =
        TextEditingController(text: combatant?.initiative.toString() ?? '');
    final hpController =
        TextEditingController(text: combatant?.hpMax.toString() ?? '');
    final acController =
        TextEditingController(text: combatant?.armorClass.toString() ?? '10');
    final hpTempController =
        TextEditingController(text: combatant?.hpTemp.toString() ?? '0');
    final conditionsController = TextEditingController();
    bool isPlayer = combatant?.isPlayer ?? false;
    final l10n = AppLocalizations.of(context)!;
    List<String> conditions = List.from(combatant?.conditions ?? []);

    await showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Text(
              isEditing ? l10n.editCombatantTitle : l10n.addCombatantTitle),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: l10n.name),
                  autofocus: true,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                          controller: initController,
                          decoration:
                              InputDecoration(labelText: l10n.initiative),
                          keyboardType: TextInputType.number),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                          controller: acController,
                          decoration: const InputDecoration(labelText: 'CA'),
                          keyboardType: TextInputType.number),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                          controller: hpController,
                          decoration: InputDecoration(labelText: l10n.maxHp),
                          keyboardType: TextInputType.number),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                          controller: hpTempController,
                          decoration:
                              const InputDecoration(labelText: 'HP Temp'),
                          keyboardType: TextInputType.number),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: conditionsController,
                  decoration: InputDecoration(
                    labelText: 'Adicionar Condição',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        if (conditionsController.text.isNotEmpty) {
                          setState(() {
                            conditions.add(conditionsController.text);
                            conditionsController.clear();
                          });
                        }
                      },
                    ),
                  ),
                  onSubmitted: (value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        conditions.add(value);
                        conditionsController.clear();
                      });
                    }
                  },
                ),
                Wrap(
                  spacing: 4,
                  children: conditions
                      .map((c) => Chip(
                            label: Text(c),
                            onDeleted: () {
                              setState(() {
                                conditions.remove(c);
                              });
                            },
                          ))
                      .toList(),
                ),
                CheckboxListTile(
                  title: Text(l10n.isPlayer),
                  value: isPlayer,
                  onChanged: (val) => setState(() => isPlayer = val!),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(l10n.cancel, textAlign: TextAlign.center)),
            TextButton(
              onPressed: () async {
                final repository =
                    await ref.read(combatRepositoryProvider.future);

                final name = nameController.text;
                final init = int.tryParse(initController.text) ?? 0;
                final hp = int.tryParse(hpController.text) ?? 10;
                final ac = int.tryParse(acController.text) ?? 10;
                final hpTemp = int.tryParse(hpTempController.text) ?? 0;

                if (name.isEmpty) return;

                if (isEditing) {
                  final updatedCombatant = combatant
                    ..name = name
                    ..initiative = init
                    ..hpMax = hp
                    ..armorClass = ac
                    ..hpTemp = hpTemp
                    ..conditions = conditions
                    ..isPlayer = isPlayer;
                  if (updatedCombatant.hpCurrent > hp) {
                    updatedCombatant.hpCurrent = hp;
                  }

                  await repository.updateCombatant(updatedCombatant);
                } else {
                  final newCombatant = Combatant()
                    ..combatId = combatId
                    ..name = name
                    ..initiative = init
                    ..hpMax = hp
                    ..hpCurrent = hp
                    ..armorClass = ac
                    ..hpTemp = hpTemp
                    ..conditions = conditions
                    ..isPlayer = isPlayer;

                  await repository.addCombatant(newCombatant);
                }

                if (context.mounted) Navigator.pop(context);
              },
              child: Text(isEditing ? l10n.save : l10n.add,
                  textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }
}
