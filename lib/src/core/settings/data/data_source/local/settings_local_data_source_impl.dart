import 'package:sfu/src/core/settings/data/data_source/local/settings_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  static const _keyLocale = 'sfu_locale';
  static const _keyThemeMode = 'sfu_theme_mode';

  @override
  Future<String?> getLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final locale = prefs.getString(_keyLocale);
    return locale?.isNotEmpty == true ? locale : null;
  }

  @override
  Future<String?> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString(_keyThemeMode);
    return theme?.isNotEmpty == true ? theme : null;
  }

  @override
  Future<void> setLocale(String locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyLocale, locale);
  }

  @override
  Future<void> setTheme(String theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyThemeMode, theme);
  }

}