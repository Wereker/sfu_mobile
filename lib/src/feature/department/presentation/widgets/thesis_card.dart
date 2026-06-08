import 'package:flutter/material.dart';
import 'package:sfu/src/core/l10n/strings.g.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/core/widgets/detail_sheet.dart';
import 'package:sfu/src/feature/department/presentation/widgets/shared/department_initials_avatar.dart';
import 'package:sfu/src/feature/department/presentation/widgets/shared/department_tag.dart';
import 'package:sfu/src/feature/department/presentation/widgets/thesis_tab.dart';

class ThesisCard extends StatelessWidget {
  const ThesisCard({super.key, required this.thesis});
  final ThesisData thesis;

  @override
  Widget build(BuildContext context) {
    final t   = Translations.of(context);
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => showDetailSheet(
        context: context,
        child: _ThesisDetailSheet(thesis: thesis),
      ),
      child: Container(
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
                    style: tt.labelLarge
                        ?.copyWith(fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 9, vertical: 4),
                  decoration: BoxDecoration(
                    color: thesis.isFree ? ext.successBg : ext.errorBg,
                    borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                  ),
                  child: Text(
                    thesis.isFree
                        ? t.department.theses.free
                        : t.department.theses.taken,
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
                DepartmentInitialsAvatar(name: thesis.professor, size: 28),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    thesis.takenBy != null
                        ? '${thesis.professor} · ${t.department.theses.takenBy(name: thesis.takenBy!)}'
                        : thesis.professor,
                    style: tt.labelSmall?.copyWith(color: ext.textSecondary),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(Icons.chevron_right, size: 18, color: ext.textTertiary),
              ],
            ),

            if (thesis.tags.isNotEmpty) ...[
              const SizedBox(height: 10),
              Wrap(
                spacing: 6,
                runSpacing: 4,
                children: thesis.tags
                    .map((tag) => DepartmentTag(label: tag))
                    .toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ThesisDetailSheet extends StatefulWidget {
  const _ThesisDetailSheet({required this.thesis});
  final ThesisData thesis;

  @override
  State<_ThesisDetailSheet> createState() => _ThesisDetailSheetState();
}

class _ThesisDetailSheetState extends State<_ThesisDetailSheet> {
  bool _applied = false;

  @override
  Widget build(BuildContext context) {
    final t      = Translations.of(context);
    final ext    = Theme.of(context).extension<AppColors>()!;
    final tt     = Theme.of(context).textTheme;
    final thesis = widget.thesis;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: thesis.isFree ? ext.successBg : ext.errorBg,
                borderRadius: BorderRadius.circular(AppTheme.radiusSm),
              ),
              child: Text(
                thesis.isFree
                    ? t.department.theses.free
                    : t.department.theses.taken,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: thesis.isFree ? ext.successFg : ext.errorFg,
                  height: 1,
                ),
              ),
            ),
            const SizedBox(width: 8),
            ...thesis.tags.take(2).map(
                  (tag) => Padding(
                padding: const EdgeInsets.only(right: 6),
                child: DepartmentTag(label: tag),
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        Text(thesis.title,
            style: tt.titleLarge?.copyWith(fontWeight: FontWeight.w700)),

        const SizedBox(height: 14),

        Row(
          children: [
            DepartmentInitialsAvatar(name: thesis.professor, size: 40),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(thesis.professor, style: tt.labelLarge),
                  if (thesis.takenBy != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      t.department.theses.takenBy(name: thesis.takenBy!),
                      style: tt.labelSmall?.copyWith(color: ext.textSecondary),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),

        Divider(color: ext.divider, height: 24),

        Text(t.department.theses.descTitle,
            style: tt.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Text(
          thesis.description,
          style: tt.bodyLarge
              ?.copyWith(fontSize: 15, height: 1.6, color: ext.textPrimary),
        ),

        const SizedBox(height: 16),

        Text(t.department.theses.requiresTitle,
            style: tt.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: ext.surfaceTinted,
            borderRadius: BorderRadius.circular(AppTheme.radiusMd),
          ),
          child: Text(
            thesis.requirements,
            style: tt.bodyMedium?.copyWith(color: ext.textOnTinted, height: 1.5),
          ),
        ),

        const SizedBox(height: 24),

        if (thesis.isFree)
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: _applied ? null : () => setState(() => _applied = true),
              style: _applied
                  ? ElevatedButton.styleFrom(
                backgroundColor: ext.successBg,
                foregroundColor: ext.successFg,
              )
                  : null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    _applied
                        ? Icons.check_circle_outline
                        : Icons.send_outlined,
                    size: 18,
                  ),
                  const SizedBox(width: 8),
                  Text(_applied
                      ? t.department.theses.applied
                      : t.department.theses.apply),
                ],
              ),
            ),
          )
        else
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: ext.errorBg,
              borderRadius: BorderRadius.circular(AppTheme.radiusMd),
            ),
            child: Row(
              children: [
                Icon(Icons.lock_outline, size: 16, color: ext.errorFg),
                const SizedBox(width: 8),
                Text(
                  t.department.theses.lockedBy(name: thesis.takenBy ?? ''),
                  style: tt.labelLarge?.copyWith(color: ext.errorFg),
                ),
              ],
            ),
          ),
      ],
    );
  }
}