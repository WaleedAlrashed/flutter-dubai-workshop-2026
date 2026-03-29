import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/log_entry.dart';
import '../../../data/mock_data.dart';

class HoursNotifier extends StateNotifier<List<LogEntry>> {
  HoursNotifier() : super(MockData.logEntries);

  void addEntry(LogEntry entry) {
    state = [...state, entry];
  }

  void removeEntry(String id) {
    state = state.where((e) => e.id != id).toList();
  }
}

final hoursProvider =
    StateNotifierProvider<HoursNotifier, List<LogEntry>>((ref) {
  return HoursNotifier();
});

final totalHoursProvider = Provider<double>((ref) {
  final entries = ref.watch(hoursProvider);
  return entries.fold(0.0, (sum, entry) => sum + entry.hours);
});

final approvedHoursProvider = Provider<double>((ref) {
  final entries = ref.watch(hoursProvider);
  return entries
      .where((e) => e.status == 'approved')
      .fold(0.0, (sum, entry) => sum + entry.hours);
});

final pendingHoursProvider = Provider<double>((ref) {
  final entries = ref.watch(hoursProvider);
  return entries
      .where((e) => e.status == 'pending')
      .fold(0.0, (sum, entry) => sum + entry.hours);
});
