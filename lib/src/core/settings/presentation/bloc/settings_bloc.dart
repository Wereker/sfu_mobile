import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/core/settings/domain/entity/app_settings.dart';
import 'package:sfu/src/core/settings/domain/use_case/get_app_settings_use_case.dart';
import 'package:sfu/src/core/settings/domain/use_case/update_app_localization_use_case.dart';
import 'package:sfu/src/core/settings/domain/use_case/update_app_theme_mode_use_case.dart';

part 'settings_event.dart';
part 'settings_state.dart';
part 'settings_bloc.freezed.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final UpdateAppThemeModeUseCase updateAppThemeModeUseCase;
  final UpdateAppLocalizationUseCase updateAppLocalizationUseCase;
  final GetAppSettingsUseCase getAppSettingsUseCase;

  SettingsBloc({
    required this.updateAppThemeModeUseCase,
    required this.updateAppLocalizationUseCase,
    required this.getAppSettingsUseCase,
  }) : super(SettingsState.initial()) {
    on<SettingsEvent>(_onEvent);
  }

  Future<void> _onEvent(
    SettingsEvent event,
    Emitter<SettingsState> emit,
  ) async {
    await event.when(
      getAppSettings: () async {
        try {
          final settings = await getAppSettingsUseCase.call();
          emit(SettingsState.success(settings));
        } catch (_) {
          emit(
            SettingsState.error('Ошибка в получении пользовательских настроек'),
          );
        }
      },
      updateAppThemeMode: (theme) async {

        try {
          await updateAppThemeModeUseCase.call(theme);
          final settings = await getAppSettingsUseCase.call();
          emit(SettingsState.success(settings));
        } catch (_) {
          emit(SettingsState.error('Ошибка сохранения темы'));
        }

      },
      updateAppLocalization: (locale) async {
        try {
          await updateAppLocalizationUseCase.call(locale);
          final settings = await getAppSettingsUseCase.call();
          emit(SettingsState.success(settings));
        } catch (_) {
          emit(SettingsState.error('Ошибка сохранения локализации'));
        }
      },
    );
  }
}
