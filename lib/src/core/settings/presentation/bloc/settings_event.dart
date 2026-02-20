part of 'settings_bloc.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.getAppSettings() = _SettingsGetAppSettings;

  const factory SettingsEvent.updateAppThemeMode({required String themeMode}) =
      _SettingsUpdateThemeMode;

  const factory SettingsEvent.updateAppLocalization({required String locale}) =
      _SettingsUpdateAppLocalization;
}
