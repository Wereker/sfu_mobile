import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/feature/settings/presentation/bloc/settings_bloc.dart';

class AppSettingsCard extends StatelessWidget {
  const AppSettingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        final settings = state.maybeWhen(success: (s) => s, orElse: () => null);
        final themeMode = settings?.themeMode ?? 'light';
        final locale    = settings?.locale ?? 'ru';

        return Container(
          decoration: BoxDecoration(
            color: cs.surface,
            borderRadius: BorderRadius.circular(AppTheme.radiusLg),
            border: Border.all(color: ext.border),
          ),
          child: Column(
            children: [
              // ── Тема ──
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 14, 16, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          themeMode == 'dark'
                              ? Icons.dark_mode_outlined
                              : Icons.light_mode_outlined,
                          size: 18,
                          color: ext.textSecondary,
                        ),
                        const SizedBox(width: 10),
                        Text('Тема', style: tt.labelLarge),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        _ThemeButton(
                          label: 'Светлая',
                          icon: Icons.light_mode_outlined,
                          isSelected: themeMode == 'light',
                          onTap: () => context.read<SettingsBloc>().add(
                            SettingsEvent.updateAppThemeMode(
                                themeMode: 'light'),
                          ),
                        ),
                        const SizedBox(width: 5),
                        _ThemeButton(
                          label: 'Тёмная',
                          icon: Icons.dark_mode_outlined,
                          isSelected: themeMode == 'dark',
                          onTap: () => context.read<SettingsBloc>().add(
                            SettingsEvent.updateAppThemeMode(
                                themeMode: 'dark'),
                          ),
                        ),
                        const SizedBox(width: 5),
                        _ThemeButton(
                          label: 'Системная',
                          icon: Icons.brightness_auto_outlined,
                          isSelected: themeMode == 'system',
                          onTap: () => context.read<SettingsBloc>().add(
                            SettingsEvent.updateAppThemeMode(
                                themeMode: 'system'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Divider(height: 1, color: ext.divider, indent: 16),

              // ── Язык ──
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.language_outlined,
                            size: 18, color: ext.textSecondary),
                        const SizedBox(width: 10),
                        Text('Язык', style: tt.labelLarge),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        _ThemeButton(
                          label: 'Русский',
                          isSelected: locale == 'ru',
                          onTap: () => context.read<SettingsBloc>().add(
                            SettingsEvent.updateAppLocalization(
                                locale: 'ru'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        _ThemeButton(
                          label: 'English',
                          isSelected: locale == 'en',
                          onTap: () => context.read<SettingsBloc>().add(
                            SettingsEvent.updateAppLocalization(
                                locale: 'en'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ThemeButton extends StatelessWidget {
  const _ThemeButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.icon,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          decoration: BoxDecoration(
            color: isSelected ? cs.primary.withValues(alpha: .12) : ext.surfaceTinted,
            borderRadius: BorderRadius.circular(AppTheme.radiusMd),
            border: Border.all(
              color: isSelected ? cs.primary : ext.border,
              width: isSelected ? 1.5 : 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  size: 14,
                  color: isSelected ? cs.primary : ext.textSecondary,
                ),
                const SizedBox(width: 5),
              ],
              Text(
                label,
                style: tt.labelLarge?.copyWith(
                  fontSize: 12,
                  color: isSelected ? cs.primary : ext.textSecondary,
                  fontWeight:
                  isSelected ? FontWeight.w700 : FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}