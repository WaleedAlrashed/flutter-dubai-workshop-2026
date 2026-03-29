import 'package:flutter/material.dart';

class AnimatedStatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final int value;
  final Color color;

  const AnimatedStatCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            TweenAnimationBuilder<int>(
              tween: IntTween(begin: 0, end: value),
              duration: const Duration(milliseconds: 1200),
              curve: Curves.easeOutCubic,
              builder: (context, val, _) => Text(
                '$val',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: color),
              ),
            ),
            const SizedBox(height: 4),
            Text(label, style: TextStyle(color: Theme.of(context).colorScheme.outline, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
