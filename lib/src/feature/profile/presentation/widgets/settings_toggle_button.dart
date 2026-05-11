import 'package:flutter/material.dart';
import 'package:sfu/src/core/theme/app_theme.dart';

class SettingsToggleRow extends StatelessWidget {
  const SettingsToggleRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.onChanged,
    required this.isLast,
  });

  final IconData icon;
  final String label;
  final bool value, isLast;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 18, color: ext.textTertiary),
          const SizedBox(width: 12),
          Expanded(child: Text(label, style: tt.labelLarge)),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: cs.primary,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ],
      ),
    );
  }
}