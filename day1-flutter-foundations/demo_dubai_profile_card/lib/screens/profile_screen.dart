import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../theme/app_theme.dart';
import '../widgets/action_buttons.dart';
import '../widgets/profile_avatar.dart';
import '../widgets/profile_info.dart';
import '../widgets/stats_row.dart';
import 'about_instructor_screen.dart';

class ProfileScreen extends StatelessWidget {
  final VoidCallback onToggleTheme;
  final bool isDarkMode;

  const ProfileScreen({
    super.key,
    required this.onToggleTheme,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    const profile = Profile.sample;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.location_city,
              color: AppTheme.dubaiGold,
              size: 22,
            ),
            const SizedBox(width: 8),
            const Text('Dubai Profile Card'),
          ],
        ),
        centerTitle: true,
        backgroundColor: colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'About Instructor',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const AboutInstructorScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            tooltip: 'Toggle theme',
            onPressed: onToggleTheme,
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Card(
              elevation: 6,
              shadowColor: AppTheme.dubaiRed.withValues(alpha: 0.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 36,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ProfileAvatar(imageUrl: profile.avatarUrl),
                    const SizedBox(height: 24),
                    ProfileInfo(
                      name: profile.name,
                      emiratesId: profile.emiratesId,
                      title: profile.title,
                    ),
                    const SizedBox(height: 28),
                    Divider(
                      color: colorScheme.outlineVariant.withValues(alpha: 0.5),
                    ),
                    const SizedBox(height: 20),
                    StatsRow(
                      volunteerHours: profile.volunteerHours,
                      eventsAttended: profile.eventsAttended,
                      points: profile.points,
                    ),
                    const SizedBox(height: 28),
                    const ActionButtons(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
