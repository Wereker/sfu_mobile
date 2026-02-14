abstract class SettingsRepository {
  Future<String?> getLocale();
  Future<void> setLocale(String locale);
  Future<String?> getTheme();
  Future<void> setTheme(String theme);
}