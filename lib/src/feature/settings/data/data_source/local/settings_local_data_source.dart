abstract class SettingsLocalDataSource {
  Future<void> setLocale(String locale);
  Future<String?> getLocale();
  Future<void> setTheme(String theme);
  Future<String?> getTheme();
}