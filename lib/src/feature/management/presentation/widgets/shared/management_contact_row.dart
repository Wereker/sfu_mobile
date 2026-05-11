import 'package:flutter/material.dart';
import 'package:sfu/src/core/theme/app_theme.dart';

class ManagementContactRow extends StatelessWidget {
  const ManagementContactRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label, value;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

    return Row(
      children: [
        Icon(icon, size: 16, color: ext.textTertiary),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: tt.labelSmall?.copyWith(color: ext.textSecondary)),
            Text(value, style: tt.labelLarge),
          ],
        ),
      ],
    );
  }
}