import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/stateful_counter.dart';
import '../widgets/stateless_info.dart';

/// The main screen that places the StatelessWidget and StatefulWidget
/// side by side (or stacked on narrow screens) for comparison.
class ComparisonScreen extends StatefulWidget {
  const ComparisonScreen({super.key});

  @override
  State<ComparisonScreen> createState() => _ComparisonScreenState();
}

class _ComparisonScreenState extends State<ComparisonScreen> {
  /// Every time the "Trigger Parent Rebuild" button is pressed, this counter
  /// increments and the parent rebuilds. The StatelessWidget receives the new
  /// value as a parameter, while the StatefulWidget preserves its own state.
  int _parentRebuildCount = 0;

  void _triggerRebuild() {
    setState(() {
      _parentRebuildCount++;
    });
  }

  void _showAboutDialog(BuildContext context) {
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
      onTap: () => launchUrl(Uri.parse(url)),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            Icon(icon, size: 20),
            const SizedBox(width: 12),
            Text(label),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        title: const Text('StatelessWidget vs StatefulWidget'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'About the Instructor',
            onPressed: () => _showAboutDialog(context),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 700;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // -- Trigger parent rebuild button --
                FilledButton.icon(
                  onPressed: _triggerRebuild,
                  icon: const Icon(Icons.refresh),
                  label: Text(
                    'Trigger Parent Rebuild ($_parentRebuildCount)',
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Press this to rebuild the parent. Watch how the '
                  'StatelessWidget re-renders with the new count, while '
                  'the StatefulWidget keeps its own counter value.',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 20),

                // -- Side-by-side or stacked comparison --
                if (isWide)
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: StatelessInfo(
                            parentRebuildCount: _parentRebuildCount,
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Expanded(
                          child: StatefulCounter(),
                        ),
                      ],
                    ),
                  )
                else
                  Column(
                    children: [
                      StatelessInfo(
                        parentRebuildCount: _parentRebuildCount,
                      ),
                      const SizedBox(height: 16),
                      const StatefulCounter(),
                    ],
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
