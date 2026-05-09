part of 'settings_bloc.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.getAppSettings() = _GetAppSettings;
  const factory SettingsEvent.updateAppThemeMode({required String themeMode}) = _UpdateThemeMode;
  const factory SettingsEvent.updateAppLocalization({required String locale}) = _UpdateLocalization;
}