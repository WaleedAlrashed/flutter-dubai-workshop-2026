import 'package:flutter/material.dart';

/// A StatefulWidget that manages its own counter state.
///
/// Unlike a StatelessWidget, this widget creates a companion State object
/// that persists across rebuilds. When the parent triggers a rebuild, the
/// State object (and its fields like [_counter]) survive.
class StatefulCounter extends StatefulWidget {
  const StatefulCounter({super.key});

  /// Flutter calls createState() to create the mutable State object.
  /// This State object is what actually holds the data and builds the UI.
  @override
  State<StatefulCounter> createState() => _StatefulCounterState();
}

class _StatefulCounterState extends State<StatefulCounter> {
  /// This is the counter value -- it lives inside the State object,
  /// so it survives parent rebuilds.
  int _counter = 0;

  /// Tracks how many times build() has been called, to demonstrate
  /// that rebuilds happen but state is preserved.
  int _buildCount = 0;

  @override
  Widget build(BuildContext context) {
    // Increment build count each time build() is called.
    _buildCount++;

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
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'StatefulWidget',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onPrimaryContainer,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // -- Explanation --
            Text(
              'This widget manages its own state using a State object. '
              'Calling setState() tells Flutter to re-run build(), updating '
              'the UI to reflect the new state.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 20),

            // -- Counter display --
            Center(
              child: Column(
                children: [
                  Text(
                    'Counter',
                    style: theme.textTheme.labelLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$_counter',
                    style: theme.textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // -- Increment / Decrement buttons --
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton.tonalIcon(
                  onPressed: () {
                    // setState() does two things:
                    // 1. Executes the callback, which updates _counter.
                    // 2. Schedules a rebuild so build() runs again with the new value.
                    setState(() {
                      _counter--;
                    });
                  },
                  icon: const Icon(Icons.remove),
                  label: const Text('Decrement'),
                ),
                const SizedBox(width: 12),
                FilledButton.icon(
                  onPressed: () {
                    // Without setState(), changing _counter would have no
                    // visible effect -- Flutter would not know to rebuild.
                    setState(() {
                      _counter++;
                    });
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Increment'),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // -- Build count --
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
                    'build() called',
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: colorScheme.onTertiaryContainer,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$_buildCount times',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onTertiaryContainer,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'State persists across rebuilds!\n'
                    'Counter keeps its value.',
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
}
