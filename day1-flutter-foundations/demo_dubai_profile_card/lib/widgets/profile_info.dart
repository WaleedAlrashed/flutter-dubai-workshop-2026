import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ProfileInfo extends StatelessWidget {
  final String name;
  final String emiratesId;
  final String title;

  const ProfileInfo({
    super.key,
    required this.name,
    required this.emiratesId,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Text(
          name,
          style: textTheme.headlineLarge?.copyWith(
            color: colorScheme.onSurface,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
          decoration: BoxDecoration(
            color: AppTheme.dubaiGold.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppTheme.dubaiGold.withValues(alpha: 0.4),
            ),
          ),
          child: Text(
            title,
            style: textTheme.titleMedium?.copyWith(
              color: AppTheme.dubaiGold,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.badge_outlined,
              size: 16,
              color: colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: 6),
            Text(
              'Emirates ID: $emiratesId',
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
                letterSpacing: 1.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
