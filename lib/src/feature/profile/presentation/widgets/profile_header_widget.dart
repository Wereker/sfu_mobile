import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/core/widgets/detail_sheet.dart';
import 'package:sfu/src/core/widgets/user_avatar.dart';
import 'package:sfu/src/feature/profile/domain/entity/user.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.user,
    required this.onAvatarChanged,
  });

  final User user;

  final ValueChanged<String> onAvatarChanged;

  String _roleLabel(UserRole role) {
    switch (role) {
      case UserRole.student: return 'Студент';
      case UserRole.teacher: return 'Преподаватель';
      case UserRole.admin:   return 'Администратор';
      case UserRole.unknown: return 'Пользователь';
    }
  }

  bool get _isTeacher =>
      user.role == UserRole.teacher || user.role == UserRole.admin;

  Future<void> _pickAvatar(BuildContext context) async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
      maxWidth: 512,
      maxHeight: 512,
    );
    if (picked != null && context.mounted) {
      onAvatarChanged(picked.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => showDetailSheet(
        context: context,
        child: _ProfileDetailSheet(user: user),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: cs.surface,
          borderRadius: BorderRadius.circular(AppTheme.radiusLg),
          border: Border.all(color: ext.border),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Аватар с кнопкой выбора
            UserAvatar(
              name: user.fullName,
              avatarUrl: user.avatarUrl,
              size: 72,
              fontSize: 24,
              onTap: () => _pickAvatar(context),
              badge: Container(
                width: 22, height: 22,
                decoration: BoxDecoration(
                  color: cs.primary,
                  shape: BoxShape.circle,
                  border: Border.all(color: cs.surface, width: 2),
                ),
                child: Icon(Icons.edit_outlined, size: 11, color: cs.onPrimary),
              ),
            ),
            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.fullName, style: tt.titleMedium),
                  const SizedBox(height: 4),
                  Text(
                    user.email,
                    style: tt.bodySmall?.copyWith(color: ext.textSecondary),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 9, vertical: 4),
                    decoration: BoxDecoration(
                      color: _isTeacher ? ext.warningBg : ext.infoBg,
                      borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                    ),
                    child: Text(
                      _roleLabel(user.role),
                      style: TextStyle(
                        fontSize: 11, fontWeight: FontWeight.w600,
                        color: _isTeacher ? ext.warningFg : ext.infoFg,
                        height: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Подсказка что можно открыть детали
            Icon(Icons.chevron_right, color: ext.textTertiary, size: 20),
          ],
        ),
      ),
    );
  }
}

// ── Шторка с подробной информацией ──────────────────────────────────────────

class _ProfileDetailSheet extends StatelessWidget {
  const _ProfileDetailSheet({
    required this.user,
  });

  final User user;

  bool get _isTeacher =>
      user.role == UserRole.teacher || user.role == UserRole.admin;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Шапка шторки
        Row(
          children: [
            UserAvatar(
              name: user.fullName,
              avatarUrl: user.avatarUrl,
              size: 56,
              fontSize: 20,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.fullName, style: tt.titleMedium),
                  const SizedBox(height: 2),
                  Text(user.email,
                      style: tt.bodySmall
                          ?.copyWith(color: ext.textSecondary)),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),
        Divider(color: ext.divider, height: 1),
        const SizedBox(height: 16),

        // Детали студента
        if (!_isTeacher) ...[
          if (user.groupName != null && user.groupName!.isNotEmpty)
            _DetailRow(
              icon: Icons.groups_outlined,
              label: 'Группа',
              value: user.subgroup != null
                  ? '${user.groupName} · ${user.subgroup} подгруппа'
                  : user.groupName!,
            ),
          if (user.stream != null && user.stream!.isNotEmpty)
            _DetailRow(
              icon: Icons.linear_scale_outlined,
              label: 'Поток',
              value: user.stream!,
            ),
          if (user.institute != null && user.institute!.isNotEmpty)
            _DetailRow(
              icon: Icons.account_balance_outlined,
              label: 'Институт',
              value: user.institute!,
            ),
          if (user.recordBookNumber != null &&
              user.recordBookNumber!.isNotEmpty)
            _DetailRow(
              icon: Icons.badge_outlined,
              label: 'Зачётная книжка',
              value: user.recordBookNumber!,
            ),
          if (user.birthdate != null)
            _DetailRow(
              icon: Icons.cake_outlined,
              label: 'Дата рождения',
              value: _formatDate(user.birthdate!),
            ),
          if (user.sex != null && user.sex!.isNotEmpty)
            _DetailRow(
              icon: Icons.person_outline,
              label: 'Пол',
              value: user.sex == 'male' ? 'Мужской' : 'Женский',
            ),
        ],

        // Детали преподавателя
        if (_isTeacher) ...[
          if (user.position != null && user.position!.isNotEmpty)
            _DetailRow(
              icon: Icons.work_outline,
              label: 'Должность',
              value: user.position!,
            ),
          if (user.degree != null && user.degree!.isNotEmpty)
            _DetailRow(
              icon: Icons.school_outlined,
              label: 'Учёная степень',
              value: user.degree!,
            ),
          if (user.department != null && user.department!.isNotEmpty)
            _DetailRow(
              icon: Icons.meeting_room_outlined,
              label: 'Кафедра',
              value: user.department!,
            ),
          if (user.institute != null && user.institute!.isNotEmpty)
            _DetailRow(
              icon: Icons.account_balance_outlined,
              label: 'Институт',
              value: user.institute!,
            ),
          if (user.tags.isNotEmpty) ...[
            const SizedBox(height: 8),
            Wrap(
              spacing: 6, runSpacing: 6,
              children: user.tags.map((tag) => _TagChip(label: tag)).toList(),
            ),
          ],
        ],
      ],
    );
  }

  String _formatDate(DateTime date) {
    const months = [
      '', 'января', 'февраля', 'марта', 'апреля', 'мая', 'июня',
      'июля', 'августа', 'сентября', 'октября', 'ноября', 'декабря',
    ];
    return '${date.day} ${months[date.month]} ${date.year}';
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16, color: ext.textTertiary),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: tt.labelSmall?.copyWith(color: ext.textTertiary),
                ),
                const SizedBox(height: 1),
                Text(value, style: tt.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  const _TagChip({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: ext.surfaceTinted,
        borderRadius: BorderRadius.circular(AppTheme.radiusSm),
        border: Border.all(color: ext.border),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11, fontWeight: FontWeight.w500,
          color: ext.textOnTinted, height: 1,
        ),
      ),
    );
  }
}