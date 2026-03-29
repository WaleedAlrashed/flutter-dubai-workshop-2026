import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutInstructor extends StatelessWidget {
  const AboutInstructor({super.key});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AlertDialog(
      title: Row(
        children: [
          CircleAvatar(
            backgroundColor: theme.colorScheme.primaryContainer,
            child: Icon(
              Icons.person,
              color: theme.colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Text('About the Instructor'),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Waleed Mazen Alrashed',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _LinkTile(
            icon: Icons.language,
            label: 'Website',
            subtitle: 'waleedalrashed.com',
            onTap: () => _launchUrl('https://waleedalrashed.com'),
          ),
          _LinkTile(
            icon: Icons.work_outline,
            label: 'LinkedIn',
            subtitle: 'waleedalrashed',
            onTap: () =>
                _launchUrl('https://www.linkedin.com/in/waleedalrashed/'),
          ),
          _LinkTile(
            icon: Icons.code,
            label: 'GitHub',
            subtitle: 'WaleedAlrashed',
            onTap: () =>
                _launchUrl('https://github.com/WaleedAlrashed/'),
          ),
          _LinkTile(
            icon: Icons.chat_bubble_outline,
            label: 'X / Twitter',
            subtitle: '@waleedalrashedd',
            onTap: () =>
                _launchUrl('https://x.com/waleedalrashedd'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
      ],
    );
  }
}

class _LinkTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String subtitle;
  final VoidCallback onTap;

  const _LinkTile({
    required this.icon,
    required this.label,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, size: 20),
      title: Text(label),
      subtitle: Text(subtitle),
      onTap: onTap,
      trailing: const Icon(Icons.open_in_new, size: 16),
    );
  }
}
