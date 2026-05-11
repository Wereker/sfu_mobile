import 'package:flutter/material.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/feature/profile/domain/entity/user.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.user,
    required this.fullName,
  });

  final User user;
  final String fullName;

  bool get _isTeacher => user.role == 'teacher';

  static const _hues = [
    Color(0xFFFF9900), Color(0xFFFFB84D), Color(0xFFE68A00),
    Color(0xFFCC7A00), Color(0xFFFFA726), Color(0xFFFB8C00),
  ];

  Color _avatarColor(String name) {
    int h = 0;
    for (final c in name.codeUnits) { h = (h * 31 + c) & 0x7FFFFFFF; }
    return _hues[h % _hues.length];
  }

  String _initials(String name) => name
      .split(' ')
      .where((p) => p.isNotEmpty)
      .take(2)
      .map((p) => p[0])
      .join()
      .toUpperCase();

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
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 64, height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _avatarColor(fullName),
            ),
            alignment: Alignment.center,
            child: Text(
              _initials(fullName),
              style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.w700,
                color: Colors.white, height: 1,
              ),
            ),
          ),
          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(fullName, style: tt.titleMedium),
                const SizedBox(height: 4),

                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 9, vertical: 4),
                  decoration: BoxDecoration(
                    color: _isTeacher ? ext.warningBg : ext.infoBg,
                    borderRadius:
                    BorderRadius.circular(AppTheme.radiusSm),
                  ),
                  child: Text(
                    _isTeacher ? 'Преподаватель' : 'Студент',
                    style: TextStyle(
                      fontSize: 11, fontWeight: FontWeight.w600,
                      color: _isTeacher ? ext.warningFg : ext.infoFg,
                      height: 1,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                if (!_isTeacher) ...[
                  _MetaLine(
                    icon: Icons.groups_outlined,
                    label: '${user.groupName ?? ''} · ${user.subgroup ?? ''} подгруппа',
                  ),
                  if (user.sex != null && user.sex!.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    _MetaLine(icon: Icons.person_outline, label: user.sex!),
                  ],
                  const SizedBox(height: 4),
                  _MetaLine(
                    icon: Icons.badge_outlined,
                    label: 'Зачётная книжка №${user.recordBookNumber ?? ''}',
                  ),
                  const SizedBox(height: 4),
                  _MetaLine(
                    icon: Icons.account_balance_outlined,
                    label: user.institute ?? '',
                  ),
                ],

                if (_isTeacher) ...[
                  _MetaLine(
                    icon: Icons.account_balance_outlined,
                    label: user.institute ?? '',
                  ),
                  if (user.position != null && user.position!.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    _MetaLine(
                      icon: Icons.work_outline,
                      label: user.position!,
                    ),
                  ],
                  if (user.degree != null && user.degree!.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    _MetaLine(
                      icon: Icons.school_outlined,
                      label: user.degree!,
                    ),
                  ],
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MetaLine extends StatelessWidget {
  const _MetaLine({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

    return Row(
      children: [
        Icon(icon, size: 14, color: ext.textTertiary),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            label,
            style: tt.labelSmall?.copyWith(color: ext.textSecondary),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}