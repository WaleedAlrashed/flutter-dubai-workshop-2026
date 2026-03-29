import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Dubai-themed colors used throughout the demo.
const _dubaiRed = Color(0xFFC0392B);
const _dubaiGold = Color(0xFFF5A623);
const _dubaiTeal = Color(0xFF009688);

class LayoutShowcaseScreen extends StatelessWidget {
  const LayoutShowcaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout Widgets'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'About the Instructor',
            onPressed: () => _showAboutInstructor(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Container'),
            _buildContainerDemo(),
            const SizedBox(height: 24),
            _buildSectionTitle('Column'),
            _buildColumnDemo(),
            const SizedBox(height: 24),
            _buildSectionTitle('Row'),
            _buildRowDemo(),
            const SizedBox(height: 24),
            _buildSectionTitle('Stack'),
            _buildStackDemo(),
            const SizedBox(height: 24),
            _buildSectionTitle('Expanded & Flexible'),
            _buildExpandedFlexibleDemo(),
            const SizedBox(height: 24),
            _buildSectionTitle('Wrap'),
            _buildWrapDemo(),
            const SizedBox(height: 24),
            _buildSectionTitle('Card'),
            _buildCardDemo(),
            const SizedBox(height: 24),
            _buildSectionTitle('SizedBox'),
            _buildSizedBoxDemo(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Section title
  // ---------------------------------------------------------------------------

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: _dubaiRed,
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Container
  // ---------------------------------------------------------------------------

  Widget _buildContainerDemo() {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: _dubaiTeal.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _dubaiGold, width: 2),
      ),
      child: const Text(
        'A Container with padding, margin, and a Dubai gold border.',
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Column
  // ---------------------------------------------------------------------------

  Widget _buildColumnDemo() {
    return Column(
      children: [
        _colorBox(_dubaiRed, 'Red'),
        const SizedBox(height: 8),
        _colorBox(_dubaiGold, 'Gold'),
        const SizedBox(height: 8),
        _colorBox(_dubaiTeal, 'Teal'),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // Row
  // ---------------------------------------------------------------------------

  Widget _buildRowDemo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('MainAxisAlignment.spaceEvenly',
            style: TextStyle(fontStyle: FontStyle.italic)),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _colorBox(_dubaiRed, 'R', size: 50),
            _colorBox(_dubaiGold, 'G', size: 50),
            _colorBox(_dubaiTeal, 'T', size: 50),
          ],
        ),
        const SizedBox(height: 12),
        const Text('MainAxisAlignment.spaceBetween',
            style: TextStyle(fontStyle: FontStyle.italic)),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _colorBox(_dubaiRed, 'R', size: 50),
            _colorBox(_dubaiGold, 'G', size: 50),
            _colorBox(_dubaiTeal, 'T', size: 50),
          ],
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // Stack
  // ---------------------------------------------------------------------------

  Widget _buildStackDemo() {
    return SizedBox(
      height: 140,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: _colorBox(_dubaiRed, '1', size: 100),
          ),
          Positioned(
            left: 40,
            top: 20,
            child: _colorBox(_dubaiGold, '2', size: 100),
          ),
          Positioned(
            left: 80,
            top: 40,
            child: _colorBox(_dubaiTeal, '3', size: 100),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Expanded & Flexible
  // ---------------------------------------------------------------------------

  Widget _buildExpandedFlexibleDemo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Expanded (flex: 2) + Expanded (flex: 1)',
            style: TextStyle(fontStyle: FontStyle.italic)),
        const SizedBox(height: 4),
        SizedBox(
          height: 50,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  color: _dubaiRed,
                  alignment: Alignment.center,
                  child: const Text('flex: 2',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                flex: 1,
                child: Container(
                  color: _dubaiGold,
                  alignment: Alignment.center,
                  child: const Text('flex: 1'),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        const Text('Flexible (does not fill remaining space)',
            style: TextStyle(fontStyle: FontStyle.italic)),
        const SizedBox(height: 4),
        SizedBox(
          height: 50,
          child: Row(
            children: [
              Flexible(
                child: Container(
                  width: 120,
                  color: _dubaiTeal,
                  alignment: Alignment.center,
                  child: const Text('Flexible',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(width: 4),
              Container(
                width: 80,
                color: _dubaiGold,
                alignment: Alignment.center,
                child: const Text('Fixed'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // Wrap
  // ---------------------------------------------------------------------------

  Widget _buildWrapDemo() {
    final labels = [
      'Flutter',
      'Dubai',
      'Dart',
      'Layout',
      'Widgets',
      'Material 3',
      'Workshop',
      'Mobile',
      'Web',
    ];
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: labels.map((label) {
        return Chip(
          label: Text(label),
          backgroundColor: _dubaiGold.withValues(alpha: 0.25),
          side: const BorderSide(color: _dubaiGold),
        );
      }).toList(),
    );
  }

  // ---------------------------------------------------------------------------
  // Card
  // ---------------------------------------------------------------------------

  Widget _buildCardDemo() {
    return Row(
      children: [
        Expanded(
          child: Card(
            elevation: 4,
            color: _dubaiRed.withValues(alpha: 0.1),
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Icon(Icons.location_city, color: _dubaiRed, size: 32),
                  SizedBox(height: 8),
                  Text('Dubai', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Card(
            elevation: 4,
            color: _dubaiGold.withValues(alpha: 0.1),
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Icon(Icons.star, color: _dubaiGold, size: 32),
                  SizedBox(height: 8),
                  Text('Gold', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Card(
            elevation: 4,
            color: _dubaiTeal.withValues(alpha: 0.1),
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Icon(Icons.waves, color: _dubaiTeal, size: 32),
                  SizedBox(height: 8),
                  Text('Teal', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // SizedBox
  // ---------------------------------------------------------------------------

  Widget _buildSizedBoxDemo() {
    return Row(
      children: [
        _colorBox(_dubaiRed, 'A', size: 50),
        const SizedBox(width: 16),
        _colorBox(_dubaiGold, 'B', size: 50),
        const SizedBox(width: 32),
        _colorBox(_dubaiTeal, 'C', size: 50),
        const SizedBox(width: 8),
        const Text('← varying SizedBox widths'),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  Widget _colorBox(Color color, String label, {double size = 60}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // About the Instructor
  // ---------------------------------------------------------------------------

  void _showAboutInstructor(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),
              const CircleAvatar(
                radius: 36,
                backgroundColor: _dubaiRed,
                child: Text(
                  'WA',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Waleed Mazen Alrashed',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _linkTile(
                icon: Icons.language,
                label: 'waleedalrashed.com',
                url: 'https://waleedalrashed.com',
              ),
              _linkTile(
                icon: Icons.link,
                label: 'LinkedIn',
                url: 'https://www.linkedin.com/in/waleedalrashed/',
              ),
              _linkTile(
                icon: Icons.code,
                label: 'GitHub',
                url: 'https://github.com/WaleedAlrashed/',
              ),
              _linkTile(
                icon: Icons.alternate_email,
                label: 'X / Twitter',
                url: 'https://x.com/waleedalrashedd',
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }

  Widget _linkTile({
    required IconData icon,
    required String label,
    required String url,
  }) {
    return ListTile(
      leading: Icon(icon, color: _dubaiTeal),
      title: Text(label),
      trailing: const Icon(Icons.open_in_new, size: 18),
      onTap: () => _openUrl(url),
    );
  }

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
