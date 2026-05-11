import 'package:flutter/material.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/feature/department/presentation/widgets/shared/department_initials_avatar.dart';
import 'package:sfu/src/feature/department/presentation/widgets/thesis_tab.dart';

class ThesisCard extends StatelessWidget {
  const ThesisCard({super.key, required this.thesis});
  final ThesisData thesis;

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
                child: Text(
                  thesis.title,
                  style: tt.labelLarge?.copyWith(
                      fontWeight: FontWeight.w600, fontSize: 14),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                decoration: BoxDecoration(
                  color: thesis.isFree ? ext.successBg : ext.errorBg,
                  borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                ),
                child: Text(
                  thesis.isFree ? 'Свободна' : 'Занята',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: thesis.isFree ? ext.successFg : ext.errorFg,
                    height: 1,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              DepartmentInitialsAvatar(name: thesis.professor, size: 36),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  thesis.takenBy != null
                      ? '${thesis.professor} · взял ${thesis.takenBy}'
                      : thesis.professor,
                  style: tt.labelSmall?.copyWith(color: ext.textSecondary),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),

          if (thesis.isFree) ...[
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 44,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Подать заявку'),
              ),
            ),
          ],
        ],
      ),
    );
  }
}