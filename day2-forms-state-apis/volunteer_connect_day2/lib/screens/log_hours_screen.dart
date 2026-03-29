import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/log_entry.dart';
import '../providers/hours_provider.dart';
import '../providers/auth_provider.dart';
import '../data/mock_data.dart';
import '../widgets/about_instructor.dart';

class LogHoursScreen extends ConsumerStatefulWidget {
  final VoidCallback onToggleTheme;
  final bool isDark;
  const LogHoursScreen({super.key, required this.onToggleTheme, required this.isDark});

  @override
  ConsumerState<LogHoursScreen> createState() => _LogHoursScreenState();
}

class _LogHoursScreenState extends ConsumerState<LogHoursScreen> {
  final _formKey = GlobalKey<FormState>();
  final _notesCtrl = TextEditingController();
  String? _selectedOpportunityId;
  int _hours = 1;
  DateTime _date = DateTime.now();

  @override
  void dispose() {
    _notesCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2026, 1, 1),
      lastDate: DateTime.now(),
    );
    if (picked != null) setState(() => _date = picked);
  }

  void _submit() {
    if (_formKey.currentState!.validate() && _selectedOpportunityId != null) {
      final opp = mockOpportunities.firstWhere((o) => o.id == _selectedOpportunityId);
      ref.read(hoursProvider.notifier).addEntry(LogEntry(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            opportunityId: _selectedOpportunityId!,
            opportunityTitle: opp.title,
            hours: _hours,
            date: _date,
            notes: _notesCtrl.text,
          ));
      ref.read(authProvider.notifier).updateHours(_hours);
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logged $_hours hours for ${opp.title}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log Hours'),
        backgroundColor: colorScheme.inversePrimary,
        actions: [
          IconButton(icon: Icon(widget.isDark ? Icons.light_mode : Icons.dark_mode), onPressed: widget.onToggleTheme),
          IconButton(icon: const Icon(Icons.info_outline), onPressed: () => showInstructorDialog(context)),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Log Volunteer Hours', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 24),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Opportunity', prefixIcon: Icon(Icons.volunteer_activism), border: OutlineInputBorder()),
                    initialValue: _selectedOpportunityId,
                    items: mockOpportunities.map((o) => DropdownMenuItem(value: o.id, child: Text(o.title))).toList(),
                    onChanged: (v) => setState(() => _selectedOpportunityId = v),
                    validator: (v) => v == null ? 'Select an opportunity' : null,
                  ),
                  const SizedBox(height: 16),
                  Text('Hours: $_hours', style: Theme.of(context).textTheme.titleMedium),
                  Slider(
                    value: _hours.toDouble(),
                    min: 1,
                    max: 12,
                    divisions: 11,
                    label: '$_hours hours',
                    onChanged: (v) => setState(() => _hours = v.round()),
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.calendar_today),
                    title: Text('Date: ${_date.day}/${_date.month}/${_date.year}'),
                    trailing: const Icon(Icons.edit),
                    onTap: _pickDate,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _notesCtrl,
                    decoration: const InputDecoration(labelText: 'Notes (optional)', border: OutlineInputBorder(), alignLabelWithHint: true),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: _submit,
                      icon: const Icon(Icons.check),
                      label: const Text('Log Hours'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
