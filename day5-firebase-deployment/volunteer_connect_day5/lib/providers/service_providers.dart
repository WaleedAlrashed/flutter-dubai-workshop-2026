import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/auth_service.dart';
import '../services/preferences_service.dart';
import '../services/gemini_service.dart';

final authServiceProvider = Provider<AuthService>((ref) => AuthService());
final preferencesServiceProvider = Provider<PreferencesService>((ref) => PreferencesService());
final geminiServiceProvider = Provider<GeminiService>((ref) => GeminiService());
