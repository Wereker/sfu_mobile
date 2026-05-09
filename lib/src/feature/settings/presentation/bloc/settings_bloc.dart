import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/core/error/app_exception.dart';
import 'package:sfu/src/feature/settings/domain/entity/app_settings.dart';
import 'package:sfu/src/feature/settings/domain/use_case/get_app_settings_use_case.dart';
import 'package:sfu/src/feature/settings/domain/use_case/update_app_localization_use_case.dart';
import 'package:sfu/src/feature/settings/domain/use_case/update_app_theme_mode_use_case.dart';

part 'settings_event.dart';
part 'settings_state.dart';
part 'settings_bloc.freezed.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final GetAppSettingsUseCase _getAppSettingsUseCase;
  final UpdateAppThemeModeUseCase _updateAppThemeModeUseCase;
  final UpdateAppLocalizationUseCase _updateAppLocalizationUseCase;

  SettingsBloc({
    required GetAppSettingsUseCase getAppSettingsUseCase,
    required UpdateAppThemeModeUseCase updateAppThemeModeUseCase,
    required UpdateAppLocalizationUseCase updateAppLocalizationUseCase,
  }) : _getAppSettingsUseCase = getAppSettingsUseCase,
       _updateAppThemeModeUseCase = updateAppThemeModeUseCase,
       _updateAppLocalizationUseCase = updateAppLocalizationUseCase,
       super(SettingsState.initial()) {
    on<SettingsEvent>(_onEvent);
  }

  Future<void> _onEvent(
    SettingsEvent event,
    Emitter<SettingsState> emit,
  ) async {
    await event.when(
      getAppSettings: () async {
        try {
          final settings = await _getAppSettingsUseCase.call();
          emit(SettingsState.success(settings));
        } on AppException catch (e) {
          emit(SettingsState.error(e.message));
        } catch (_) {
          emit(SettingsState.error('Ошибка загрузки настроек'));
        }
      },
      updateAppThemeMode: (String themeMode) async {
        try {
          await _updateAppThemeModeUseCase.call(themeMode);
          final settings = await _getAppSettingsUseCase.call();
          emit(SettingsState.success(settings));
        } on AppException catch (e) {
          emit(SettingsState.error(e.message));
        } catch (_) {
          emit(SettingsState.error('Ошибка сохранения темы'));
        }
      },
      updateAppLocalization: (String locale) async {
        try {
          await _updateAppLocalizationUseCase.call(locale);
          final settings = await _getAppSettingsUseCase.call();
          emit(SettingsState.success(settings));
        } on AppException catch (e) {
          emit(SettingsState.error(e.message));
        } catch (_) {
          emit(SettingsState.error('Ошибка сохранения локализации'));
        }
      },
    );
  }
}
