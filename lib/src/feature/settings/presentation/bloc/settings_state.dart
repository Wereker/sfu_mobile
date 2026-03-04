part of 'settings_bloc.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initial() = _SettingsInitial;

  const factory SettingsState.loading() = _SettingsLoading;

  const factory SettingsState.success(AppSettings settings) = _SettingsSuccess;

  const factory SettingsState.error(String message) = _SettingsError;
}
