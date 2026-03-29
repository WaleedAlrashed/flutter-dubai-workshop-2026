class Volunteer {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String avatarUrl;
  final int totalHours;
  final int eventsAttended;
  final DateTime joinedDate;

  const Volunteer({
    required this.id,
    required this.name,
    required this.email,
    this.phone = '',
    this.avatarUrl = '',
    this.totalHours = 0,
    this.eventsAttended = 0,
    required this.joinedDate,
  });

  Volunteer copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? avatarUrl,
    int? totalHours,
    int? eventsAttended,
    DateTime? joinedDate,
  }) {
    return Volunteer(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      totalHours: totalHours ?? this.totalHours,
      eventsAttended: eventsAttended ?? this.eventsAttended,
      joinedDate: joinedDate ?? this.joinedDate,
    );
  }
}
