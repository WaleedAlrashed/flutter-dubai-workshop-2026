import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';
import '../providers/hours_provider.dart';
import '../widgets/animated_stat_card.dart';
import '../widgets/rank_badge.dart';
import '../widgets/about_instructor.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final volunteer = authState.volunteer;
    final hours = ref.watch(hoursProvider);
    final colorScheme = Theme.of(context).colorScheme;

    if (volunteer == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Profile')),
        body: const Center(child: Text('Not logged in')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: colorScheme.inversePrimary,
        actions: [
          IconButton(icon: const Icon(Icons.settings), onPressed: () => Navigator.pushNamed(context, '/settings')),
          IconButton(icon: const Icon(Icons.info_outline), onPressed: () => showInstructorDialog(context)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: const Color(0xFFF5A623),
                  child: CircleAvatar(
                    radius: 46,
                    backgroundColor: colorScheme.primaryContainer,
                    child: Text(
                      volunteer.name.substring(0, 1),
                      style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: colorScheme.onPrimaryContainer),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(volunteer.name, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
                Text(volunteer.email, style: TextStyle(color: colorScheme.outline)),
                if (volunteer.phone.isNotEmpty) Text(volunteer.phone, style: TextStyle(color: colorScheme.outline)),
                const SizedBox(height: 8),
                RankBadge(rank: volunteer.rank),
                const SizedBox(height: 8),
                Chip(label: Text(volunteer.nationality), avatar: const Icon(Icons.flag, size: 16)),
                const SizedBox(height: 24),
                // Animated stat cards
                Row(
                  children: [
                    Expanded(child: AnimatedStatCard(icon: Icons.schedule, label: 'Hours', value: volunteer.totalHours, color: colorScheme.primary)),
                    const SizedBox(width: 8),
                    Expanded(child: AnimatedStatCard(icon: Icons.event, label: 'Events', value: volunteer.eventsAttended, color: colorScheme.secondary)),
                  ],
                ),
                const SizedBox(height: 24),
                if (volunteer.skills.isNotEmpty) ...[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Skills', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 8),
                  Wrap(spacing: 8, runSpacing: 4, children: volunteer.skills.map((s) => Chip(label: Text(s))).toList()),
                ],
                const SizedBox(height: 24),
                if (hours.isNotEmpty) ...[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Recent Activity', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 8),
                  ...hours.reversed.take(5).map((entry) => Card(
                        child: ListTile(
                          leading: Icon(Icons.schedule, color: colorScheme.primary),
                          title: Text(entry.opportunityTitle),
                          subtitle: Text('${entry.hours}h - ${entry.date.day}/${entry.date.month}/${entry.date.year}'),
                          trailing: entry.notes.isNotEmpty ? const Icon(Icons.notes, size: 16) : null,
                        ),
                      )),
                ],
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      ref.read(authProvider.notifier).logout();
                      Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false);
                    },
                    icon: const Icon(Icons.logout),
                    label: const Text('Sign Out'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
