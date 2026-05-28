import 'package:flutter/material.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/core/widgets/user_avatar.dart';
import 'package:sfu/src/feature/attendance/domain/entity/attendance_student.dart';

class JournalStudentRow extends StatelessWidget {
  const JournalStudentRow({
    super.key,
    required this.student,
    required this.onMarkManual,
    required this.onStatusChanged,
  });

  final AttendanceStudent student;
  final VoidCallback onMarkManual;
  final ValueChanged<AttendanceStatus> onStatusChanged;

  static const _statusColors = {
    AttendanceStatus.present: (bg: Color(0x1A10B981), fg: Color(0xFF047857)),
    AttendanceStatus.absent:  (bg: Color(0x1AEF4444), fg: Color(0xFFB91C1C)),
    AttendanceStatus.late:    (bg: Color(0x1FF59E0B), fg: Color(0xFFB45309)),
    AttendanceStatus.excused: (bg: Color(0x1A6366F1), fg: Color(0xFF4338CA)),
  };

  static const _statusLabels = {
    AttendanceStatus.present: 'Присут.',
    AttendanceStatus.absent:  'Отсутст.',
    AttendanceStatus.late:    'Опоздал',
    AttendanceStatus.excused: 'УВ',
  };

  static const _statusIcons = {
    AttendanceStatus.present: Icons.check_circle_outline,
    AttendanceStatus.absent:  Icons.cancel_outlined,
    AttendanceStatus.late:    Icons.watch_later_outlined,
    AttendanceStatus.excused: Icons.info_outline,
  };

  String _shortName(String fullName) {
    final parts = fullName.trim().split(' ');
    if (parts.length == 1) return parts[0];
    final first  = parts.length > 1 ? '${parts[1][0]}.' : '';
    final middle = parts.length > 2 ? '${parts[2][0]}.' : '';
    return '${parts[0]} $first$middle';
  }

  void _showActions(BuildContext context) {
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

    showModalBottomSheet(
      context: context,
      backgroundColor: cs.surface,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppTheme.radiusLg))),
      builder: (_) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 36, height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                    color: ext.border,
                    borderRadius: BorderRadius.circular(2)),
              ),
            ),
            Text(student.name.split(' ').first, style: tt.titleMedium),
            const SizedBox(height: 12),

            // Ручная отметка через API
            if (student.status == AttendanceStatus.absent)
              ListTile(
                dense: true,
                leading: Container(
                  width: 32, height: 32,
                  decoration: BoxDecoration(
                      color: const Color(0x1A10B981), shape: BoxShape.circle),
                  child: const Icon(Icons.edit_outlined,
                      size: 16, color: Color(0xFF047857)),
                ),
                title: Text('Отметить вручную',
                    style: tt.labelLarge?.copyWith(
                        fontWeight: FontWeight.w600)),
                subtitle: Text('POST /attendance/manual',
                    style: tt.labelSmall
                        ?.copyWith(color: ext.textTertiary)),
                onTap: () {
                  onMarkManual();
                  Navigator.pop(context);
                },
              ),

            // Остальные статусы (локально, без API пока)
            ...AttendanceStatus.values
                .where((s) => s != AttendanceStatus.absent || student.status != AttendanceStatus.absent)
                .map((status) {
              final colors = _statusColors[status]!;
              final isSelected = student.status == status;
              return ListTile(
                dense: true,
                leading: Container(
                  width: 32, height: 32,
                  decoration: BoxDecoration(
                      color: colors.bg, shape: BoxShape.circle),
                  child: Icon(_statusIcons[status], size: 16, color: colors.fg),
                ),
                title: Text(
                  _statusLabels[status]!,
                  style: tt.labelLarge?.copyWith(
                    fontWeight: isSelected
                        ? FontWeight.w700 : FontWeight.w400,
                  ),
                ),
                trailing: isSelected
                    ? Icon(Icons.check, color: cs.primary, size: 18)
                    : null,
                onTap: () {
                  onStatusChanged(status);
                  Navigator.pop(context);
                },
              );
            }),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ext    = Theme.of(context).extension<AppColors>()!;
    final tt     = Theme.of(context).textTheme;
    final colors = _statusColors[student.status]!;
    final label  = _statusLabels[student.status]!;
    final icon   = _statusIcons[student.status]!;

    return InkWell(
      onTap: () => _showActions(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            UserAvatar(name: student.name, size: 36),
            const SizedBox(width: 12),

            Expanded(
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      _shortName(student.name),
                      style: tt.labelLarge?.copyWith(fontSize: 14),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (student.isHeadman) ...[
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: ext.infoBg,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text('Ст.',
                          style: TextStyle(
                            fontSize: 9, fontWeight: FontWeight.w700,
                            color: ext.infoFg, height: 1,
                          )),
                    ),
                  ],
                  if (student.markedAt != null) ...[
                    const SizedBox(width: 6),
                    Text(
                      _formatTime(student.markedAt!),
                      style: tt.labelSmall
                          ?.copyWith(color: ext.textTertiary),
                    ),
                  ],
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: colors.bg,
                borderRadius: BorderRadius.circular(AppTheme.radiusSm),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, size: 12, color: colors.fg),
                  const SizedBox(width: 4),
                  Text(label,
                      style: TextStyle(
                        fontSize: 11, fontWeight: FontWeight.w600,
                        color: colors.fg, height: 1,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime dt) =>
      '${dt.hour.toString().padLeft(2, '0')}:'
          '${dt.minute.toString().padLeft(2, '0')}';
}