/// Simple localization stubs for demonstration purposes.
/// In production, use the intl package or flutter_localizations.
class AppLocalizations {
  static const Map<String, Map<String, String>> _translations = {
    'en': {
      'app_title': 'Dubai Volunteer Connect',
      'opportunities': 'Opportunities',
      'profile': 'My Profile',
      'log_hours': 'Log Hours',
      'settings': 'Settings',
      'chat': 'AI Assistant',
      'sign_in': 'Sign In',
      'sign_out': 'Sign Out',
      'register': 'Register',
      'search': 'Search opportunities...',
      'theme': 'Theme',
      'language': 'Language',
      'notifications': 'Notifications',
      'about': 'About',
      'hours': 'Hours',
      'events': 'Events',
      'rank': 'Rank',
      'skills': 'Skills',
    },
    'ar': {
      'app_title': 'دبي تطوع كونكت',
      'opportunities': 'الفرص',
      'profile': 'ملفي الشخصي',
      'log_hours': 'تسجيل الساعات',
      'settings': 'الإعدادات',
      'chat': 'المساعد الذكي',
      'sign_in': 'تسجيل الدخول',
      'sign_out': 'تسجيل الخروج',
      'register': 'إنشاء حساب',
      'search': 'ابحث عن الفرص...',
      'theme': 'المظهر',
      'language': 'اللغة',
      'notifications': 'الإشعارات',
      'about': 'حول',
      'hours': 'ساعات',
      'events': 'فعاليات',
      'rank': 'المرتبة',
      'skills': 'المهارات',
    },
  };

  static String translate(String key, {String locale = 'en'}) {
    return _translations[locale]?[key] ?? _translations['en']?[key] ?? key;
  }
}
