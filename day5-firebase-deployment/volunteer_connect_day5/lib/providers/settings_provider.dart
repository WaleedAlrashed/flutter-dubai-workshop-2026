import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/preferences_service.dart';

class SettingsState {
  final ThemeMode themeMode;
  final String locale;
  final bool notificationsEnabled;

  const SettingsState({
    this.themeMode = ThemeMode.system,
    this.locale = 'en',
    this.notificationsEnabled = true,
  });

  SettingsState copyWith({ThemeMode? themeMode, String? locale, bool? notificationsEnabled}) {
    return SettingsState(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
    );
  }
}

class SettingsNotifier extends Notifier<SettingsState> {
  final _prefs = PreferencesService();

  @override
  SettingsState build() {
    _loadSettings();
    return const SettingsState();
  }

  Future<void> _loadSettings() async {
    final themeStr = await _prefs.getThemeMode();
    final locale = await _prefs.getLocale();
    final notifications = await _prefs.getNotificationsEnabled();
    state = SettingsState(
      themeMode: _parseThemeMode(themeStr),
      locale: locale,
      notificationsEnabled: notifications,
    );
  }

  ThemeMode _parseThemeMode(String mode) {
    return switch (mode) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => ThemeMode.system,
    };
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    state = state.copyWith(themeMode: mode);
    final str = switch (mode) {
      ThemeMode.light => 'light',
      ThemeMode.dark => 'dark',
      ThemeMode.system => 'system',
    };
    await _prefs.setThemeMode(str);
  }

  Future<void> setLocale(String locale) async {
    state = state.copyWith(locale: locale);
    await _prefs.setLocale(locale);
  }

  Future<void> setNotificationsEnabled(bool enabled) async {
    state = state.copyWith(notificationsEnabled: enabled);
    await _prefs.setNotificationsEnabled(enabled);
  }
}

final settingsProvider = NotifierProvider<SettingsNotifier, SettingsState>(SettingsNotifier.new);
