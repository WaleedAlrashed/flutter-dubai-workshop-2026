class Profile {
  final String name;
  final String emiratesId;
  final String avatarUrl;
  final String title;
  final int volunteerHours;
  final int eventsAttended;
  final int points;

  const Profile({
    required this.name,
    required this.emiratesId,
    required this.avatarUrl,
    required this.title,
    required this.volunteerHours,
    required this.eventsAttended,
    required this.points,
  });

  static const sample = Profile(
    name: 'Ahmed Al Maktoum',
    emiratesId: '784-1990-1234567-1',
    avatarUrl: 'https://i.pravatar.cc/300?img=12',
    title: 'Senior Flutter Developer',
    volunteerHours: 248,
    eventsAttended: 37,
    points: 4820,
  );
}
