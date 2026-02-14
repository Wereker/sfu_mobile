import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/app/widgets/custom_app_bar.dart';
import 'package:sfu/src/core/settings/presentation/bloc/settings_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text('Язык', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),

            _buildLanguageSelector(),

            const SizedBox(height: 32),
            Text('Тема', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),

            _buildThemeSelector(),
          ],
        ),
      ),
    );
  }

  Widget _buildDebugInfo() {
    return BlocSelector<SettingsBloc, SettingsState, String>(
      selector: (state) => state.maybeWhen(
        success: (settings) => 'Язык: ${settings.locale} • Тема: ${settings.themeMode}',
        orElse: () => 'Загрузка настроек...',
      ),
      builder: (context, debugText) => Text(
        debugText,
        style: const TextStyle(fontSize: 12, color: Colors.grey),
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
          return const Center(child: CircularProgressIndicator());
        }

        return DropdownButtonFormField<String>(
          key: ValueKey<String>('language_$locale'),
          value: locale,
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

  Widget _buildThemeSelector() {
    return BlocSelector<SettingsBloc, SettingsState, String?>(
      selector: (state) => state.maybeWhen(
        success: (settings) => settings.themeMode,
        orElse: () => null,
      ),
      builder: (context, themeMode) {
        if (themeMode == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return Wrap(
          spacing: 16,
          runSpacing: 8,
          children: [
            _buildThemeOption(context, themeMode, 'system', 'Системная'),
            _buildThemeOption(context, themeMode, 'light', 'Светлая'),
            _buildThemeOption(context, themeMode, 'dark', 'Тёмная'),
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

    return ChoiceChip(
      key: ValueKey<String>('theme_$value'),
      label: Text(label),
      selected: isSelected,
      selectedColor: Theme.of(context).primaryColor.withOpacity(0.2),
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
