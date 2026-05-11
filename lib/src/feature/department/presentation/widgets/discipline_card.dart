import 'package:flutter/material.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/feature/department/presentation/widgets/disciplines_tab.dart';

class DisciplineCard extends StatelessWidget {
  const DisciplineCard({super.key, required this.discipline});
  final DisciplineData discipline;

  @override
  Widget build(BuildContext context) {
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        border: Border.all(color: ext.border),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(discipline.name,
                        style: tt.labelLarge?.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 15)),
                    const SizedBox(height: 3),
                    Text(discipline.professor,
                        style: tt.labelSmall
                            ?.copyWith(color: ext.textSecondary)),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: ext.surfaceTinted,
                  borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                ),
                child: Text(
                  '${discipline.credits} з.е.',
                  style: tt.labelSmall?.copyWith(
                      color: ext.textOnTinted, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: ext.surfaceTinted,
                foregroundColor: ext.textOnTinted,
                elevation: 0,
                side: BorderSide.none,
              ),
              child: const Text('Записаться'),
            ),
          ),
        ],
      ),
    );
  }
}