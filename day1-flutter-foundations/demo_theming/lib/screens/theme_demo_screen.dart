import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ThemeDemoScreen extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeToggle;

  const ThemeDemoScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeToggle,
  });

  @override
  State<ThemeDemoScreen> createState() => _ThemeDemoScreenState();
}

class _ThemeDemoScreenState extends State<ThemeDemoScreen> {
  int _navIndex = 0;
  bool _switchValue = true;
  bool _checkboxValue = true;
  bool _filterChipSelected = false;

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not open $url')),
        );
      }
    }
  }

  void _showAboutInstructor() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('About the Instructor'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Waleed Mazen Alrashed',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _linkTile(
              icon: Icons.language,
              label: 'waleedalrashed.com',
              url: 'https://waleedalrashed.com',
            ),
            _linkTile(
              icon: Icons.work_outline,
              label: 'LinkedIn',
              url: 'https://www.linkedin.com/in/waleedalrashed/',
            ),
            _linkTile(
              icon: Icons.code,
              label: 'GitHub',
              url: 'https://github.com/WaleedAlrashed/',
            ),
            _linkTile(
              icon: Icons.alternate_email,
              label: 'X / Twitter',
              url: 'https://x.com/waleedalrashedd',
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  Widget _linkTile({
    required IconData icon,
    required String label,
    required String url,
  }) {
    return InkWell(
      onTap: () => _launchUrl(url),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            Icon(icon, size: 20),
            const SizedBox(width: 12),
            Text(
              label,
              style: const TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Material 3 Theming'),
        backgroundColor: colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'About the Instructor',
            onPressed: _showAboutInstructor,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Theme Toggle ---
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Dark Mode',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Switch(
                      value: widget.isDarkMode,
                      onChanged: widget.onThemeToggle,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // --- Color Palette ---
            Text(
              'ColorScheme Palette',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _colorSwatch('primary', colorScheme.primary),
                  _colorSwatch('secondary', colorScheme.secondary),
                  _colorSwatch('tertiary', colorScheme.tertiary),
                  _colorSwatch('error', colorScheme.error),
                  _colorSwatch('surface', colorScheme.surface),
                  _colorSwatch('inversePrimary', colorScheme.inversePrimary),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // --- Buttons ---
            _sectionLabel('ElevatedButton'),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Elevated'),
            ),
            const SizedBox(height: 12),
            _sectionLabel('FilledButton'),
            FilledButton(
              onPressed: () {},
              child: const Text('Filled'),
            ),
            const SizedBox(height: 12),
            _sectionLabel('OutlinedButton'),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Outlined'),
            ),
            const SizedBox(height: 12),
            _sectionLabel('TextButton'),
            TextButton(
              onPressed: () {},
              child: const Text('Text'),
            ),
            const SizedBox(height: 24),

            // --- Card ---
            _sectionLabel('Card'),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Card Title',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'This is a Material 3 Card with some content inside it. '
                      'Notice how it responds to the current theme.',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // --- Chips ---
            _sectionLabel('Chip'),
            Wrap(
              spacing: 8,
              children: const [
                Chip(label: Text('Chip')),
                Chip(
                  avatar: Icon(Icons.person, size: 18),
                  label: Text('Avatar Chip'),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _sectionLabel('FilterChip'),
            FilterChip(
              label: const Text('Filter'),
              selected: _filterChipSelected,
              onSelected: (v) => setState(() => _filterChipSelected = v),
            ),
            const SizedBox(height: 24),

            // --- TextField ---
            _sectionLabel('TextField'),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Label',
                hintText: 'Type something...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.edit),
              ),
            ),
            const SizedBox(height: 24),

            // --- Switch & Checkbox ---
            _sectionLabel('Switch'),
            Switch(
              value: _switchValue,
              onChanged: (v) => setState(() => _switchValue = v),
            ),
            const SizedBox(height: 12),
            _sectionLabel('Checkbox'),
            Checkbox(
              value: _checkboxValue,
              onChanged: (v) => setState(() => _checkboxValue = v ?? false),
            ),
            const SizedBox(height: 80), // space for FAB
          ],
        ),
      ),

      // --- FloatingActionButton ---
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'FloatingActionButton',
        child: const Icon(Icons.add),
      ),

      // --- NavigationBar ---
      bottomNavigationBar: NavigationBar(
        selectedIndex: _navIndex,
        onDestinationSelected: (i) => setState(() => _navIndex = i),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.palette_outlined),
            selectedIcon: Icon(Icons.palette),
            label: 'Theme',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _sectionLabel(String name) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        name,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  Widget _colorSwatch(String label, Color color) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Column(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}
