import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static const _themeModeKey = 'theme_mode';
  static const _localeKey = 'locale';
  static const _notificationsKey = 'notifications_enabled';

  SharedPreferencesAsync? _prefs;

  Future<SharedPreferencesAsync> get _instance async {
    _prefs ??= SharedPreferencesAsync();
    return _prefs!;
  }

  Future<String> getThemeMode() async {
    final prefs = await _instance;
    return await prefs.getString(_themeModeKey) ?? 'system';
  }

  Future<void> setThemeMode(String mode) async {
    final prefs = await _instance;
    await prefs.setString(_themeModeKey, mode);
  }

  Future<String> getLocale() async {
    final prefs = await _instance;
    return await prefs.getString(_localeKey) ?? 'en';
  }

  Future<void> setLocale(String locale) async {
    final prefs = await _instance;
    await prefs.setString(_localeKey, locale);
  }

  Future<bool> getNotificationsEnabled() async {
    final prefs = await _instance;
    return await prefs.getBool(_notificationsKey) ?? true;
  }

  Future<void> setNotificationsEnabled(bool enabled) async {
    final prefs = await _instance;
    await prefs.setBool(_notificationsKey, enabled);
  }
}
