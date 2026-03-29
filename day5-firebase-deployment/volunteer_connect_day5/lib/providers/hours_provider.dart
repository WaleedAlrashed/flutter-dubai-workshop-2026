import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/log_entry.dart';
import '../data/mock_data.dart';

class HoursNotifier extends Notifier<List<LogEntry>> {
  @override
  List<LogEntry> build() => sampleLogEntries;

  void addEntry(LogEntry entry) {
    state = [...state, entry];
  }

  int get totalHours => state.fold(0, (sum, e) => sum + e.hours);
}

final hoursProvider = NotifierProvider<HoursNotifier, List<LogEntry>>(HoursNotifier.new);
