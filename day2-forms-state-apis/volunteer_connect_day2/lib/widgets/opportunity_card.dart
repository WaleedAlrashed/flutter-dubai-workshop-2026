import 'package:flutter/material.dart';
import '../models/opportunity.dart';

class OpportunityCard extends StatelessWidget {
  final Opportunity opportunity;
  final VoidCallback? onTap;

  const OpportunityCard({super.key, required this.opportunity, this.onTap});

  Color _categoryColor(String category) {
    return switch (category) {
      'Environmental' => const Color(0xFF009688),
      'Community' => const Color(0xFFC0392B),
      'Education' => const Color(0xFF3498DB),
      'Sports' => const Color(0xFFF5A623),
      'Healthcare' => const Color(0xFF8E44AD),
      _ => Colors.grey,
    };
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      opportunity.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Chip(
                    label: Text(opportunity.category, style: const TextStyle(fontSize: 11, color: Colors.white)),
                    backgroundColor: _categoryColor(opportunity.category),
                    padding: EdgeInsets.zero,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(opportunity.description, maxLines: 2, overflow: TextOverflow.ellipsis),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.location_on, size: 16, color: colorScheme.outline),
                  const SizedBox(width: 4),
                  Text(opportunity.location, style: TextStyle(fontSize: 12, color: colorScheme.outline)),
                  const Spacer(),
                  Icon(Icons.schedule, size: 16, color: colorScheme.outline),
                  const SizedBox(width: 4),
                  Text('${opportunity.hoursWorth}h', style: TextStyle(fontSize: 12, color: colorScheme.outline)),
                  const SizedBox(width: 12),
                  Icon(Icons.people, size: 16, color: colorScheme.primary),
                  const SizedBox(width: 4),
                  Text('${opportunity.spotsLeft} spots', style: TextStyle(fontSize: 12, color: colorScheme.primary, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
