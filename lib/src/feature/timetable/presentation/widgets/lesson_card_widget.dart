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

  // Номер пары по времени начала
  String get _lessonIndex {
    const map = {
      '08:30': '1',
      '10:15': '2',
      '12:00': '3',
      '14:10': '4',
      '15:55': '5',
      '17:40': '6',
    };
    return map[lesson.timeStart] ?? '$index';
  }

  // Время для отображения: "08:30 – 10:05"
  String get _timeLabel => '${lesson.timeStart} – ${lesson.timeEnd}';

  // Строка времени для TimetableUtils: "08:30-10:05"
  String get _timeRange => '${lesson.timeStart}-${lesson.timeEnd}';

  String get _typeLabel {
    switch (lesson.type) {
      case LessonType.lecture:  return 'лекция';
      case LessonType.practice: return 'пр. занятие';
      case LessonType.lab:      return 'лаб. работа';
      case LessonType.unknown:  return '';
    }
  }

  Color _typeBg(AppColors e) {
    switch (lesson.type) {
      case LessonType.lecture:  return e.infoBg;
      case LessonType.practice: return e.successBg;
      case LessonType.lab:      return e.warningBg;
      case LessonType.unknown:  return e.divider;
    }
  }

  Color _typeFg(AppColors e) {
    switch (lesson.type) {
      case LessonType.lecture:  return e.infoFg;
      case LessonType.practice: return e.successFg;
      case LessonType.lab:      return e.warningFg;
      case LessonType.unknown:  return e.textSecondary;
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

  bool _showStatus(LessonStatus s) => s.when(
    notToday: () => false,
    finished: () => false,
    willStartIn: (_) => index == 1,
    inProgress: (_) => true,
    willEndIn: (_) => true,
  );

  @override
  Widget build(BuildContext context) {
    final status = isToday
        ? TimetableUtils.getLessonStatus(_timeRange, now)
        : const LessonStatus.notToday();
    final statusText = TimetableUtils.formatLessonStatus(status);
    final showStatus = _showStatus(status) && statusText.isNotEmpty;

    final sBg = _statusBg(status, ext);
    final sFg = _statusFg(status, ext);

    final isInProgress = status.maybeWhen(
      inProgress: (_) => true,
      orElse: () => false,
    );

    // Место: если онлайн — показываем "ЭИОС", иначе "ауд. room · building"
    final placeLabel = lesson.isOnline
        ? 'ЭИОС'
        : [
      if (lesson.room.isNotEmpty) 'ауд. ${lesson.room}',
      if (lesson.building.isNotEmpty) lesson.building,
    ].join(' · ');

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
                // Строка: номер пары + тип + время
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
                        _lessonIndex,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          height: 1,
                          color: isToday ? sFg : ext.textSecondary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),

                    if (lesson.type != LessonType.unknown)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 7, vertical: 3),
                        decoration: BoxDecoration(
                          color: _typeBg(ext),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          _typeLabel,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            height: 1,
                            color: _typeFg(ext),
                          ),
                        ),
                      ),

                    const Spacer(),

                    Text(
                      _timeLabel,
                      style: tt.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: isToday ? sFg : ext.textSecondary,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Название предмета
                Text(
                  lesson.subject,
                  style: tt.titleMedium?.copyWith(fontSize: 15),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),

                // Статус пары (идёт / начнётся через N мин)
                if (showStatus) ...[
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 9, vertical: 4),
                    decoration: BoxDecoration(
                      color: sBg,
                      borderRadius:
                      BorderRadius.circular(AppTheme.radiusSm),
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

                // Мета: преподаватель + место
                if (lesson.teacherName.isNotEmpty || placeLabel.isNotEmpty) ...[
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (lesson.teacherName.isNotEmpty)
                        Expanded(
                          child: _MetaRow(
                            icon: Icons.person_outline,
                            label: lesson.teacherName,
                            ext: ext,
                            tt: tt,
                          ),
                        ),
                      if (lesson.teacherName.isNotEmpty &&
                          placeLabel.isNotEmpty)
                        const SizedBox(width: 8),
                      if (placeLabel.isNotEmpty)
                        _MetaRow(
                          icon: lesson.isOnline
                              ? Icons.laptop_outlined
                              : Icons.location_on_outlined,
                          label: placeLabel,
                          ext: ext,
                          tt: tt,
                        ),
                    ],
                  ),
                ],
              ],
            ),
          ),

          // Полоска слева если пара идёт
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