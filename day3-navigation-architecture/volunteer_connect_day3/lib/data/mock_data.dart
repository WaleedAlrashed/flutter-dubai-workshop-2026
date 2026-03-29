import '../models/opportunity.dart';
import '../models/log_entry.dart';
import '../models/volunteer.dart';

class MockData {
  static final List<Opportunity> opportunities = [
    Opportunity(
      id: '1',
      title: 'Beach Cleanup Drive - Jumeirah',
      organization: 'Dubai Municipality',
      description:
          'Join us for a community beach cleanup along the beautiful Jumeirah coastline. '
          'Volunteers will help collect litter, sort recyclables, and spread awareness about '
          'marine conservation. All equipment provided. Great for families and groups!',
      category: 'Environmental',
      location: 'Jumeirah Beach, Dubai',
      hoursRequired: 4,
      spotsAvailable: 20,
      spotsTotal: 30,
      date: DateTime(2026, 4, 15),
      iconName: 'waves',
    ),
    Opportunity(
      id: '2',
      title: 'Food Distribution - Ramadan',
      organization: 'UAE Red Crescent',
      description:
          'Help distribute Iftar meals to workers and families in need during the holy month '
          'of Ramadan. Volunteers will assist with meal packaging, distribution, and cleanup. '
          'A rewarding experience of giving back during this blessed month.',
      category: 'Community',
      location: 'Al Quoz Industrial Area, Dubai',
      hoursRequired: 3,
      spotsAvailable: 15,
      spotsTotal: 25,
      date: DateTime(2026, 4, 1),
      iconName: 'restaurant',
    ),
    Opportunity(
      id: '3',
      title: 'Tutoring Program - Al Fahidi',
      organization: 'Dubai Cares',
      description:
          'Become a mentor and tutor for underprivileged children in the historic Al Fahidi '
          'neighborhood. Help with English, Math, and Science subjects. Make a lasting impact '
          'on a child\'s education and future.',
      category: 'Education',
      location: 'Al Fahidi Historical District, Dubai',
      hoursRequired: 6,
      spotsAvailable: 8,
      spotsTotal: 10,
      date: DateTime(2026, 4, 10),
      iconName: 'school',
    ),
    Opportunity(
      id: '4',
      title: 'Elderly Care Visit - Hatta',
      organization: 'Community Development Authority',
      description:
          'Visit and spend quality time with elderly residents in Hatta. Activities include '
          'reading, playing games, sharing stories, and assisting with daily activities. '
          'Transportation provided from Dubai city center.',
      category: 'Healthcare',
      location: 'Hatta Senior Center, Hatta',
      hoursRequired: 5,
      spotsAvailable: 12,
      spotsTotal: 15,
      date: DateTime(2026, 4, 20),
      iconName: 'elderly',
    ),
    Opportunity(
      id: '5',
      title: 'Tree Planting - Dubai Hills',
      organization: 'Emirates Environmental Group',
      description:
          'Help make Dubai greener! Join our tree planting initiative at Dubai Hills Park. '
          'Volunteers will plant native Ghaf trees and learn about desert-adapted flora. '
          'Includes a workshop on sustainable gardening.',
      category: 'Environmental',
      location: 'Dubai Hills Park, Dubai',
      hoursRequired: 3,
      spotsAvailable: 25,
      spotsTotal: 40,
      date: DateTime(2026, 4, 5),
      iconName: 'park',
    ),
    Opportunity(
      id: '6',
      title: 'Animal Shelter Support',
      organization: 'Dubai Animal Rescue',
      description:
          'Help care for rescued animals at the Dubai Animal Rescue shelter. Tasks include '
          'feeding, grooming, walking dogs, socializing cats, and general shelter maintenance. '
          'Training provided for first-time volunteers.',
      category: 'Animal Welfare',
      location: 'Al Warqa, Dubai',
      hoursRequired: 4,
      spotsAvailable: 10,
      spotsTotal: 12,
      date: DateTime(2026, 4, 8),
      iconName: 'pets',
    ),
    Opportunity(
      id: '7',
      title: 'Habitat Build - Dubai South',
      organization: 'Habitat for Humanity UAE',
      description:
          'Participate in building affordable housing units in the Dubai South community. '
          'No construction experience required - training and safety equipment provided. '
          'A hands-on way to make a tangible difference.',
      category: 'Community',
      location: 'Dubai South, Dubai',
      hoursRequired: 8,
      spotsAvailable: 20,
      spotsTotal: 30,
      date: DateTime(2026, 4, 25),
      iconName: 'construction',
    ),
    Opportunity(
      id: '8',
      title: 'Marathon Support Crew - Dubai Run',
      organization: 'Dubai Sports Council',
      description:
          'Be part of the support crew for the annual Dubai Run event along Sheikh Zayed Road. '
          'Roles include water station management, route marshalling, finish line support, '
          'and cheering stations. High-energy and fun!',
      category: 'Sports',
      location: 'Sheikh Zayed Road, Dubai',
      hoursRequired: 6,
      spotsAvailable: 50,
      spotsTotal: 100,
      date: DateTime(2026, 5, 1),
      iconName: 'directions_run',
    ),
    Opportunity(
      id: '9',
      title: 'Museum Guide - Louvre Abu Dhabi',
      organization: 'Department of Culture & Tourism',
      description:
          'Volunteer as a museum guide at the iconic Louvre Abu Dhabi. After a comprehensive '
          'training program, you will help visitors navigate exhibits, provide historical '
          'context, and enhance the museum experience for guests from around the world.',
      category: 'Culture',
      location: 'Louvre Abu Dhabi, Saadiyat Island',
      hoursRequired: 5,
      spotsAvailable: 6,
      spotsTotal: 8,
      date: DateTime(2026, 4, 18),
      iconName: 'museum',
    ),
    Opportunity(
      id: '10',
      title: 'Desert Conservation - Al Marmoom',
      organization: 'Dubai Desert Conservation Reserve',
      description:
          'Join the conservation team at the Al Marmoom Desert Conservation Reserve. '
          'Help with wildlife monitoring, habitat restoration, and data collection on native '
          'species like the Arabian Oryx and Gordon\'s Wildcat. A unique outdoor experience.',
      category: 'Environmental',
      location: 'Al Marmoom Reserve, Dubai',
      hoursRequired: 7,
      spotsAvailable: 15,
      spotsTotal: 20,
      date: DateTime(2026, 4, 22),
      iconName: 'terrain',
    ),
  ];

