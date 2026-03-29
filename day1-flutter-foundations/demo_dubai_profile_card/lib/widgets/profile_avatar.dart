import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;

  const ProfileAvatar({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 130,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.dubaiGold,
            Color(0xFFE8931A),
            AppTheme.dubaiRed,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x40F5A623),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      padding: const EdgeInsets.all(4),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Theme.of(context).colorScheme.surface,
            width: 3,
          ),
        ),
        child: CircleAvatar(
          radius: 56,
          backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
          backgroundImage: NetworkImage(imageUrl),
          child: const Icon(Icons.person, size: 56),
        ),
      ),
    );
  }
}
