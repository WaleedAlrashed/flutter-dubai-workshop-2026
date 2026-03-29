import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const DubaiProfileCardApp());
}

class DubaiProfileCardApp extends StatefulWidget {
  const DubaiProfileCardApp({super.key});

  @override
  State<DubaiProfileCardApp> createState() => _DubaiProfileCardAppState();
}

class _DubaiProfileCardAppState extends State<DubaiProfileCardApp> {
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dubai Profile Card',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: ProfileScreen(
        onToggleTheme: _toggleTheme,
        isDarkMode: _isDarkMode,
      ),
    );
  }
}
