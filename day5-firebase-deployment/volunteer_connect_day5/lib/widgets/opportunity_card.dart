import 'package:flutter/material.dart';
import '../models/opportunity.dart';

class OpportunityCard extends StatelessWidget {
  final Opportunity opportunity;
  final VoidCallback onTap;
  const OpportunityCard({super.key, required this.opportunity, required this.onTap});

  Color _categoryColor(String category) {
    return switch (category) {
      'Environment' => Colors.green,
      'Community' => Colors.blue,
      'Education' => Colors.orange,
      'Healthcare' => Colors.red,
      'Sports' => Colors.purple,
      'Culture' => Colors.teal,
      'Animals' => Colors.brown,
      _ => Colors.grey,
    };
  }

  @override
  Widget build(BuildContext context) {
    final color = _categoryColor(opportunity.category);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: ListTile(
        leading: CircleAvatar(backgroundColor: color.withValues(alpha: 0.15), child: Icon(Icons.volunteer_activism, color: color)),
        title: Text(opportunity.title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(opportunity.description, maxLines: 2, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 4),
            Row(
              children: [
                Chip(label: Text(opportunity.category, style: TextStyle(fontSize: 11, color: color)), padding: EdgeInsets.zero, visualDensity: VisualDensity.compact),
                const SizedBox(width: 8),
                Icon(Icons.location_on, size: 14, color: Theme.of(context).colorScheme.outline),
                const SizedBox(width: 2),
                Flexible(child: Text(opportunity.location, style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.outline), overflow: TextOverflow.ellipsis)),
              ],
            ),
          ],
        ),
        trailing: FilledButton.tonal(onPressed: onTap, child: const Text('Join')),
        isThreeLine: true,
      ),
    );
  }
}
