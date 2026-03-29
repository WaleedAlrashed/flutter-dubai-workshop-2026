import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/hours_provider.dart';
import '../../../shared/widgets/stats_row.dart';
import '../../../core/widgets/empty_view.dart';

class MyHoursScreen extends ConsumerWidget {
  const MyHoursScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final entries = ref.watch(hoursProvider);
    final totalHours = ref.watch(totalHoursProvider);
    final approvedHours = ref.watch(approvedHoursProvider);
    final pendingHours = ref.watch(pendingHoursProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Hours'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.go('/hours/log'),
        icon: const Icon(Icons.add),
        label: const Text('Log Hours'),
      ),
      body: entries.isEmpty
          ? EmptyView(
              title: 'No hours logged yet',
              subtitle: 'Start volunteering and log your hours!',
              icon: Icons.timer_off_outlined,
              action: FilledButton.icon(
                onPressed: () => context.go('/hours/log'),
                icon: const Icon(Icons.add),
                label: const Text('Log Hours'),
              ),
            )
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                StatsRow(
                  stats: [
                    StatItem(
                      label: 'Total',
                      value: totalHours.toStringAsFixed(0),
                      icon: Icons.timer,
                    ),
                    StatItem(
                      label: 'Approved',
                      value: approvedHours.toStringAsFixed(0),
                      icon: Icons.check_circle,
                    ),
                    StatItem(
                      label: 'Pending',
                      value: pendingHours.toStringAsFixed(0),
                      icon: Icons.pending,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Activity Log',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                ...entries.reversed.map((entry) {
                  final isApproved = entry.status == 'approved';
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: isApproved
                            ? Colors.green.withValues(alpha: 0.1)
                            : Colors.orange.withValues(alpha: 0.1),
                        child: Icon(
                          isApproved ? Icons.check_circle : Icons.pending,
                          color: isApproved ? Colors.green : Colors.orange,
                        ),
                      ),
                      title: Text(
                        entry.opportunityTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        '${entry.date.day}/${entry.date.month}/${entry.date.year} - ${entry.notes}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: Text(
                        '${entry.hours.toStringAsFixed(0)}h',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 80), // FAB clearance
              ],
            ),
    );
  }
}
