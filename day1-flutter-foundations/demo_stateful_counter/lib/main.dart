import 'package:flutter/material.dart';

import 'screens/comparison_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stateful Counter - Day 1 Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Dubai red as the seed color for Material 3
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFC0392B),
        ),
        useMaterial3: true,
      ),
      home: const ComparisonScreen(),
    );
  }
}
