import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/core/widgets/detail_sheet.dart';
import 'package:sfu/src/feature/department/domain/entity/staff_member.dart';
import 'package:sfu/src/feature/department/presentation/widgets/shared/department_initials_avatar.dart';
import 'package:sfu/src/feature/department/presentation/widgets/shared/department_tag.dart';
import 'package:sfu/src/feature/department/presentation/widgets/staff_detail_sheet.dart';

class StaffCard extends StatelessWidget {
  const StaffCard({super.key, required this.member});
  final StaffMember member;

  @override
  Widget build(BuildContext context) {
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => showDetailSheet(
        context: context,
        child: StaffDetailSheet(member: member),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: cs.surface,
          borderRadius: BorderRadius.circular(AppTheme.radiusLg),
          border: Border.all(color: ext.border),
        ),
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DepartmentInitialsAvatar(name: member.name, size: 52),
            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    member.name,
                    style: tt.labelLarge?.copyWith(
                        fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    member.degree.isNotEmpty
                        ? '${member.position} · ${member.degree}'
                        : member.position,
                    style: tt.labelSmall?.copyWith(color: ext.textSecondary),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: member.tags
                        .take(3)
                        .map((t) => DepartmentTag(label: t))
                        .toList(),
                  ),
                ],
              ),
            ),

            Icon(Icons.chevron_right, size: 20, color: ext.textTertiary),
          ],
        ),
      ),
    );
  }
}