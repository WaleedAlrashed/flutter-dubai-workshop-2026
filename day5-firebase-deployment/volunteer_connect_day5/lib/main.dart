import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/log_hours_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/chat_screen.dart';
import 'screens/settings_screen.dart';
import 'providers/auth_provider.dart';
import 'providers/settings_provider.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: VolunteerConnectApp()));
}

class VolunteerConnectApp extends ConsumerWidget {
  const VolunteerConnectApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final settings = ref.watch(settingsProvider);

    return MaterialApp(
      title: 'Dubai Volunteer Connect',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: settings.themeMode,
      home: authState.isLoggedIn ? const HomeScreen() : const LoginScreen(),
      routes: {
        '/login': (_) => const LoginScreen(),
        '/register': (_) => const RegisterScreen(),
        '/home': (_) => const HomeScreen(),
        '/log-hours': (_) => const LogHoursScreen(),
        '/profile': (_) => const ProfileScreen(),
        '/chat': (_) => const ChatScreen(),
        '/settings': (_) => const SettingsScreen(),
      },
    );
  }
}
