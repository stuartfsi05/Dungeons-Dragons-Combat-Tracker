# Flutter Wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }

# Isar (Critical for Release)
-keep class dev.isar.** { *; }
-keep class com.example.dnd_combat_tracker.data.models.** { *; }
-keepnames class * extends dev.isar.IsarCollection
-keep class * extends dev.isar.IsarCollection
-keep class * implements dev.isar.IsarGenerated
-keepattributes Signature, *Annotation*
-dontwarn dev.isar.**

# Riverpod
-keep class androidx.lifecycle.** { *; }
-keep class androidx.lifecycle.ViewModelProvider$Factory { *; }
-keep class androidx.lifecycle.ViewModel { *; }

# Models (Keep names for JSON/Isar)
-keepnames class com.example.dnd_combat_tracker.data.models.** { *; }

# General
-keepattributes EnclosingMethod
-keepattributes InnerClasses
-dontwarn io.flutter.**
