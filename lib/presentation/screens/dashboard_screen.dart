import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/combat_controller.dart';
import 'combat_detail_screen.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../providers/locale_provider.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final combatsAsync = ref.watch(combatControllerProvider);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle, style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          PopupMenuButton<Locale>(
            icon: const Icon(Icons.language),
            onSelected: (locale) {
              ref.read(localeProvider.notifier).state = locale;
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: Locale('pt', 'BR'),
                child: Text('Português (Brasil)'),
              ),
              const PopupMenuItem(
                value: Locale('en', ''),
                child: Text('English'),
              ),
            ],
          ),
        ],
      ),
      body: combatsAsync.when(
        data: (combats) {
          if (combats.isEmpty) {
            return Center(
              child: Text(
                l10n.noActiveCombats,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(fontSize: 18, color: Colors.grey),
              ),
            );
          }
          return CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final combat = combats[index];
                    return Dismissible(
                      key: Key(combat.id.toString()),
                      background: Container(color: Colors.red),
                      onDismissed: (_) {
                        ref.read(combatControllerProvider.notifier).deleteCombat(combat.id);
                      },
                      child: ListTile(
                        title: Text(combat.name, style: GoogleFonts.inter(fontSize: 18)),
                        subtitle: Text('${l10n.round}: ${combat.roundCount}'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CombatDetailScreen(combatId: combat.id, combatName: combat.name),
                            ),
                          );
                        },
                      ),
                    );
                  },
                  childCount: combats.length,
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('${l10n.error}: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddCombatDialog(context, ref),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _showAddCombatDialog(BuildContext context, WidgetRef ref) async {
    final controller = TextEditingController();
    final l10n = AppLocalizations.of(context)!;
    
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.newCombat),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: l10n.encounterName),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                ref.read(combatControllerProvider.notifier).addCombat(controller.text);
                Navigator.pop(context);
              }
            },
            child: Text(l10n.create),
          ),
        ],
      ),
    );
  }
}
