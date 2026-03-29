import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void showInstructorDialog(BuildContext context) {
  final colorScheme = Theme.of(context).colorScheme;
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('About the Instructor'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: colorScheme.primaryContainer,
            child: Icon(Icons.person, size: 30, color: colorScheme.onPrimaryContainer),
          ),
          const SizedBox(height: 12),
          Text('Waleed Mazen Alrashed', style: Theme.of(ctx).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _link(Icons.language, 'waleedalrashed.com', 'https://waleedalrashed.com'),
          _link(Icons.work_outline, 'LinkedIn', 'https://www.linkedin.com/in/waleedalrashed/'),
          _link(Icons.code, 'GitHub', 'https://github.com/WaleedAlrashed/'),
          _link(Icons.alternate_email, 'X / Twitter', 'https://x.com/waleedalrashedd'),
        ],
      ),
      actions: [TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Close'))],
    ),
  );
}

Widget _link(IconData icon, String label, String url) {
  return ListTile(
    dense: true,
    leading: Icon(icon, size: 20),
    title: Text(label),
    trailing: const Icon(Icons.open_in_new, size: 16),
    onTap: () => launchUrl(Uri.parse(url)),
  );
}
