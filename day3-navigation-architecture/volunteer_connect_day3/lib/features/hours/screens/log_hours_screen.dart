import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../models/log_entry.dart';
import '../providers/hours_provider.dart';
import '../../opportunities/providers/opportunities_provider.dart';

class LogHoursScreen extends ConsumerStatefulWidget {
  const LogHoursScreen({super.key});

  @override
  ConsumerState<LogHoursScreen> createState() => _LogHoursScreenState();
}

class _LogHoursScreenState extends ConsumerState<LogHoursScreen> {
  final _formKey = GlobalKey<FormState>();
  final _hoursController = TextEditingController();
  final _notesController = TextEditingController();
  String? _selectedOpportunityId;
  DateTime _selectedDate = DateTime.now();

  @override
  void dispose() {
    _hoursController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2025),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  void _handleSubmit() {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedOpportunityId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select an opportunity')),
      );
      return;
    }

    final opportunities = ref.read(opportunitiesProvider);
    final opportunity =
        opportunities.firstWhere((o) => o.id == _selectedOpportunityId);

    final entry = LogEntry(
      id: 'l${DateTime.now().millisecondsSinceEpoch}',
      opportunityId: _selectedOpportunityId!,
      opportunityTitle: opportunity.title,
      hours: double.parse(_hoursController.text),
      date: _selectedDate,
      notes: _notesController.text,
      status: 'pending',
    );

    ref.read(hoursProvider.notifier).addEntry(entry);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Hours logged successfully!'),
        behavior: SnackBarBehavior.floating,
      ),
    );

    context.go('/hours');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final opportunities = ref.watch(opportunitiesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Log Hours'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Record your volunteer hours',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 24),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Opportunity',
                    prefixIcon: Icon(Icons.volunteer_activism),
                  ),
                  initialValue: _selectedOpportunityId,
                  items: opportunities.map((o) {
                    return DropdownMenuItem(
                      value: o.id,
                      child: Text(
                        o.title,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() => _selectedOpportunityId = value);
                  },
                  validator: (value) {
                    if (value == null) return 'Please select an opportunity';
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _hoursController,
                  decoration: const InputDecoration(
                    labelText: 'Hours',
                    prefixIcon: Icon(Icons.access_time),
                    hintText: 'e.g. 4',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter hours';
                    }
                    final hours = double.tryParse(value);
                    if (hours == null || hours <= 0) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                InkWell(
                  onTap: _selectDate,
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      labelText: 'Date',
                      prefixIcon: Icon(Icons.calendar_today),
                    ),
                    child: Text(
                      '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _notesController,
                  decoration: const InputDecoration(
                    labelText: 'Notes',
                    prefixIcon: Icon(Icons.notes),
                    hintText: 'What did you do?',
                  ),
                  maxLines: 3,
                ),
                const SizedBox(height: 32),
                FilledButton.icon(
                  onPressed: _handleSubmit,
                  icon: const Icon(Icons.save),
                  label: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text('Save Hours'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
