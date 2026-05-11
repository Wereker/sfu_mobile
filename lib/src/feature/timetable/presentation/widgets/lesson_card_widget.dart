import 'package:flutter/material.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/core/utils/timetable_utils/lesson_status/lesson_status.dart';
import 'package:sfu/src/core/utils/timetable_utils/timetable_utils.dart';
import 'package:sfu/src/feature/timetable/domain/entity/lesson/lesson.dart';

class LessonCard extends StatelessWidget {
  const LessonCard({
    super.key,
    required this.lesson,
    required this.index,
    required this.isToday,
    required this.now,
    required this.cs,
    required this.ext,
    required this.tt,
  });

  final Lesson lesson;
  final int index;
  final bool isToday;
  final DateTime now;
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  String _lessonIndex(String time) {
    const map = {
      '8:30-10:05': '1',
      '10:15-11:50': '2',
      '12:00-13:35': '3',
      '14:10-15:45': '4',
      '15:55-17:30': '5',
      '17:40-19:15': '6',
    };
    return map[time] ?? '$index';
  }

  Color _typeBg(AppColors e) {
    switch (lesson.type) {
      case 'лекция':
        return e.infoBg;
      case 'пр. занятие':
        return e.successBg;
      case 'лаб. работа':
        return e.warningBg;
      default:
        return e.divider;
    }
  }

  Color _typeFg(AppColors e) {
    switch (lesson.type) {
      case 'лекция':
        return e.infoFg;
      case 'пр. занятие':
        return e.successFg;
      case 'лаб. работа':
        return e.warningFg;
      default:
        return e.textSecondary;
    }
  }

  Color _statusBg(LessonStatus s, AppColors e) => s.maybeWhen(
    inProgress: (_) => e.successBg,
    willEndIn: (_) => e.warningBg,
    willStartIn: (_) => e.infoBg,
    orElse: () => e.divider,
  );

  Color _statusFg(LessonStatus s, AppColors e) => s.maybeWhen(
    inProgress: (_) => e.successFg,
    willEndIn: (_) => e.warningFg,
    willStartIn: (_) => e.infoFg,
    orElse: () => e.textSecondary,
  );

  bool _showStatus(LessonStatus s, bool isFirst) => s.when(
    notToday: () => false,
    finished: () => false,
    willStartIn: (_) => isFirst,
    inProgress: (_) => true,
    willEndIn: (_) => true,
  );

  @override
  Widget build(BuildContext context) {
    final status = isToday
        ? TimetableUtils.getLessonStatus(lesson.time, now)
        : const LessonStatus.notToday();
    final statusText = TimetableUtils.formatLessonStatus(status);
    final showStatus = _showStatus(status, index == 1) && statusText.isNotEmpty;

    final sBg = _statusBg(status, ext);
    final sFg = _statusFg(status, ext);

    final isInProgress = status.maybeWhen(
      inProgress: (_) => true,
      orElse: () => false,
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(AppTheme.radiusLg),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: isInProgress ? ext.surfaceTinted : cs.surface,
              borderRadius: BorderRadius.circular(AppTheme.radiusLg),
              border: Border.all(color: ext.border),
            ),
            padding: const EdgeInsets.fromLTRB(19, 14, 14, 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: isToday ? sBg : ext.divider,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        _lessonIndex(lesson.time),
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          height: 1,
                          color: isToday ? sFg : ext.textSecondary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),

                    if (lesson.type.isNotEmpty)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 7,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: _typeBg(ext),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          lesson.type,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            height: 1,
                            color: _typeFg(ext),
                          ),
                        ),
                      ),

                    const Spacer(),

                    // Время
                    Text(
                      lesson.time,
                      style: tt.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: isToday ? sFg : ext.textSecondary,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                Text(
                  lesson.subject,
                  style: tt.titleMedium?.copyWith(fontSize: 15),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),

                if (showStatus) ...[
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: sBg,
                      borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                    ),
                    child: Text(
                      statusText,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        height: 1,
                        color: sFg,
                      ),
                    ),
                  ),
                ],

                const SizedBox(height: 10),

                if (lesson.teacher.isNotEmpty ||
                    lesson.groups.isNotEmpty ||
                    lesson.place.isNotEmpty)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: lesson.teacher.isNotEmpty
                            ? _MetaRow(
                                icon: Icons.person_outline,
                                label: lesson.teacher,
                                ext: ext,
                                tt: tt,
                              )
                            : _MetaRow(
                                icon: Icons.groups_outlined,
                                label: lesson.groups
                                    .where((g) => g.isNotEmpty)
                                    .join(', '),
                                ext: ext,
                                tt: tt,
                              ),
                      ),
                      if (lesson.place.isNotEmpty) ...[
                        const SizedBox(width: 8),
                        _MetaRow(
                          icon: Icons.location_on_outlined,
                          label: lesson.place.length > 30
                              ? lesson.building
                              : lesson.place,
                          ext: ext,
                          tt: tt,
                        ),
                      ],
                    ],
                  ),
              ],
            ),
          ),

          if (isInProgress)
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Container(width: 3, color: cs.primary),
            ),
        ],
      ),
    );
  }
}

class _MetaRow extends StatelessWidget {
  const _MetaRow({
    required this.icon,
    required this.label,
    required this.ext,
    required this.tt,
  });

  final IconData icon;
  final String label;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 14, color: ext.textTertiary),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            label,
            style: tt.labelLarge?.copyWith(
              color: ext.textSecondary,
              fontWeight: FontWeight.w400,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
