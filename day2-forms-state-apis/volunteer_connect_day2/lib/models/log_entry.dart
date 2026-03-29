class LogEntry {
  final String id;
  final String opportunityId;
  final String opportunityTitle;
  final int hours;
  final DateTime date;
  final String notes;

  const LogEntry({
    required this.id,
    required this.opportunityId,
    required this.opportunityTitle,
    required this.hours,
    required this.date,
    this.notes = '',
  });
}
