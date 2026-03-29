import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/volunteer.dart';
import '../data/mock_data.dart';

class AuthState {
  final bool isLoggedIn;
  final Volunteer? volunteer;

  const AuthState({this.isLoggedIn = false, this.volunteer});

  AuthState copyWith({bool? isLoggedIn, Volunteer? volunteer}) {
    return AuthState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      volunteer: volunteer ?? this.volunteer,
    );
  }
}

class AuthNotifier extends Notifier<AuthState> {
  @override
  AuthState build() => const AuthState();

  void login(String email, String password) {
    state = AuthState(isLoggedIn: true, volunteer: sampleVolunteer);
  }

  void register({
    required String name,
    required String email,
    required String phone,
    required String nationality,
    required List<String> skills,
  }) {
    final volunteer = Volunteer(
      name: name,
      email: email,
      phone: phone,
      nationality: nationality,
      skills: skills,
    );
    state = AuthState(isLoggedIn: true, volunteer: volunteer);
  }

  void logout() {
    state = const AuthState();
  }

  void updateHours(int additionalHours) {
    if (state.volunteer != null) {
      state = state.copyWith(
        volunteer: state.volunteer!.copyWith(
          totalHours: state.volunteer!.totalHours + additionalHours,
          eventsAttended: state.volunteer!.eventsAttended + 1,
        ),
      );
    }
  }
}

final authProvider = NotifierProvider<AuthNotifier, AuthState>(AuthNotifier.new);
