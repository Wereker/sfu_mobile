import 'package:flutter/material.dart';
import 'package:sfu/src/core/theme/app_theme.dart';

class DepartmentTag extends StatelessWidget {
  const DepartmentTag({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: ext.surfaceTinted,
        borderRadius: BorderRadius.circular(AppTheme.radiusSm),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: ext.textOnTinted,
          height: 1,
        ),
      ),
    );
  }
}