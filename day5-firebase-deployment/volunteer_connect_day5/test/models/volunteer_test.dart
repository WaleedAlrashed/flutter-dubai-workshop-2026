import 'package:flutter_test/flutter_test.dart';
import 'package:volunteer_connect_day5/models/volunteer.dart';

void main() {
  group('Volunteer', () {
    test('should create with required fields', () {
      const v = Volunteer(name: 'Test User', email: 'test@test.com');
      expect(v.name, 'Test User');
      expect(v.email, 'test@test.com');
      expect(v.totalHours, 0);
      expect(v.eventsAttended, 0);
    });

    test('rank should be Starter for 0 hours', () {
      const v = Volunteer(name: 'A', email: 'a@b.com', totalHours: 0);
      expect(v.rank, 'Starter');
    });

    test('rank should be Bronze for 20+ hours', () {
      const v = Volunteer(name: 'A', email: 'a@b.com', totalHours: 25);
      expect(v.rank, 'Bronze');
    });

    test('rank should be Silver for 50+ hours', () {
      const v = Volunteer(name: 'A', email: 'a@b.com', totalHours: 50);
      expect(v.rank, 'Silver');
    });

    test('rank should be Gold for 100+ hours', () {
      const v = Volunteer(name: 'A', email: 'a@b.com', totalHours: 150);
      expect(v.rank, 'Gold');
    });

    test('rank should be Platinum for 200+ hours', () {
      const v = Volunteer(name: 'A', email: 'a@b.com', totalHours: 200);
      expect(v.rank, 'Platinum');
    });

    test('copyWith should update fields', () {
      const v = Volunteer(name: 'A', email: 'a@b.com', totalHours: 10);
      final updated = v.copyWith(totalHours: 50);
      expect(updated.totalHours, 50);
      expect(updated.name, 'A');
    });
  });
}
