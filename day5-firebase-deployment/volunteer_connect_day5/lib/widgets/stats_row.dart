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
        _stat(context, '$totalHours', 'Hours', Icons.schedule, colorScheme.primary),
        _stat(context, '$eventsAttended', 'Events', Icons.event, colorScheme.secondary),
        _stat(context, rank, 'Rank', Icons.military_tech, colorScheme.tertiary),
      ],
    );
  }

  Widget _stat(BuildContext context, String value, String label, IconData icon, Color color) {
    return Column(
      children: [
        Icon(icon, color: color, size: 28),
        const SizedBox(height: 4),
        Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
        Text(label, style: TextStyle(color: Theme.of(context).colorScheme.outline, fontSize: 12)),
      ],
    );
  }
}
