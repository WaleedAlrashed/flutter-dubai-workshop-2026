class Opportunity {
  final String id;
  final String title;
  final String description;
  final String category;
  final String location;
  final DateTime date;
  final int hoursWorth;
  final int spotsLeft;
  final String imageUrl;

  const Opportunity({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.location,
    required this.date,
    required this.hoursWorth,
    required this.spotsLeft,
    this.imageUrl = '',
  });
}
