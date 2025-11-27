// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'D&D Combat Tracker';

  @override
  String get noActiveCombats => 'No active combats.\nStart a new one!';

  @override
  String get round => 'Round';

  @override
  String get newCombat => 'New Combat';

  @override
  String get encounterName => 'Encounter Name';

  @override
  String get cancel => 'Cancel';

  @override
  String get create => 'Create';

  @override
  String get addCombatant => 'ADD COMBATANT';

  @override
  String get nextTurn => 'NEXT TURN';

  @override
  String get addCombatantTitle => 'Add Combatant';

  @override
  String get editCombatantTitle => 'Edit Combatant';

  @override
  String get name => 'Name';

  @override
  String get initiative => 'Initiative';

  @override
  String get maxHp => 'Max HP';

  @override
  String get isPlayer => 'Is Player?';

  @override
  String get add => 'Add';

  @override
  String get save => 'Save';

  @override
  String get edit => 'Edit';

  @override
  String get delete => 'Delete';

  @override
  String get addCombatantsToStart => 'Add combatants to start!';

  @override
  String get error => 'Error';

  @override
  String get errorLoadingRepo => 'Error loading repo';
}
