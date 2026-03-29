import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/settings_provider.dart';
import '../providers/auth_provider.dart';
import '../widgets/about_instructor.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: colorScheme.inversePrimary,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 8),
          _SectionHeader('Appearance'),
          ListTile(
            leading: const Icon(Icons.palette),
            title: const Text('Theme'),
            subtitle: Text(_themeName(settings.themeMode)),
            trailing: SegmentedButton<ThemeMode>(
              segments: const [
                ButtonSegment(value: ThemeMode.light, icon: Icon(Icons.light_mode)),
                ButtonSegment(value: ThemeMode.system, icon: Icon(Icons.brightness_auto)),
                ButtonSegment(value: ThemeMode.dark, icon: Icon(Icons.dark_mode)),
              ],
              selected: {settings.themeMode},
              onSelectionChanged: (modes) => ref.read(settingsProvider.notifier).setThemeMode(modes.first),
            ),
          ),
          const Divider(),
          _SectionHeader('Language'),
          RadioGroup<String>(
            groupValue: settings.locale,
            onChanged: (v) { if (v != null) ref.read(settingsProvider.notifier).setLocale(v); },
            child: Column(
              children: [
                RadioListTile<String>(
                  title: const Text('English'),
                  value: 'en',
                ),
                RadioListTile<String>(
                  title: const Text('العربية (Arabic)'),
                  value: 'ar',
                ),
              ],
            ),
          ),
          const Divider(),
          _SectionHeader('Notifications'),
          SwitchListTile(
            title: const Text('Push Notifications'),
            subtitle: const Text('Receive updates about new opportunities'),
            value: settings.notificationsEnabled,
            onChanged: (v) => ref.read(settingsProvider.notifier).setNotificationsEnabled(v),
          ),
          const Divider(),
          _SectionHeader('About'),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About the Instructor'),
            onTap: () => showInstructorDialog(context),
          ),
          ListTile(
            leading: const Icon(Icons.code),
            title: const Text('App Version'),
            subtitle: const Text('1.0.0 - Day 5 Workshop Build'),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: OutlinedButton.icon(
              onPressed: () {
                ref.read(authProvider.notifier).logout();
                Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false);
              },
              icon: const Icon(Icons.logout),
              label: const Text('Sign Out'),
              style: OutlinedButton.styleFrom(foregroundColor: colorScheme.error),
            ),
          ),
        ],
      ),
    );
  }

  String _themeName(ThemeMode mode) => switch (mode) {
        ThemeMode.light => 'Light',
        ThemeMode.dark => 'Dark',
        ThemeMode.system => 'System',
      };
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
      child: Text(title, style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.primary,
      )),
    );
  }
}
