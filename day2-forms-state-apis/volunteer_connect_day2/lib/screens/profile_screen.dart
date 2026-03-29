import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';
import '../providers/hours_provider.dart';
import '../widgets/stats_row.dart';
import '../widgets/about_instructor.dart';

class ProfileScreen extends ConsumerWidget {
  final VoidCallback onToggleTheme;
  final bool isDark;
  const ProfileScreen({super.key, required this.onToggleTheme, required this.isDark});

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
          IconButton(icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode), onPressed: onToggleTheme),
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
                Chip(label: Text(volunteer.nationality), avatar: const Icon(Icons.flag, size: 16)),
                const SizedBox(height: 24),
                StatsRow(totalHours: volunteer.totalHours, eventsAttended: volunteer.eventsAttended, rank: volunteer.rank),
                const SizedBox(height: 24),
                if (volunteer.skills.isNotEmpty) ...[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Skills', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: volunteer.skills.map((s) => Chip(label: Text(s))).toList(),
                  ),
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
