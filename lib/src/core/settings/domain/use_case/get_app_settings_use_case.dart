import 'package:sfu/src/core/settings/domain/entity/app_settings.dart';

abstract class GetAppSettingsUseCase {
  Future<AppSettings> call();
}