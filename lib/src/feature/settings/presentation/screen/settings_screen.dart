import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/app/widgets/custom_app_bar.dart';
import 'package:sfu/src/core/localization/app_localizations.dart';
import 'package:sfu/src/feature/settings/presentation/bloc/settings_bloc.dart';
import 'package:sfu/src/core/widgets/loading_indicator_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(t!.settingsLanguage, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            const SizedBox(height: 8),

            _buildLanguageSelector(),

            const SizedBox(height: 32),
            Text(t.settingsTheme, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            const SizedBox(height: 8),

            _buildThemeSelector(context),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageSelector() {
    return BlocSelector<SettingsBloc, SettingsState, String?>(
      selector: (state) => state.maybeWhen(
        success: (settings) => settings.locale,
        orElse: () => null,
      ),
      builder: (context, locale) {
        if (locale == null) {
          return Center(child: LoadingIndicatorWidget());
        }

        return DropdownButtonFormField<String>(
          key: ValueKey<String>('language_$locale'),
          initialValue: locale,
          items: const [
            DropdownMenuItem(value: 'en', child: Text('English')),
            DropdownMenuItem(value: 'ru', child: Text('Русский')),
          ],
          onChanged: (String? newValue) {
            if (newValue != null && newValue != locale) {
              context.read<SettingsBloc>().add(
                SettingsEvent.updateAppLocalization(locale: newValue),
              );
            }
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        );
      },
    );
  }

  Widget _buildThemeSelector(BuildContext context) {
    final t = AppLocalizations.of(context);

    return BlocSelector<SettingsBloc, SettingsState, String?>(
      selector: (state) => state.maybeWhen(
        success: (settings) => settings.themeMode,
        orElse: () => null,
      ),
      builder: (context, themeMode) {
        if (themeMode == null) {
          return Center(child: LoadingIndicatorWidget());
        }

        return Wrap(
          spacing: 16,
          runSpacing: 8,
          children: [
            _buildThemeOption(context, themeMode, 'system', t!.settingsThemeSystem),
            _buildThemeOption(context, themeMode, 'light', t.settingsThemeLight),
            _buildThemeOption(context, themeMode, 'dark', t.settingsThemeDark),
          ],
        );
      },
    );
  }

  Widget _buildThemeOption(
      BuildContext context,
      String currentThemeMode,
      String value,
      String label,
      ) {
    final isSelected = currentThemeMode == value;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return ChoiceChip(
      key: ValueKey<String>('theme_$value'),
      label: Text(label),
      selected: isSelected,
      selectedColor: isDark
          ? Colors.grey.withValues(alpha: 0.3)
          : Colors.orange.withValues(alpha: 0.2),
      checkmarkColor: isDark
          ? Colors.white
          : Colors.black,
      labelStyle: isDark ? TextStyle(color: Colors.white) : TextStyle(color: Colors.black),
      onSelected: (selected) {
        if (selected && !isSelected) {
          context.read<SettingsBloc>().add(
            SettingsEvent.updateAppThemeMode(themeMode: value),
          );
        }
      },
    );
  }
}
