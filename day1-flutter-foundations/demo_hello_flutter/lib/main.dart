import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Every Flutter app starts with runApp(), which takes a Widget and makes it
// the root of the widget tree.
void main() => runApp(const HelloFlutterApp());

// --- Root Widget ---
// MaterialApp is the top-level widget that provides Material Design defaults,
// theming, navigation, and more.
class HelloFlutterApp extends StatelessWidget {
  const HelloFlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hello Flutter Dubai',
      // Material 3 theme with a Dubai-inspired red seed color.
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFC0392B)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

// --- Home Page Widget ---
// The Widget Tree: each Widget you write creates an Element (manages lifecycle)
// and a RenderObject (handles layout & painting) behind the scenes.
// Widget -> Element -> RenderObject
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Scaffold provides the basic Material Design visual layout:
    // AppBar at the top, body in the center, FAB, drawers, etc.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello Flutter Dubai!'),
        backgroundColor: theme.colorScheme.inversePrimary,
        actions: [
          // IconButton in the AppBar to show instructor info.
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'About the Instructor',
            onPressed: () => _showAboutDialog(context),
          ),
        ],
      ),
      // Body: a Column arranges children vertically.
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon widget - renders a Material icon.
            Icon(Icons.flutter_dash, size: 80, color: theme.colorScheme.primary),
            const SizedBox(height: 16),
            // Text widget - displays a string with styling.
            Text('Welcome to Flutter!', style: theme.textTheme.headlineMedium),
            const SizedBox(height: 8),
            Text('Dubai Workshop - Day 1', style: theme.textTheme.titleMedium),
            const SizedBox(height: 24),
            // Card widget - a Material Design card with elevation & rounded corners.
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Everything in Flutter is a Widget.\n'
                  'Widgets form a tree. Each widget creates\n'
                  'an Element and a RenderObject.',
                  style: theme.textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Shows a dialog with instructor information and clickable links.
  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('About the Instructor'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Waleed Mazen Alrashed',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 12),
            _link(Icons.language, 'waleedalrashed.com',
                'https://waleedalrashed.com'),
            _link(Icons.work_outline, 'LinkedIn',
                'https://www.linkedin.com/in/waleedalrashed/'),
            _link(Icons.code, 'GitHub',
                'https://github.com/WaleedAlrashed/'),
            _link(Icons.alternate_email, 'X / Twitter',
                'https://x.com/waleedalrashedd'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  Widget _link(IconData icon, String label, String url) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            Icon(icon, size: 20),
            const SizedBox(width: 8),
            Text(label, style: const TextStyle(decoration: TextDecoration.underline)),
          ],
        ),
      ),
    );
  }
}
