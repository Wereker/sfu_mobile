import 'package:flutter/material.dart';
import 'package:sfu/src/core/theme/app_theme.dart';

class EmptyDay extends StatelessWidget {
  const EmptyDay({super.key, required this.ext, required this.tt});
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 64),
      child: Column(
        children: [
          Icon(Icons.coffee_outlined, size: 40, color: ext.textTertiary),
          const SizedBox(height: 12),
          Text(
            'Занятий нет, отдыхай',
            style: tt.bodyMedium?.copyWith(color: ext.textSecondary),
          ),
        ],
      ),
    );
  }
}
