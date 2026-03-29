class LogEntry {
  final String id;
  final String opportunityId;
  final String opportunityTitle;
  final double hours;
  final DateTime date;
  final String notes;
  final String status;

  const LogEntry({
    required this.id,
    required this.opportunityId,
    required this.opportunityTitle,
    required this.hours,
    required this.date,
    this.notes = '',
    this.status = 'approved',
  });

  LogEntry copyWith({
    String? id,
    String? opportunityId,
    String? opportunityTitle,
    double? hours,
    DateTime? date,
    String? notes,
    String? status,
  }) {
    return LogEntry(
      id: id ?? this.id,
      opportunityId: opportunityId ?? this.opportunityId,
      opportunityTitle: opportunityTitle ?? this.opportunityTitle,
      hours: hours ?? this.hours,
      date: date ?? this.date,
      notes: notes ?? this.notes,
      status: status ?? this.status,
    );
  }
}
