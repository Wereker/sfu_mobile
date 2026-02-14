import 'package:sfu/src/core/settings/domain/repository/settings_repository.dart';
import 'package:sfu/src/core/settings/domain/use_case/update_app_localization_use_case.dart';

class UpdateAppLocalizationUseCaseImpl implements UpdateAppLocalizationUseCase {
  final SettingsRepository settingsRepo;

  const UpdateAppLocalizationUseCaseImpl(this.settingsRepo);

  @override
  Future<void> call(String locale) async {
    await settingsRepo.setLocale(locale);
  }

}