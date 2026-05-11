import 'package:flutter/material.dart';
import 'package:sfu/src/core/theme/app_theme.dart';

class DayChip extends StatelessWidget {
  const DayChip({
    super.key,
    required this.dow,
    required this.num,
    required this.isActive,
    required this.hasClasses,
    required this.isCurrentDay,
    required this.cs,
    required this.ext,
    required this.tt,
    required this.onTap,
  });

  final String dow;
  final int num;
  final bool isActive, hasClasses, isCurrentDay;
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
          color: isActive ? cs.primary : cs.surface,
          borderRadius: BorderRadius.circular(AppTheme.radiusMd),
          border: Border.all(
            color: isActive
                ? cs.primary
                : isCurrentDay
                ? cs.primary.withValues(alpha: .4)
                : ext.border,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              dow,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                height: 1,
                letterSpacing: 0.4,
                color: isActive ? cs.onPrimary : ext.textSecondary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '$num',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                height: 1,
                color: isActive ? cs.onPrimary : ext.textPrimary,
              ),
            ),
            const SizedBox(height: 4),
            // Точка — есть ли занятия
            Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: hasClasses
                    ? (isActive
                          ? cs.onPrimary.withValues(alpha: .7)
                          : cs.primary)
                    : Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
