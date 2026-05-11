import 'package:flutter/material.dart';
import 'package:sfu/src/core/theme/app_theme.dart';

class AttendanceEmptyView extends StatelessWidget {
  const AttendanceEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(top: 64),
      child: Column(
        children: [
          Icon(Icons.coffee_outlined, size: 40, color: ext.textTertiary),
          const SizedBox(height: 12),
          Text('Пар нет, отдыхай',
              style: tt.bodyMedium?.copyWith(color: ext.textSecondary)),
        ],
      ),
    );
  }
}