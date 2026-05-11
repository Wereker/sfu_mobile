import 'package:flutter/material.dart';
import 'package:sfu/src/core/theme/app_theme.dart';

class DepartmentFilterChip extends StatelessWidget {
  const DepartmentFilterChip({
    super.key,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
          color: isActive ? cs.primary : ext.surfaceTinted,
          borderRadius: BorderRadius.circular(AppTheme.radiusSm),
        ),
        child: Text(
          label,
          style: tt.labelLarge?.copyWith(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: isActive ? cs.onPrimary : ext.textOnTinted,
          ),
        ),
      ),
    );
  }
}