import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void showInstructorDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('About the Instructor'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircleAvatar(radius: 36, child: Text('WA', style: TextStyle(fontSize: 24))),
          const SizedBox(height: 12),
          const Text('Waleed Mazen Alrashed', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _link(Icons.language, 'waleedalrashed.com', 'https://waleedalrashed.com'),
          _link(Icons.work, 'LinkedIn', 'https://www.linkedin.com/in/waleedalrashed/'),
          _link(Icons.code, 'GitHub', 'https://github.com/WaleedAlrashed/'),
          _link(Icons.alternate_email, 'X / Twitter', 'https://x.com/waleedalrashedd'),
        ],
      ),
      actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close'))],
    ),
  );
}

Widget _link(IconData icon, String label, String url) {
  return ListTile(
    dense: true,
    leading: Icon(icon, size: 20),
    title: Text(label),
    onTap: () => launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication),
  );
}
