import 'package:flutter/material.dart';

import 'screens/layout_showcase_screen.dart';

void main() {
  runApp(const LayoutWidgetsApp());
}

class LayoutWidgetsApp extends StatelessWidget {
  const LayoutWidgetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Widgets - Day 1 Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFC0392B),
        ),
        useMaterial3: true,
      ),
      home: const LayoutShowcaseScreen(),
    );
  }
}