  static final currentVolunteer = Volunteer(
    id: 'v1',
    name: 'Ahmed Al Maktoum',
    email: 'ahmed@example.com',
    phone: '+971 50 123 4567',
    totalHours: 42,
    eventsAttended: 8,
    joinedDate: DateTime(2025, 9, 1),
  );

  static final List<LogEntry> logEntries = [
    LogEntry(
      id: 'l1',
      opportunityId: '1',
      opportunityTitle: 'Beach Cleanup Drive - Jumeirah',
      hours: 4,
      date: DateTime(2026, 3, 15),
      notes: 'Collected 3 bags of plastic waste',
      status: 'approved',
    ),
    LogEntry(
      id: 'l2',
      opportunityId: '3',
      opportunityTitle: 'Tutoring Program - Al Fahidi',
      hours: 6,
      date: DateTime(2026, 3, 10),
      notes: 'Helped 5 students with math homework',
      status: 'approved',
    ),
    LogEntry(
      id: 'l3',
      opportunityId: '5',
      opportunityTitle: 'Tree Planting - Dubai Hills',
      hours: 3,
      date: DateTime(2026, 3, 5),
      notes: 'Planted 12 Ghaf trees',
      status: 'approved',
    ),
    LogEntry(
      id: 'l4',
      opportunityId: '2',
      opportunityTitle: 'Food Distribution - Ramadan',
      hours: 3,
      date: DateTime(2026, 3, 20),
      notes: 'Distributed 200 Iftar meals',
      status: 'pending',
    ),
    LogEntry(
      id: 'l5',
      opportunityId: '6',
      opportunityTitle: 'Animal Shelter Support',
      hours: 4,
      date: DateTime(2026, 3, 22),
      notes: 'Walked 6 dogs and cleaned the cat area',
      status: 'approved',
    ),
  ];
}
