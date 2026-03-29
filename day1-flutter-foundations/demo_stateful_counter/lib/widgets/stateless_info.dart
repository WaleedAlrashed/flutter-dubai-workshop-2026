import 'package:flutter/material.dart';

/// A StatelessWidget that displays static information about Dubai.
///
/// This widget does NOT manage any state of its own. It receives all data
/// from its parent via constructor parameters. Every time the parent rebuilds,
/// this widget rebuilds too -- but it has no way to trigger a rebuild itself.
class StatelessInfo extends StatelessWidget {
  /// The rebuild counter is passed in from the parent to demonstrate that
  /// a StatelessWidget cannot manage its own state -- it simply displays
  /// whatever data is handed to it.
  final int parentRebuildCount;

  const StatelessInfo({super.key, required this.parentRebuildCount});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -- Label --
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'StatelessWidget',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSecondaryContainer,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // -- Explanation --
            Text(
              'This widget cannot manage its own state. It receives data '
              'from its parent and simply displays it. It has no setState() '
              'method.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 20),

            // -- Static Dubai info --
            _infoRow(context, Icons.location_city, 'City', 'Dubai'),
            const SizedBox(height: 8),
            _infoRow(context, Icons.people, 'Population', '~3.6 million'),
            const SizedBox(height: 8),
            _infoRow(context, Icons.square_foot, 'Area', '4,114 km\u00B2'),
            const SizedBox(height: 20),

            // -- Rebuild counter --
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colorScheme.tertiaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    'Parent rebuild count',
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: colorScheme.onTertiaryContainer,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$parentRebuildCount',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onTertiaryContainer,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'This value comes from the parent.\n'
                    'I cannot change it myself!',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontStyle: FontStyle.italic,
                      color: colorScheme.onTertiaryContainer,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(
    BuildContext context,
    IconData icon,
    String label,
    String value,
  ) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(icon, size: 20, color: theme.colorScheme.primary),
        const SizedBox(width: 8),
        Text('$label: ', style: const TextStyle(fontWeight: FontWeight.w600)),
        Flexible(child: Text(value)),
      ],
    );
  }
}
