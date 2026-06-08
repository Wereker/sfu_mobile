import 'package:flutter/material.dart';
import 'package:sfu/src/core/l10n/strings.g.dart';
import 'package:sfu/src/core/theme/app_theme.dart';

class WeekPill extends StatelessWidget {
  const WeekPill({
    super.key,
    required this.selected,
    required this.onChanged,
    required this.cs,
    required this.ext,
    required this.tt,
  });

  final String selected;
  final ValueChanged<String> onChanged;
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return Container(
      decoration: BoxDecoration(
        color: ext.surfaceTinted,
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
      ),
      padding: const EdgeInsets.all(3),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _PillSegment(
            label: t.timetable.weekOdd,
            value: '1',
            selected: selected,
            onChanged: onChanged,
            cs: cs,
            ext: ext,
            tt: tt,
          ),
          _PillSegment(
            label: t.timetable.weekEven,
            value: '2',
            selected: selected,
            onChanged: onChanged,
            cs: cs,
            ext: ext,
            tt: tt,
          ),
        ],
      ),
    );
  }
}

class _PillSegment extends StatelessWidget {
  const _PillSegment({
    required this.label,
    required this.value,
    required this.selected,
    required this.onChanged,
    required this.cs,
    required this.ext,
    required this.tt,
  });

  final String label, value, selected;
  final ValueChanged<String> onChanged;
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    final isSelected = value == selected;
    return GestureDetector(
      onTap: () => onChanged(value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
        decoration: BoxDecoration(
          color: isSelected ? cs.surface : cs.surface.withValues(alpha: 0),
          borderRadius: BorderRadius.circular(AppTheme.radiusSm),
        ),
        child: Text(
          label,
          style: tt.labelLarge?.copyWith(
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            color: isSelected ? ext.textPrimary : ext.textSecondary,
          ),
        ),
      ),
    );
  }
}
