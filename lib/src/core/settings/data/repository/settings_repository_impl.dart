import 'package:sfu/src/core/settings/data/data_source/local/settings_local_data_source.dart';
import 'package:sfu/src/core/settings/domain/repository/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final String _defaultLocalization = 'ru';
  final String _defaultThemeMode = 'system';

  final SettingsLocalDataSource local;

  const SettingsRepositoryImpl(this.local);

  @override
  Future<void> setLocale(String locale) async {
    await local.setLocale(locale);
  }

  @override
  Future<void> setTheme(String theme) async {
    await local.setTheme(theme);
  }

  @override
  Future<String?> getLocale() async {
    final locale = await local.getLocale();
    return locale ?? _defaultLocalization;
  }

  @override
  Future<String?> getTheme() async {
    final theme = await local.getTheme();
    return theme ?? _defaultThemeMode;
  }

}