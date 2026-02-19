import 'package:sfu/src/core/settings/data/data_source/local/settings_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  static const _keyLocale = 'sfu_locale';
  static const _keyThemeMode = 'sfu_theme_mode';
  final SharedPreferences _pref;

  const SettingsLocalDataSourceImpl(this._pref);

  @override
  Future<String?> getLocale() async {
    final locale = _pref.getString(_keyLocale);
    return locale?.isNotEmpty == true ? locale : null;
  }

  @override
  Future<String?> getTheme() async {
    final theme = _pref.getString(_keyThemeMode);
    return theme?.isNotEmpty == true ? theme : null;
  }

  @override
  Future<void> setLocale(String locale) async {
    await _pref.setString(_keyLocale, locale);
  }

  @override
  Future<void> setTheme(String theme) async {
    await _pref.setString(_keyThemeMode, theme);
  }

}