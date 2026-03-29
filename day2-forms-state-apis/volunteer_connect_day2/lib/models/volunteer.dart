class Volunteer {
  final String name;
  final String email;
  final String phone;
  final String nationality;
  final List<String> skills;
  final int totalHours;
  final int eventsAttended;

  const Volunteer({
    required this.name,
    required this.email,
    required this.phone,
    required this.nationality,
    required this.skills,
    this.totalHours = 0,
    this.eventsAttended = 0,
  });

  Volunteer copyWith({
    String? name,
    String? email,
    String? phone,
    String? nationality,
    List<String>? skills,
    int? totalHours,
    int? eventsAttended,
  }) {
    return Volunteer(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      nationality: nationality ?? this.nationality,
      skills: skills ?? this.skills,
      totalHours: totalHours ?? this.totalHours,
      eventsAttended: eventsAttended ?? this.eventsAttended,
    );
  }

  String get rank {
    if (totalHours >= 300) return 'Platinum';
    if (totalHours >= 150) return 'Gold';
    if (totalHours >= 50) return 'Silver';
    return 'Bronze';
  }
}
