import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localeProvider = StateProvider<Locale>((ref) {
  // Default to Portuguese (Brazil)
  return const Locale('pt', 'BR');
});
