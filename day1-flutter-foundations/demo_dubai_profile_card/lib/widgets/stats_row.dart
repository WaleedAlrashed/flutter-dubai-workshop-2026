import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class StatsRow extends StatelessWidget {
  final int volunteerHours;
  final int eventsAttended;
  final int points;

  const StatsRow({
    super.key,
    required this.volunteerHours,
    required this.eventsAttended,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _StatCard(
          icon: Icons.volunteer_activism,
          value: volunteerHours.toString(),
          label: 'Volunteer Hrs',
          color: AppTheme.dubaiRed,
        ),
        _StatCard(
          icon: Icons.event,
          value: eventsAttended.toString(),
          label: 'Events',
          color: AppTheme.dubaiGold,
        ),
        _StatCard(
          icon: Icons.stars_rounded,
          value: points.toString(),
          label: 'Points',
          color: const Color(0xFF2ECC71),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: 105,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withValues(alpha: 0.25),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w500,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
