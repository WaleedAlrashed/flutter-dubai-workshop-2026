import 'package:flutter/material.dart';

class StatsRow extends StatelessWidget {
  final int totalHours;
  final int eventsAttended;
  final String rank;

  const StatsRow({super.key, required this.totalHours, required this.eventsAttended, required this.rank});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _StatItem(icon: Icons.schedule, value: '$totalHours', label: 'Hours', color: colorScheme.primary),
        _StatItem(icon: Icons.event, value: '$eventsAttended', label: 'Events', color: const Color(0xFF009688)),
        _StatItem(icon: Icons.emoji_events, value: rank, label: 'Rank', color: const Color(0xFFF5A623)),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const _StatItem({required this.icon, required this.value, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: color.withValues(alpha: 0.1), shape: BoxShape.circle),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(height: 8),
        Text(value, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
        Text(label, style: TextStyle(color: Theme.of(context).colorScheme.outline, fontSize: 12)),
      ],
    );
  }
}
