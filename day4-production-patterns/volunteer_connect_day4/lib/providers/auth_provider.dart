import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/volunteer.dart';
import '../models/result.dart';
import '../services/api_service.dart';
import '../data/mock_data.dart';

class AuthState {
  final bool isLoggedIn;
  final bool isLoading;
  final Volunteer? volunteer;
  final String? error;

  const AuthState({this.isLoggedIn = false, this.isLoading = false, this.volunteer, this.error});

  AuthState copyWith({bool? isLoggedIn, bool? isLoading, Volunteer? volunteer, String? error}) {
    return AuthState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      isLoading: isLoading ?? this.isLoading,
      volunteer: volunteer ?? this.volunteer,
      error: error,
    );
  }
}

class AuthNotifier extends Notifier<AuthState> {
  @override
  AuthState build() => const AuthState();

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);
    final api = ApiService();
    final result = await api.login(email, password);
    state = switch (result) {
      Success(:final data) => AuthState(isLoggedIn: true, volunteer: data),
      Failure(:final exception) => state.copyWith(isLoading: false, error: exception.message),
    };
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

  void loginWithMock() {
    state = const AuthState(isLoggedIn: true, volunteer: sampleVolunteer);
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
