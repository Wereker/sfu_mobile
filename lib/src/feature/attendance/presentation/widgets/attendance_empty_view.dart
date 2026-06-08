import 'package:flutter/material.dart';
import 'package:sfu/src/core/l10n/strings.g.dart';
import 'package:sfu/src/core/theme/app_theme.dart';

class AttendanceEmptyView extends StatelessWidget {
  const AttendanceEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;
    final t   = Translations.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 64),
      child: Column(
        children: [
          Icon(Icons.coffee_outlined, size: 40, color: ext.textTertiary),
          const SizedBox(height: 12),
          Text(t.attendance.noLessons,
              style: tt.bodyMedium?.copyWith(color: ext.textSecondary)),
        ],
      ),
    );
  }
}