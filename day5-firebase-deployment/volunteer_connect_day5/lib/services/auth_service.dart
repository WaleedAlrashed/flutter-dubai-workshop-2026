import '../models/volunteer.dart';
import '../models/result.dart';
import '../exceptions/app_exception.dart';
import '../data/mock_data.dart';

/// Mock Firebase Auth service - simulates Firebase authentication
class AuthService {
  Volunteer? _currentUser;

  Volunteer? get currentUser => _currentUser;

  Future<Result<Volunteer>> signIn(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 800));
    if (email.isEmpty || !email.contains('@')) {
      return const Failure(ValidationException('Invalid email format'));
    }
    if (password.length < 8) {
      return const Failure(ValidationException('Password must be at least 8 characters'));
    }
    _currentUser = sampleVolunteer;
    return const Success(sampleVolunteer);
  }

  Future<Result<Volunteer>> register({
    required String name,
    required String email,
    required String phone,
    required String nationality,
    required List<String> skills,
  }) async {
    await Future.delayed(const Duration(milliseconds: 800));
    final volunteer = Volunteer(
      name: name,
      email: email,
      phone: phone,
      nationality: nationality,
      skills: skills,
    );
    _currentUser = volunteer;
    return Success(volunteer);
  }

  Future<void> signOut() async {
    await Future.delayed(const Duration(milliseconds: 300));
    _currentUser = null;
  }
}
