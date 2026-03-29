import 'package:flutter/material.dart';

class GeneratedProfileCard extends StatelessWidget {
  final Map<String, dynamic> profileData;

  const GeneratedProfileCard({super.key, required this.profileData});

  @override
  Widget build(BuildContext context) {
    final name = profileData['name'] as String? ?? 'Unknown';
    final title = profileData['title'] as String? ?? '';
    final bio = profileData['bio'] as String? ?? '';
    final volunteerHours = (profileData['volunteerHours'] ?? 0).toString();
    final eventsAttended = (profileData['eventsAttended'] ?? 0).toString();
    final points = (profileData['points'] ?? 0).toString();
    final interests = (profileData['interests'] as List<dynamic>?)
            ?.map((e) => e.toString())
            .toList() ??
        [];

    const dubaiRed = Color(0xFFC0392B);
    const dubaiGold = Color(0xFFD4A843);
    const dubaiTeal = Color(0xFF1ABC9C);

    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header with gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [dubaiRed, Color(0xFF922B21)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 36,
                  backgroundColor: Colors.white.withValues(alpha: 0.2),
                  child: Text(
                    name.isNotEmpty ? name[0].toUpperCase() : '?',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: dubaiGold.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: dubaiGold, width: 1),
                  ),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      color: dubaiGold,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),

          // Bio section
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.format_quote, color: dubaiRed.withValues(alpha: 0.5), size: 20),
                    const SizedBox(width: 6),
                    Text(
                      'Bio',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[600],
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  bio,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[800],
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),

          const Divider(indent: 20, endIndent: 20),

          // Stats row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _StatItem(
                  icon: Icons.volunteer_activism,
                  value: volunteerHours,
                  label: 'Volunteer Hrs',
                  color: dubaiRed,
                ),
                _StatItem(
                  icon: Icons.event,
                  value: eventsAttended,
                  label: 'Events',
                  color: dubaiTeal,
                ),
                _StatItem(
                  icon: Icons.stars,
                  value: points,
                  label: 'Points',
                  color: dubaiGold,
                ),
              ],
            ),
          ),

          const Divider(indent: 20, endIndent: 20),

          // Interests
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.interests, color: dubaiTeal.withValues(alpha: 0.7), size: 20),
                    const SizedBox(width: 6),
                    Text(
                      'Interests',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[600],
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: interests.map((interest) {
                    return Chip(
                      label: Text(
                        interest,
                        style: const TextStyle(fontSize: 13),
                      ),
                      backgroundColor: dubaiTeal.withValues(alpha: 0.1),
                      side: BorderSide(
                        color: dubaiTeal.withValues(alpha: 0.3),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),

          // Footer
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              border: Border(
                top: BorderSide(color: Colors.grey[200]!),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.auto_awesome, size: 14, color: dubaiGold),
                const SizedBox(width: 6),
                Text(
                  'Generated by Gemini AI',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[500],
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const _StatItem({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color, size: 28),
        const SizedBox(height: 6),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
