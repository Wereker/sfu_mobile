import 'package:flutter/material.dart';
import 'package:sfu/src/core/theme/app_theme.dart';

class DepartmentSegmentedControl extends StatelessWidget {
  const DepartmentSegmentedControl({
    super.key,
    required this.tabs,
    required this.selected,
    required this.onChanged,
  });

  final List<String> tabs;
  final int selected;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: ext.surfaceTinted,
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        children: List.generate(tabs.length, (i) {
          final isSelected = i == selected;
          return Expanded(
            child: GestureDetector(
              onTap: () => onChanged(i),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                padding: const EdgeInsets.symmetric(vertical: 9),
                decoration: BoxDecoration(
                  color: isSelected
                      ? cs.surface
                      : cs.surface.withValues(alpha: 0),
                  borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                ),
                alignment: Alignment.center,
                child: Text(
                  tabs[i],
                  style: tt.labelLarge?.copyWith(
                    fontWeight:
                    isSelected ? FontWeight.w600 : FontWeight.w500,
                    color: isSelected ? ext.textPrimary : ext.textSecondary,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}