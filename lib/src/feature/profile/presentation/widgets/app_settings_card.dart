import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/feature/profile/presentation/widgets/settings_toggle_button.dart';
import 'package:sfu/src/feature/settings/presentation/bloc/settings_bloc.dart';

class AppSettingsCard extends StatelessWidget {
  const AppSettingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;

    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        final settings = state.maybeWhen(success: (s) => s, orElse: () => null);
        final isDark = settings?.themeMode == 'dark';
        final isRu   = (settings?.locale ?? 'ru') == 'ru';

        return Container(
          decoration: BoxDecoration(
            color: cs.surface,
            borderRadius: BorderRadius.circular(AppTheme.radiusLg),
            border: Border.all(color: ext.border),
          ),
          child: Column(
            children: [
              SettingsToggleRow(
                icon: isDark
                    ? Icons.dark_mode_outlined
                    : Icons.light_mode_outlined,
                label: 'Тёмная тема',
                value: isDark,
                onChanged: (v) => context.read<SettingsBloc>().add(
                  SettingsEvent.updateAppThemeMode(
                      themeMode: v ? 'dark' : 'light'),
                ),
                isLast: false,
              ),
              Divider(height: 1, color: ext.divider, indent: 16),
              SettingsToggleRow(
                icon: Icons.language_outlined,
                label: 'Русский язык',
                value: isRu,
                onChanged: (v) => context.read<SettingsBloc>().add(
                  SettingsEvent.updateAppLocalization(
                      locale: v ? 'ru' : 'en'),
                ),
                isLast: true,
              ),
            ],
          ),
        );
      },
    );
  }
}