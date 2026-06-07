import 'package:flutter/material.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/feature/attendance/presentation/screens/attendance_screen.dart';

class LessonAttendanceCard extends StatelessWidget {
  const LessonAttendanceCard({
    super.key,
    required this.lesson,
    required this.onTap,
  });

  final LessonData lesson;
  final VoidCallback onTap;

  Color _typeBg(AppColors ext) => switch (lesson.type) {
    'лекция' => ext.infoBg,
    'пр. занятие' => ext.successBg,
    'лаб. работа' => ext.warningBg,
    _ => ext.divider,
  };

  Color _typeFg(AppColors ext) => switch (lesson.type) {
    'лекция' => ext.infoFg,
    'пр. занятие' => ext.successFg,
    'лаб. работа' => ext.warningFg,
    _ => ext.textSecondary,
  };

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt = Theme.of(context).textTheme;
    final rate = lesson.attendanceRate;
    final started = lesson.isStarted;

    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: started ? ext.surfaceTinted : cs.surface,
                border: Border.all(color: ext.border),
                borderRadius: BorderRadius.circular(AppTheme.radiusLg),
              ),
              padding: const EdgeInsets.fromLTRB(19, 14, 14, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Тип + время
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 7, vertical: 3),
                        decoration: BoxDecoration(
                          color: _typeBg(ext),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          lesson.type,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: _typeFg(ext),
                            height: 1,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        lesson.time,
                        style: tt.labelSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: ext.textSecondary),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),
                  Text(lesson.subject,
                      style: tt.titleMedium?.copyWith(fontSize: 15)),
                  const SizedBox(height: 4),

                  // Группа + место — место обрезается с ...
                  Row(
                    children: [
                      Icon(Icons.groups_outlined,
                          size: 13, color: ext.textTertiary),
                      const SizedBox(width: 4),
                      Flexible(
                        flex: 2,
                        child: Text(
                          lesson.group,
                          style: tt.labelSmall
                              ?.copyWith(color: ext.textSecondary),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Icon(Icons.location_on_outlined,
                          size: 13, color: ext.textTertiary),
                      const SizedBox(width: 4),
                      Flexible(
                        flex: 3,
                        child: Text(
                          lesson.place.isNotEmpty
                              ? lesson.place
                              : '—',
                          style: tt.labelSmall
                              ?.copyWith(color: ext.textSecondary),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Прогресс / приглашение начать
                  if (started) ...[
                    Row(
                      children: [
                        Text(
                          '${lesson.presentCount} из ${lesson.studentCount} присутствует',
                          style: tt.labelSmall?.copyWith(
                            color: rate >= 0.75
                                ? ext.successFg
                                : rate >= 0.5
                                ? ext.warningFg
                                : ext.errorFg,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '${(rate * 100).round()}%',
                          style: tt.labelSmall
                              ?.copyWith(color: ext.textTertiary),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(2),
                      child: LinearProgressIndicator(
                        value: rate,
                        minHeight: 4,
                        backgroundColor: ext.divider,
                        valueColor: AlwaysStoppedAnimation(
                          rate >= 0.75
                              ? ext.successFg
                              : rate >= 0.5
                              ? ext.warningFg
                              : ext.errorFg,
                        ),
                      ),
                    ),
                  ] else ...[
                    Row(
                      children: [
                        Icon(Icons.people_outline,
                            size: 13, color: ext.textTertiary),
                        const SizedBox(width: 4),
                        Text(
                          '${lesson.studentCount} студентов',
                          style: tt.labelSmall
                              ?.copyWith(color: ext.textSecondary),
                        ),
                        const Spacer(),
                        Text(
                          'Нажмите, чтобы начать',
                          style: tt.labelSmall
                              ?.copyWith(color: ext.textTertiary),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),

            if (started)
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: Container(width: 3, color: cs.primary),
              ),
          ],
        ),
      ),
    );
  }
}