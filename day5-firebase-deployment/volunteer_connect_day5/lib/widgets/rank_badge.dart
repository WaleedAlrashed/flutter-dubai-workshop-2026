import 'package:flutter/material.dart';

class RankBadge extends StatelessWidget {
  final String rank;
  const RankBadge({super.key, required this.rank});

  Color get _color => switch (rank) {
        'Platinum' => const Color(0xFFE5E4E2),
        'Gold' => const Color(0xFFFFD700),
        'Silver' => const Color(0xFFC0C0C0),
        'Bronze' => const Color(0xFFCD7F32),
        _ => Colors.grey,
      };

  IconData get _icon => switch (rank) {
        'Platinum' => Icons.diamond,
        'Gold' => Icons.emoji_events,
        'Silver' => Icons.military_tech,
        'Bronze' => Icons.workspace_premium,
        _ => Icons.stars,
      };

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 800),
      curve: Curves.elasticOut,
      builder: (context, value, child) => Transform.scale(
        scale: value,
        child: child,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [_color.withValues(alpha: 0.3), _color.withValues(alpha: 0.7)],
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: _color, width: 2),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(_icon, color: _color, size: 20),
            const SizedBox(width: 6),
            Text(rank, style: TextStyle(fontWeight: FontWeight.bold, color: _color, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
