import 'package:flutter/material.dart';

class AppTheme {
  static const _seedColor = Color(0xFFC0392B);

  static ThemeData light() => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: _seedColor, brightness: Brightness.light),
        inputDecorationTheme: const InputDecorationTheme(border: OutlineInputBorder()),
      );

  static ThemeData dark() => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: _seedColor, brightness: Brightness.dark),
        inputDecorationTheme: const InputDecorationTheme(border: OutlineInputBorder()),
      );
}
