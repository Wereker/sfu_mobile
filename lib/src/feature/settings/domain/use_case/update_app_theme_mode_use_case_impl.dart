import 'package:sfu/src/feature/settings/domain/repository/settings_repository.dart';
import 'package:sfu/src/feature/settings/domain/use_case/update_app_theme_mode_use_case.dart';

class UpdateAppThemeModeUseCaseImpl implements UpdateAppThemeModeUseCase {
  final SettingsRepository settingsRepo;

  const UpdateAppThemeModeUseCaseImpl(this.settingsRepo);

  @override
  Future<void> call(String theme) async {
    await settingsRepo.setTheme(theme);
  }
}
