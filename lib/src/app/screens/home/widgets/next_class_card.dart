import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/feature/timetable/domain/entity/lesson/lesson.dart';
import 'package:sfu/src/feature/timetable/domain/use_case/get_next_lesson_use_case.dart';
import 'package:sfu/src/feature/timetable/domain/use_case/get_next_lesson_use_case_impl.dart';
import 'package:sfu/src/feature/timetable/presentation/bloc/timetable_bloc.dart';

/// Карточка «ближайшая пара» на главном экране.
/// Получает расписание из TimetableBloc, пересчитывает результат
/// каждые 30 секунд через локальный Timer без обращения к серверу.
class NextClassCard extends StatefulWidget {
  const NextClassCard({super.key});

  @override
  State<NextClassCard> createState() => _NextClassCardState();
}

class _NextClassCardState extends State<NextClassCard> {
  DateTime _now = DateTime.now();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 30), (_) {
      if (mounted) setState(() => _now = DateTime.now());
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimetableBloc, TimetableState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const _NextClassShimmer(),
          success: (timetable, _) {
            // Пересчитываем каждый раз когда меняется _now или стейт
            final result = GetNextLessonUseCaseImpl().call(
              timetable: timetable,
              now: _now,
            );
            return _NextClassContent(result: result);
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}

// ── Контент ──────────────────────────────────────────────────────────────────

class _NextClassContent extends StatelessWidget {
  const _NextClassContent({required this.result});
  final NextLessonResult result;

  @override
  Widget build(BuildContext context) {
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

    return switch (result) {
      LessonInProgress(:final lesson, :final minutesGone) => _LessonCard(
        cs: cs, ext: ext, tt: tt,
        lesson: lesson,
        headerLabel: 'ИДЁТ СЕЙЧАС',
        badgeLabel: _minutesLabel(minutesGone, suffix: 'мин'),
        badgeTone: _BadgeTone.success,
      ),
      LessonUpcoming(:final lesson, :final minutesLeft) => _LessonCard(
        cs: cs, ext: ext, tt: tt,
        lesson: lesson,
        headerLabel: 'СЛЕДУЮЩАЯ ПАРА',
        badgeLabel: minutesLeft < 60
            ? 'Через $minutesLeft мин'
            : 'Через ${minutesLeft ~/ 60} ч ${minutesLeft % 60} мин',
        badgeTone: minutesLeft <= 15
            ? _BadgeTone.error
            : minutesLeft <= 45
            ? _BadgeTone.warning
            : _BadgeTone.neutral,
      ),
      NoMoreLessonsToday() => _EmptyCard(
        icon: Icons.check_circle_outline,
        title: 'На сегодня всё',
        subtitle: 'Все пары закончились',
      ),
      NoLessonsToday() => _EmptyCard(
        icon: Icons.wb_sunny_outlined,
        title: 'Сегодня пар нет',
        subtitle: 'Свободный день',
      ),
    };
  }

  String _minutesLabel(int minutes, {required String suffix}) {
    if (minutes == 0) return '< 1 $suffix';
    return 'Идёт $minutes $suffix';
  }
}

// ── Карточка с парой ─────────────────────────────────────────────────────────

class _LessonCard extends StatelessWidget {
  const _LessonCard({
    required this.cs,
    required this.ext,
    required this.tt,
    required this.lesson,
    required this.headerLabel,
    required this.badgeLabel,
    required this.badgeTone,
  });

  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;
  final Lesson lesson;
  final String headerLabel;
  final String badgeLabel;
  final _BadgeTone badgeTone;

  // ── Те же методы что в LessonCard ──

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

  String get _placeLabel {
    if (lesson.isOnline) return 'ЭИОС';
    return [
      if (lesson.room.isNotEmpty) 'ауд. ${lesson.room}',
      if (lesson.building.isNotEmpty) lesson.building,
    ].join(' · ');
  }

  Color _badgeBg(AppColors e) {
    switch (badgeTone) {
      case _BadgeTone.success: return e.successBg;
      case _BadgeTone.warning: return e.warningBg;
      case _BadgeTone.error:   return e.errorBg;
      case _BadgeTone.neutral: return e.divider;
    }
  }

  Color _badgeFg(AppColors e) {
    switch (badgeTone) {
      case _BadgeTone.success: return e.successFg;
      case _BadgeTone.warning: return e.warningFg;
      case _BadgeTone.error:   return e.errorFg;
      case _BadgeTone.neutral: return e.textSecondary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: ext.surfaceTinted,
          borderRadius: BorderRadius.circular(AppTheme.radiusLg),
          border: Border(left: BorderSide(color: cs.primary, width: 3)),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ── Строка 1: заголовок + бейдж времени ──
            Row(
              children: [
                Text(
                  headerLabel,
                  style: tt.labelSmall?.copyWith(
                    color: ext.textOnTinted,
                    letterSpacing: 0.8,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 9, vertical: 4),
                  decoration: BoxDecoration(
                    color: _badgeBg(ext),
                    borderRadius:
                    BorderRadius.circular(AppTheme.radiusSm),
                  ),
                  child: Text(
                    badgeLabel,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: _badgeFg(ext),
                      height: 1,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // ── Строка 2: тип пары (бейдж — те же цвета что в LessonCard) ──
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

            if (lesson.type != LessonType.unknown)
              const SizedBox(height: 6),

            // ── Предмет ──
            Text(
              lesson.subject,
              style: tt.titleMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(height: 4),

            // ── Время + место ──
            Row(
              children: [
                Text(
                  '${lesson.timeStart} — ${lesson.timeEnd}',
                  style: tt.bodyMedium?.copyWith(
                    color: ext.textSecondary,
                  ),
                ),
                if (_placeLabel.isNotEmpty) ...[
                  Text(
                    ' · ',
                    style: tt.bodyMedium?.copyWith(
                        color: ext.textTertiary),
                  ),
                  Flexible(
                    child: Text(
                      _placeLabel,
                      style: tt.bodyMedium?.copyWith(
                          color: ext.textSecondary),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ],
            ),

            // ── Преподаватель ──
            if (lesson.teacherName.isNotEmpty) ...[
              const SizedBox(height: 10),
              Row(
                children: [
                  _InitialsAvatar(name: lesson.teacherName, size: 26),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      lesson.teacherName,
                      style: tt.labelLarge,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ── Карточка «нет пар» ───────────────────────────────────────────────────────

class _EmptyCard extends StatelessWidget {
  const _EmptyCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: ext.surfaceTinted,
          borderRadius: BorderRadius.circular(AppTheme.radiusLg),
          border: Border(left: BorderSide(color: ext.divider, width: 3)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Icon(icon, size: 28, color: ext.textTertiary),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: tt.titleSmall),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: tt.bodySmall?.copyWith(
                      color: ext.textSecondary),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ── Шиммер ───────────────────────────────────────────────────────────────────

class _NextClassShimmer extends StatefulWidget {
  const _NextClassShimmer();

  @override
  State<_NextClassShimmer> createState() => _NextClassShimmerState();
}

class _NextClassShimmerState extends State<_NextClassShimmer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);
    _anim = Tween<double>(begin: 0.3, end: 0.8).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;

    return AnimatedBuilder(
      animation: _anim,
      builder: (_, __) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          height: 118,
          decoration: BoxDecoration(
            color: cs.onSurface.withValues(alpha: _anim.value * 0.08),
            borderRadius: BorderRadius.circular(AppTheme.radiusLg),
            border: Border(
              left: BorderSide(color: ext.divider, width: 3),
            ),
          ),
        ),
      ),
    );
  }
}

// ── Вспомогательные ──────────────────────────────────────────────────────────

enum _BadgeTone { success, warning, error, neutral }

class _InitialsAvatar extends StatelessWidget {
  const _InitialsAvatar({required this.name, required this.size});
  final String name;
  final double size;

  static const _palette = [
    Color(0xFF5C6BC0), Color(0xFF26A69A), Color(0xFFEF5350),
    Color(0xFFEC407A), Color(0xFF7E57C2), Color(0xFF29B6F6),
    Color(0xFF66BB6A), Color(0xFFFFA726),
  ];

  String get _initials => name
      .split(' ')
      .where((p) => p.isNotEmpty)
      .take(2)
      .map((p) => p[0])
      .join()
      .toUpperCase();

  Color get _bg {
    int h = 0;
    for (final c in name.codeUnits) {
      h = (h * 31 + c) & 0x7FFFFFFF;
    }
    return _palette[h % _palette.length];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size, height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: _bg),
      alignment: Alignment.center,
      child: Text(
        _initials,
        style: TextStyle(
          fontSize: size * 0.38,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          height: 1,
        ),
      ),
    );
  }
}