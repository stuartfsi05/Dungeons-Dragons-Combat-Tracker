import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = StateProvider<ThemeMode>((ref) {
  return ThemeMode.dark; // Default to dark
});

final localeProvider = StateProvider<Locale>((ref) {
  return const Locale('pt', 'BR'); // Default to Portuguese
});
