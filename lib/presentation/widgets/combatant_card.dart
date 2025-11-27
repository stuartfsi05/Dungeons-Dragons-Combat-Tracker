import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dnd_combat_tracker/l10n/app_localizations.dart';
import '../../data/models/combatant.dart';

class CombatantCard extends StatefulWidget {
  final Combatant combatant;
  final bool isActive;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onConditionTap;
  final VoidCallback? onTempHpTap;
  final void Function(int) onMinus;
  final void Function(int) onPlus;

  const CombatantCard({
    super.key,
    required this.combatant,
    required this.onMinus,
    required this.onPlus,
    this.isActive = false,
    this.onEdit,
    this.onDelete,
    this.onConditionTap,
    this.onTempHpTap,
  });

  @override
  State<CombatantCard> createState() => _CombatantCardState();
}

class _CombatantCardState extends State<CombatantCard> {
  late TextEditingController _hpController;

  @override
  void initState() {
    super.initState();
    _hpController = TextEditingController();
  }

  @override
  void dispose() {
    _hpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDead = widget.combatant.hpCurrent == 0;

    return AnimatedScale(
      scale: widget.isActive ? 1.02 : 1.0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutBack,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isDead
              ? Theme.of(context).colorScheme.surface.withValues(alpha: 0.5)
              : widget.isActive
                  ? Theme.of(context)
                      .colorScheme
                      .primary
                      .withValues(alpha: 0.15)
                  : Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: widget.isActive
                ? Theme.of(context).colorScheme.primary
                : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            if (widget.isActive)
              BoxShadow(
                color: Theme.of(context)
                    .colorScheme
                    .primary
                    .withValues(alpha: 0.3),
                blurRadius: 8,
                spreadRadius: 1,
              )
          ],
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  // Initiative Badge
                  Column(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '${widget.combatant.initiative}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      if (widget.combatant.armorClass > 0) ...[
                        Text(
                          'CA ${widget.combatant.armorClass}',
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                      ],
                      Icon(
                        widget.combatant.isPlayer
                            ? Icons.person
                            : Icons.smart_toy, // Enemy icon
                        size: 16,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  const SizedBox(width: 12),

                  // Name & Stats
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.combatant.name,
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            decoration:
                                isDead ? TextDecoration.lineThrough : null,
                          ),
                        ),
                        const SizedBox(height: 4),
                        // AC & Temp HP moved to other locations
                        if (widget.combatant.conditions.isNotEmpty ||
                            widget.combatant.hpTemp > 0)
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Wrap(
                              spacing: 4,
                              runSpacing: 4,
                              children: [
                                if (widget.combatant.hpTemp > 0)
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: Colors.blue.withValues(alpha: 0.2),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      '+${widget.combatant.hpTemp} TP',
                                      style: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue),
                                    ),
                                  ),
                                ...widget.combatant.conditions.map(
                                  (c) => Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: Colors.teal.withValues(alpha: 0.2),
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          color: Colors.teal, width: 1),
                                    ),
                                    child: Text(
                                      c,
                                      style: const TextStyle(
                                          fontSize: 10, color: Colors.teal),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        const SizedBox(height: 8),
                        Stack(
                          children: [
                            Container(
                              height: 8,
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .outlineVariant,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            AnimatedFractionallySizedBox(
                              duration: const Duration(milliseconds: 300),
                              widthFactor: widget.combatant.hpMax > 0
                                  ? (widget.combatant.hpCurrent /
                                          widget.combatant.hpMax)
                                      .clamp(0.0, 1.0)
                                  : 0,
                              child: Container(
                                height: 8,
                                decoration: BoxDecoration(
                                  color: isDead ? Colors.red : Colors.green,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${widget.combatant.hpCurrent} / ${widget.combatant.hpMax} HP',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: Theme.of(context)
                                .colorScheme
                                .onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Controls
                  const SizedBox(width: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove_circle_outline),
                                color: Colors.redAccent,
                                constraints: const BoxConstraints(),
                                padding: const EdgeInsets.all(8),
                                onPressed: () {
                                  final val = int.tryParse(_hpController.text);
                                  if (val != null) widget.onMinus(val);
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.add_circle_outline),
                                color: Colors.greenAccent,
                                constraints: const BoxConstraints(),
                                padding: const EdgeInsets.all(8),
                                onPressed: () {
                                  final val = int.tryParse(_hpController.text);
                                  if (val != null) widget.onPlus(val);
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 50,
                            height: 30,
                            child: TextFormField(
                              controller: _hpController,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                hintText: '',
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 8),
                                border: OutlineInputBorder(),
                              ),
                              onTapOutside: (_) =>
                                  FocusManager.instance.primaryFocus?.unfocus(),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.shield_outlined),
                            color: Colors.blue,
                            constraints: const BoxConstraints(),
                            padding: const EdgeInsets.all(8),
                            onPressed: widget.onTempHpTap,
                          ),
                          IconButton(
                            icon: const Icon(Icons.label_outline),
                            color: Colors.teal,
                            constraints: const BoxConstraints(),
                            padding: const EdgeInsets.all(8),
                            onPressed: widget.onConditionTap,
                          ),
                        ],
                      ),
                      PopupMenuButton<String>(
                        padding: EdgeInsets.zero,
                        onSelected: (value) {
                          if (value == 'edit') widget.onEdit?.call();
                          if (value == 'delete') widget.onDelete?.call();
                          if (value == 'condition') {
                            widget.onConditionTap?.call();
                          }
                        },
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 'condition',
                            child: Row(
                              children: [
                                const Icon(Icons.label_outline,
                                    size: 20, color: Colors.black54),
                                const SizedBox(width: 8),
                                Text('Condições'),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: 'edit',
                            child: Text(AppLocalizations.of(context)!.edit),
                          ),
                          PopupMenuItem(
                            value: 'delete',
                            child: Text(AppLocalizations.of(context)!.delete),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (isDead)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.dangerous,
                          size: 48, color: Colors.white54),
                      const SizedBox(width: 16),
                      ElevatedButton.icon(
                        onPressed: widget.onDelete,
                        icon: const Icon(Icons.delete),
                        label: const Text('Remover'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
