import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/opportunities_provider.dart';
import '../../../core/widgets/error_view.dart';

class OpportunityDetailScreen extends ConsumerWidget {
  final String opportunityId;

  const OpportunityDetailScreen({
    super.key,
    required this.opportunityId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final opportunity = ref.watch(opportunityByIdProvider(opportunityId));

    if (opportunity == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Not Found')),
        body: ErrorView(
          message: 'Opportunity not found',
          onRetry: () => context.go('/opportunities'),
        ),
      );
    }

    final spotsPercentage =
        opportunity.spotsAvailable / opportunity.spotsTotal;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(32),
              color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
              child: Column(
                children: [
                  Icon(
                    Icons.volunteer_activism,
                    size: 64,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    opportunity.title,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    opportunity.organization,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Info chips
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      Chip(
                        avatar: const Icon(Icons.category, size: 18),
                        label: Text(opportunity.category),
                      ),
                      Chip(
                        avatar: const Icon(Icons.access_time, size: 18),
                        label: Text('${opportunity.hoursRequired} hours'),
                      ),
                      Chip(
                        avatar: const Icon(Icons.location_on, size: 18),
                        label: Text(opportunity.location),
                      ),
                      Chip(
                        avatar: const Icon(Icons.calendar_today, size: 18),
                        label: Text(
                          '${opportunity.date.day}/${opportunity.date.month}/${opportunity.date.year}',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Spots availability
                  Text(
                    'Availability',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: LinearProgressIndicator(
                            value: spotsPercentage,
                            minHeight: 8,
                            backgroundColor:
                                theme.colorScheme.surfaceContainerHighest,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        '${opportunity.spotsAvailable}/${opportunity.spotsTotal}',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '${opportunity.spotsAvailable} spots remaining',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Description
                  Text(
                    'About this Opportunity',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    opportunity.description,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Sign up button
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Signed up for "${opportunity.title}"!',
                            ),
                            behavior: SnackBarBehavior.floating,
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {},
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.check_circle_outline),
                      label: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text('Sign Up to Volunteer'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
