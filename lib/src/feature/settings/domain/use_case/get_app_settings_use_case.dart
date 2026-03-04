import 'package:sfu/src/feature/settings/domain/entity/app_settings.dart';

abstract class GetAppSettingsUseCase {
  Future<AppSettings> call();
}