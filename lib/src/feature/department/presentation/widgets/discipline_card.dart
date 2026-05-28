import 'package:flutter/material.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/core/widgets/detail_sheet.dart';
import 'package:sfu/src/feature/department/presentation/widgets/disciplines_tab.dart';

class DisciplineCard extends StatelessWidget {
  const DisciplineCard({super.key, required this.discipline});
  final DisciplineData discipline;

  @override
  Widget build(BuildContext context) {
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => showDetailSheet(
        context: context,
        child: DisciplineDetailSheet(discipline: discipline),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: cs.surface,
          borderRadius: BorderRadius.circular(AppTheme.radiusLg),
          border: Border.all(color: ext.border),
        ),
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    discipline.name,
                    style: tt.labelLarge?.copyWith(
                        fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    '${discipline.professor} · ${discipline.credits} з.е.',
                    style: tt.labelSmall
                        ?.copyWith(color: ext.textSecondary),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: ext.surfaceTinted,
                borderRadius: BorderRadius.circular(AppTheme.radiusSm),
              ),
              child: Text(
                '${discipline.seats} мест',
                style: tt.labelSmall?.copyWith(
                    color: ext.textOnTinted, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(width: 6),
            Icon(Icons.chevron_right, size: 18, color: ext.textTertiary),
          ],
        ),
      ),
    );
  }
}