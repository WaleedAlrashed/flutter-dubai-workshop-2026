class Opportunity {
  final String id;
  final String title;
  final String organization;
  final String description;
  final String category;
  final String location;
  final int hoursRequired;
  final int spotsAvailable;
  final int spotsTotal;
  final DateTime date;
  final String iconName;

  const Opportunity({
    required this.id,
    required this.title,
    required this.organization,
    required this.description,
    required this.category,
    required this.location,
    required this.hoursRequired,
    required this.spotsAvailable,
    required this.spotsTotal,
    required this.date,
    this.iconName = 'volunteer_activism',
  });

  Opportunity copyWith({
    String? id,
    String? title,
    String? organization,
    String? description,
    String? category,
    String? location,
    int? hoursRequired,
    int? spotsAvailable,
    int? spotsTotal,
    DateTime? date,
    String? iconName,
  }) {
    return Opportunity(
      id: id ?? this.id,
      title: title ?? this.title,
      organization: organization ?? this.organization,
      description: description ?? this.description,
      category: category ?? this.category,
      location: location ?? this.location,
      hoursRequired: hoursRequired ?? this.hoursRequired,
      spotsAvailable: spotsAvailable ?? this.spotsAvailable,
      spotsTotal: spotsTotal ?? this.spotsTotal,
      date: date ?? this.date,
      iconName: iconName ?? this.iconName,
    );
  }
}
