import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../data/models/combatant.dart';

class CombatantCard extends StatefulWidget {
  final Combatant combatant;
  final bool isActive;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const CombatantCard({
    super.key,
    required this.combatant,
    required this.onMinus,
    required this.onPlus,
    this.isActive = false,
    this.onEdit,
    this.onDelete,
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
              ? Theme.of(context).colorScheme.surface.withOpacity(0.5) 
              : widget.isActive 
                  ? Theme.of(context).colorScheme.primary.withOpacity(0.15)
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
                color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                blurRadius: 8,
                spreadRadius: 1,
              )
          ],
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  // Initiative Badge
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
                  const SizedBox(width: 16),
                  
                  // Name & HP Bar
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.combatant.name,
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            decoration: isDead ? TextDecoration.lineThrough : null,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Stack(
                          children: [
                            Container(
                              height: 8,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.outlineVariant,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            AnimatedFractionallySizedBox(
                              duration: const Duration(milliseconds: 300),
                              widthFactor: widget.combatant.hpMax > 0 
                                  ? (widget.combatant.hpCurrent / widget.combatant.hpMax).clamp(0.0, 1.0) 
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
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // HP Controls
                  const SizedBox(width: 16),
                  Row(
                    children: [
                      SizedBox(
                        width: 60,
                        child: TextFormField(
                          controller: _hpController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: 'Amt',
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {}, // Value is read on button press
                          onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline),
                        color: Colors.redAccent,
                        onPressed: () {
                          final val = int.tryParse(_hpController.text);
                          if (val != null) widget.onMinus(val);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline),
                        color: Colors.greenAccent,
            // Skull Overlay if Dead
            Positioned.fill(
              child: IgnorePointer(
                ignoring: !isDead,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: isDead ? 1.0 : 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.skull,
                      size: 48,
                      color: Colors.white54,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
