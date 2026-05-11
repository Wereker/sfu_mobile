import 'package:flutter/material.dart';
import 'package:sfu/src/core/theme/app_theme.dart';

class AttendanceSmallButton extends StatelessWidget {
  const AttendanceSmallButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: ext.surfaceTinted,
          borderRadius: BorderRadius.circular(AppTheme.radiusSm),
        ),
        child: Row(
          children: [
            Icon(icon, size: 13, color: ext.textOnTinted),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w500,
                color: ext.textOnTinted, height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}