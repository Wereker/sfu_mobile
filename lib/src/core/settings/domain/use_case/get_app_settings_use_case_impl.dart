import 'package:sfu/src/core/settings/domain/entity/app_settings.dart';
import 'package:sfu/src/core/settings/domain/repository/settings_repository.dart';
import 'package:sfu/src/core/settings/domain/use_case/get_app_settings_use_case.dart';

class GetAppSettingsUseCaseImpl implements GetAppSettingsUseCase {
  final SettingsRepository settingsRepo;
  static final _defaultLocale = 'ru';
  static final _defaultTheme = 'system';

  const GetAppSettingsUseCaseImpl(this.settingsRepo);

  @override
  Future<AppSettings> call() async {
    final currentLocale = await settingsRepo.getLocale();
    final currentTheme = await settingsRepo.getTheme();

    return AppSettings(
      locale: currentLocale ?? _defaultLocale,
      themeMode: currentTheme ?? _defaultTheme,
    );
  }
}
