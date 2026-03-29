class Opportunity {
  final String id;
  final String title;
  final String description;
  final String category;
  final String location;
  final DateTime date;
  final int spotsLeft;

  const Opportunity({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.location,
    required this.date,
    this.spotsLeft = 10,
  });
}
