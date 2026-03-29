import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:url_launcher/url_launcher.dart';
import '../main.dart' show geminiApiKey;
import '../widgets/generated_profile_card.dart';

class ProfileGeneratorScreen extends StatefulWidget {
  const ProfileGeneratorScreen({super.key});

  @override
  State<ProfileGeneratorScreen> createState() => _ProfileGeneratorScreenState();
}

class _ProfileGeneratorScreenState extends State<ProfileGeneratorScreen> {
  final _nameController = TextEditingController();
  Map<String, dynamic>? _profileData;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _generateProfile() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      setState(() {
        _errorMessage = 'Please enter a name.';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _profileData = null;
    });

    try {
      final model = GenerativeModel(
        model: 'gemini-2.5-flash',
        apiKey: geminiApiKey,
      );

      final prompt =
          'Generate a fictional Dubai professional profile for a person named $name. '
          'Return ONLY valid JSON with these fields: name (string), title (string), '
          'bio (string, 2 sentences), volunteerHours (number), eventsAttended (number), '
          'points (number), interests (array of 4 strings). '
          'No markdown, no code blocks, just JSON.';

      final response = await model.generateContent([Content.text(prompt)]);
      final text = response.text;

      if (text == null || text.isEmpty) {
        throw Exception('Empty response from Gemini.');
      }

      // Try to extract JSON from the response, handling potential markdown wrapping
      String jsonString = text.trim();
      if (jsonString.startsWith('```')) {
        final startIndex = jsonString.indexOf('{');
        final endIndex = jsonString.lastIndexOf('}');
        if (startIndex != -1 && endIndex != -1) {
          jsonString = jsonString.substring(startIndex, endIndex + 1);
        }
      }

      final parsed = jsonDecode(jsonString) as Map<String, dynamic>;

      // Validate required fields
      final requiredFields = [
        'name',
        'title',
        'bio',
        'volunteerHours',
        'eventsAttended',
        'points',
        'interests',
      ];
      for (final field in requiredFields) {
        if (!parsed.containsKey(field)) {
          throw FormatException('Missing field: $field');
        }
      }

      setState(() {
        _profileData = parsed;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to generate profile: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showAboutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('About the Instructor'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Waleed Mazen Alrashed',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildLinkTile(
              icon: Icons.language,
              label: 'waleedalrashed.com',
              url: 'https://waleedalrashed.com',
            ),
            _buildLinkTile(
              icon: Icons.work_outline,
              label: 'LinkedIn',
              url: 'https://www.linkedin.com/in/waleedalrashed/',
            ),
            _buildLinkTile(
              icon: Icons.code,
              label: 'GitHub',
              url: 'https://github.com/WaleedAlrashed/',
            ),
            _buildLinkTile(
              icon: Icons.alternate_email,
              label: 'X / Twitter',
              url: 'https://x.com/waleedalrashedd',
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  Widget _buildLinkTile({
    required IconData icon,
    required String label,
    required String url,
  }) {
    return InkWell(
      onTap: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            Icon(icon, size: 20, color: const Color(0xFFC0392B)),
            const SizedBox(width: 12),
            Text(label, style: const TextStyle(fontSize: 15)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Profile Generator'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'About the Instructor',
            onPressed: _showAboutDialog,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Generate a Dubai Professional Profile',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Enter a name and let Gemini AI create a fictional profile.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Enter a name',
                    hintText: 'e.g. Ahmed Al Maktoum',
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.person_outline),
                    suffixIcon: _nameController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              _nameController.clear();
                              setState(() {});
                            },
                          )
                        : null,
                  ),
                  onChanged: (_) => setState(() {}),
                  onSubmitted: (_) => _generateProfile(),
                  textInputAction: TextInputAction.go,
                ),
                const SizedBox(height: 16),
                FilledButton.icon(
                  onPressed: _isLoading ? null : _generateProfile,
                  icon: _isLoading
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(Icons.auto_awesome),
                  label: Text(_isLoading ? 'Generating...' : 'Generate Profile'),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                ),
                if (_errorMessage != null) ...[
                  const SizedBox(height: 16),
                  Card(
                    color: Colors.red[50],
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Icon(Icons.error_outline, color: Colors.red[700]),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              _errorMessage!,
                              style: TextStyle(color: Colors.red[700]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                if (_isLoading) ...[
                  const SizedBox(height: 32),
                  const Center(child: CircularProgressIndicator()),
                  const SizedBox(height: 16),
                  Text(
                    'Gemini is crafting a profile...',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
                if (_profileData != null) ...[
                  const SizedBox(height: 24),
                  GeneratedProfileCard(profileData: _profileData!),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
