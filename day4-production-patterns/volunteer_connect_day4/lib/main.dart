import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/log_hours_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/chat_screen.dart';
import 'providers/auth_provider.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: VolunteerConnectApp()));
}

class VolunteerConnectApp extends ConsumerStatefulWidget {
  const VolunteerConnectApp({super.key});

  @override
  ConsumerState<VolunteerConnectApp> createState() =>
      _VolunteerConnectAppState();
}

class _VolunteerConnectAppState extends ConsumerState<VolunteerConnectApp> {
  bool _isDark = false;

  void _toggleTheme() => setState(() => _isDark = !_isDark);

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    return MaterialApp(
      title: 'Dubai Volunteer Connect',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
      home: authState.isLoggedIn
          ? HomeScreen(onToggleTheme: _toggleTheme, isDark: _isDark)
          : LoginScreen(onToggleTheme: _toggleTheme, isDark: _isDark),
      routes: {
        '/login': (_) =>
            LoginScreen(onToggleTheme: _toggleTheme, isDark: _isDark),
        '/register': (_) =>
            RegisterScreen(onToggleTheme: _toggleTheme, isDark: _isDark),
        '/home': (_) =>
            HomeScreen(onToggleTheme: _toggleTheme, isDark: _isDark),
        '/log-hours': (_) =>
            LogHoursScreen(onToggleTheme: _toggleTheme, isDark: _isDark),
        '/profile': (_) =>
            ProfileScreen(onToggleTheme: _toggleTheme, isDark: _isDark),
        '/chat': (_) =>
            ChatScreen(onToggleTheme: _toggleTheme, isDark: _isDark),
      },
    );
  }
}
