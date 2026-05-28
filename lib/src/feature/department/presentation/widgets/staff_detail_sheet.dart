import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/feature/department/domain/entity/staff_member.dart';
import 'package:sfu/src/feature/department/presentation/widgets/shared/department_initials_avatar.dart';
import 'package:sfu/src/feature/department/presentation/widgets/shared/department_tag.dart';

class StaffDetailSheet extends StatelessWidget {
  const StaffDetailSheet({super.key, required this.member});
  final StaffMember member;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Шапка
        Row(
          children: [
            DepartmentInitialsAvatar(name: member.name, size: 56),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(member.name,
                      style: tt.titleMedium
                          ?.copyWith(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 4),
                  Text(
                    member.degree.isNotEmpty
                        ? '${member.position} · ${member.degree}'
                        : member.position,
                    style: tt.labelSmall?.copyWith(color: ext.textSecondary),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Теги
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: member.tags
              .map((t) => DepartmentTag(label: t))
              .toList(),
        ),

        Divider(color: ext.divider, height: 24),

        // Контакты
        _ContactsBlock(member: member),

        const SizedBox(height: 16),

        // Биография
        if (member.bio != null && member.bio!.isNotEmpty) ...[
          Text('О преподавателе',
              style: tt.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Text(
            member.bio!,
            style: tt.bodyLarge?.copyWith(
                fontSize: 15, height: 1.6, color: ext.textPrimary),
          ),
          const SizedBox(height: 24),
        ],

        // Кнопка «Написать»
        SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.send_outlined, size: 18),
            label: const Text('Написать'),
          ),
        ),
      ],
    );
  }
}

class _ContactsBlock extends StatelessWidget {
  const _ContactsBlock({required this.member});
  final StaffMember member;

  void _copy(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Скопировано')));
  }

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

    final items = <_ContactItem>[
      _ContactItem(icon: Icons.mail_outline, label: 'Почта', value: member.email),
      if (member.phone != null)
        _ContactItem(icon: Icons.phone_outlined, label: 'Телефон', value: member.phone!),
      if (member.telegram != null)
        _ContactItem(icon: Icons.telegram, label: 'Telegram', value: member.telegram!),
    ];

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        border: Border.all(color: ext.border),
      ),
      child: Column(
        children: items.asMap().entries.map((entry) {
          final i = entry.key;
          final item = entry.value;
          final isLast = i == items.length - 1;

          return Column(
            children: [
              InkWell(
                borderRadius: BorderRadius.vertical(
                  top: i == 0
                      ? const Radius.circular(AppTheme.radiusMd)
                      : Radius.zero,
                  bottom: isLast
                      ? const Radius.circular(AppTheme.radiusMd)
                      : Radius.zero,
                ),
                onTap: () => _copy(context, item.value),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14, vertical: 11),
                  child: Row(
                    children: [
                      Icon(item.icon, size: 17, color: ext.textTertiary),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.label,
                                style: tt.labelSmall
                                    ?.copyWith(color: ext.textSecondary)),
                            const SizedBox(height: 2),
                            Text(item.value,
                                style: tt.labelLarge
                                    ?.copyWith(fontWeight: FontWeight.w400)),
                          ],
                        ),
                      ),
                      Icon(Icons.copy_outlined,
                          size: 15, color: ext.textTertiary),
                    ],
                  ),
                ),
              ),
              if (!isLast) Divider(height: 1, color: ext.divider, indent: 14),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class _ContactItem {
  final IconData icon;
  final String label;
  final String value;
  const _ContactItem({
    required this.icon,
    required this.label,
    required this.value,
  });
}