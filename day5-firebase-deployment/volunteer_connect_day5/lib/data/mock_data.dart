import '../models/volunteer.dart';
import '../models/opportunity.dart';
import '../models/log_entry.dart';

const sampleVolunteer = Volunteer(
  name: 'Ahmed Al Maktoum',
  email: 'ahmed@example.com',
  phone: '+971 50 123 4567',
  nationality: 'Emirati',
  skills: ['Event Planning', 'First Aid', 'Teaching'],
  totalHours: 75,
  eventsAttended: 12,
);

final mockOpportunities = [
  Opportunity(id: '1', title: 'Beach Cleanup Drive', description: 'Help clean Jumeirah Beach and protect marine life.', category: 'Environment', location: 'Jumeirah Beach', date: DateTime(2026, 4, 5), spotsLeft: 15),
  Opportunity(id: '2', title: 'Food Bank Distribution', description: 'Distribute food packages to families in need during Ramadan.', category: 'Community', location: 'Dubai Creek', date: DateTime(2026, 4, 8), spotsLeft: 20),
  Opportunity(id: '3', title: 'Youth Coding Workshop', description: 'Teach basic programming to underprivileged youth.', category: 'Education', location: 'Dubai Knowledge Park', date: DateTime(2026, 4, 10), spotsLeft: 8),
  Opportunity(id: '4', title: 'Senior Care Visit', description: 'Visit and spend time with elderly residents at care homes.', category: 'Healthcare', location: 'Al Barsha Care Home', date: DateTime(2026, 4, 12), spotsLeft: 12),
  Opportunity(id: '5', title: 'Desert Tree Planting', description: 'Plant native trees to combat desertification.', category: 'Environment', location: 'Dubai Desert Conservation', date: DateTime(2026, 4, 15), spotsLeft: 25),
  Opportunity(id: '6', title: 'Marathon Water Station', description: 'Manage hydration stations for Dubai Marathon runners.', category: 'Sports', location: 'Sheikh Zayed Road', date: DateTime(2026, 4, 18), spotsLeft: 30),
  Opportunity(id: '7', title: 'Museum Tour Guide', description: 'Guide visitors through the Dubai Museum exhibits.', category: 'Culture', location: 'Al Fahidi Fort', date: DateTime(2026, 4, 20), spotsLeft: 6),
  Opportunity(id: '8', title: 'Animal Shelter Helper', description: 'Care for rescued animals at the Dubai shelter.', category: 'Animals', location: 'Dubai Animal Shelter', date: DateTime(2026, 4, 22), spotsLeft: 10),
];

final sampleLogEntries = [
  LogEntry(id: '1', opportunityId: '1', opportunityTitle: 'Beach Cleanup Drive', hours: 4, date: DateTime(2026, 3, 15), notes: 'Collected 20kg of plastic waste'),
  LogEntry(id: '2', opportunityId: '3', opportunityTitle: 'Youth Coding Workshop', hours: 6, date: DateTime(2026, 3, 20), notes: 'Taught Python basics to 15 students'),
  LogEntry(id: '3', opportunityId: '2', opportunityTitle: 'Food Bank Distribution', hours: 3, date: DateTime(2026, 3, 25)),
];

const nationalities = ['Emirati', 'Saudi', 'Kuwaiti', 'Bahraini', 'Omani', 'Qatari', 'Egyptian', 'Jordanian', 'Lebanese', 'Indian', 'Pakistani', 'Filipino', 'British', 'American', 'Other'];

const availableSkills = ['Event Planning', 'First Aid', 'Teaching', 'Cooking', 'Photography', 'Social Media', 'Translation', 'Driving', 'IT Support', 'Counseling', 'Sports Coaching', 'Music'];
