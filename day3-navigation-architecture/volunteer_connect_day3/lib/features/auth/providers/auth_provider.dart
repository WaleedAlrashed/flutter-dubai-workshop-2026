import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/volunteer.dart';
import '../../../data/mock_data.dart';

class AuthState {
  final bool isLoggedIn;
  final bool isLoading;
  final Volunteer? user;
  final String? error;

  const AuthState({
    this.isLoggedIn = false,
    this.isLoading = false,
    this.user,
    this.error,
  });

  AuthState copyWith({
    bool? isLoggedIn,
    bool? isLoading,
    Volunteer? user,
    String? error,
  }) {
    return AuthState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      error: error,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const AuthState());

  Future<bool> login(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);

    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 800));

    if (email.isNotEmpty && password.isNotEmpty) {
      state = AuthState(
        isLoggedIn: true,
        isLoading: false,
        user: MockData.currentVolunteer,
      );
      return true;
    } else {
      state = state.copyWith(
        isLoading: false,
        error: 'Invalid email or password',
      );
      return false;
    }
  }

  Future<bool> register(String name, String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);

    await Future.delayed(const Duration(milliseconds: 800));

    if (name.isNotEmpty && email.isNotEmpty && password.length >= 6) {
      state = AuthState(
        isLoggedIn: true,
        isLoading: false,
        user: Volunteer(
          id: 'new_user',
          name: name,
          email: email,
          joinedDate: DateTime.now(),
        ),
      );
      return true;
    } else {
      state = state.copyWith(
        isLoading: false,
        error: 'Please fill all fields (password must be 6+ characters)',
      );
      return false;
    }
  }

  void logout() {
    state = const AuthState();
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});
