import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/feature/events/domain/entity/event.dart';
import 'package:sfu/src/feature/events/presentation/bloc/events_bloc.dart';

import '../../../../core/widgets/detail_sheet.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key, required this.event});
  final Event event;

  // Вычисляемые поля из модели
  String get _day => DateFormat('d').format(event.startsAt);

  String get _month =>
      DateFormat('MMM', 'ru').format(event.startsAt).toUpperCase();

  String get _timeLabel {
    final start = DateFormat('HH:mm').format(event.startsAt);
    final end = DateFormat('HH:mm').format(event.endsAt);
    final date = DateFormat('d MMMM', 'ru').format(event.startsAt);

    // Многодневное событие
    if (event.endsAt.difference(event.startsAt).inDays >= 1) {
      final endDate = DateFormat('d MMMM', 'ru').format(event.endsAt);
      return '$date — $endDate';
    }

    return '$date · $start – $end';
  }

  String get _location =>
      '${event.roomNumber} · ${event.roomAddress}';

  bool get _isFull => event.takenSeats >= event.roomCapacity;
  int get _freeSeats => event.roomCapacity - event.takenSeats;

  @override
  Widget build(BuildContext context) {
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => showDetailSheet(
        context: context,
        child: _EventDetail(
          event: event,
          timeLabel: _timeLabel,
          location: _location,
          isFull: _isFull,
          freeSeats: _freeSeats,
          cs: cs,
          ext: ext,
          tt: tt,
        ),
      ),
      child: Container(
        width: 230,
        decoration: BoxDecoration(
          color: cs.surface,
          borderRadius: BorderRadius.circular(AppTheme.radiusLg),
          border: Border.all(color: ext.border),
        ),
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Датный бейдж
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: ext.surfaceTinted,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    _day,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: ext.textOnTinted,
                      height: 1,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    _month,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: ext.textOnTinted,
                      letterSpacing: 0.5,
                      height: 1,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Заголовок
            Text(
              event.title,
              style: tt.labelLarge?.copyWith(
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 5),

            // Annotation как превью
            Text(
              event.annotation,
              style: tt.bodyMedium?.copyWith(
                fontSize: 12,
                color: ext.textSecondary,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

            const Spacer(),

            const SizedBox(height: 8),
            _SeatsIndicator(
              takenSeats: event.takenSeats,
              totalSeats: event.roomCapacity,
              isFull: _isFull,
              freeSeats: _freeSeats,
              cs: cs,
              ext: ext,
              tt: tt,
            ),
          ],
        ),
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════
// Контент шторки события
// ════════════════════════════════════════════════════════════

class _EventDetail extends StatelessWidget {
  const _EventDetail({
    required this.event,
    required this.timeLabel,
    required this.location,
    required this.isFull,
    required this.freeSeats,
    required this.cs,
    required this.ext,
    required this.tt,
  });

  final Event event;
  final String timeLabel;
  final String location;
  final bool isFull;
  final int freeSeats;
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  String get _dayMonth =>
      DateFormat('d MMMM', 'ru').format(event.startsAt);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Дата + теги
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: ext.surfaceTinted,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                _dayMonth,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: ext.textOnTinted,
                  height: 1,
                ),
              ),
            ),
            const SizedBox(width: 8),
            if (event.tags.isNotEmpty)
              ...event.tags.take(2).map(
                    (t) => Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: _Tag(label: t, ext: ext),
                ),
              ),
          ],
        ),
        const SizedBox(height: 12),

        // Заголовок
        Text(
          event.title,
          style: tt.titleLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 14),

        // Мета-блок
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(AppTheme.radiusMd),
            border: Border.all(color: ext.border),
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              _MetaRow(
                icon: Icons.access_time_outlined,
                label: timeLabel,
                ext: ext,
                tt: tt,
              ),
              const SizedBox(height: 8),
              _MetaRow(
                icon: Icons.location_on_outlined,
                label: location,
                ext: ext,
                tt: tt,
              ),
              if (event.organizer.isNotEmpty) ...[
                const SizedBox(height: 8),
                _MetaRow(
                  icon: Icons.person_outline,
                  label: 'Организатор: ${event.organizer}',
                  ext: ext,
                  tt: tt,
                ),
              ],
            ],
          ),
        ),
        const SizedBox(height: 14),

        // Места
        _SeatsIndicator(
          takenSeats: event.takenSeats,
          totalSeats: event.roomCapacity,
          isFull: isFull,
          freeSeats: freeSeats,
          cs: cs,
          ext: ext,
          tt: tt,
        ),

        Divider(color: ext.divider, height: 24),

        // Описание
        Text(
          event.body.isNotEmpty ? event.body : event.annotation,
          style: tt.bodyLarge?.copyWith(
            fontSize: 15,
            height: 1.6,
            color: ext.textPrimary,
          ),
        ),

        const SizedBox(height: 24),

        // Кнопка
        SizedBox(
          width: double.infinity,
          height: 52,
          child: BlocBuilder<EventsBloc, EventsState>(
            builder: (context, state) {
              final isEnrolled = state.maybeWhen(
                success: (events) => events
                    .firstWhere(
                      (e) => e.id == event.id,
                  orElse: () => event,
                )
                    .isEnrolled,
                orElse: () => event.isEnrolled,
              );

              return ElevatedButton(
                onPressed: isFull
                    ? null
                    : () {
                  if (isEnrolled) {
                    context.read<EventsBloc>().add(
                      EventsEvent.unenroll(event.id),
                    );
                  } else {
                    context.read<EventsBloc>().add(
                      EventsEvent.enroll(event.id),
                    );
                  }
                  Navigator.pop(context);
                },
                child: Text(
                  isFull
                      ? 'Мест нет'
                      : isEnrolled
                      ? 'Отменить запись'
                      : 'Записаться',
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

// ════════════════════════════════════════════════════════════
// Индикатор мест
// ════════════════════════════════════════════════════════════

class _SeatsIndicator extends StatelessWidget {
  const _SeatsIndicator({
    required this.takenSeats,
    required this.totalSeats,
    required this.isFull,
    required this.freeSeats,
    required this.cs,
    required this.ext,
    required this.tt,
  });

  final int takenSeats;
  final int totalSeats;
  final bool isFull;
  final int freeSeats;
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    // totalSeats == 0 — данных ещё нет, не показываем индикатор
    if (totalSeats == 0) return const SizedBox.shrink();

    final fill = (takenSeats / totalSeats).clamp(0.0, 1.0);

    final Color barColor;
    final String seatText;
    if (isFull) {
      barColor = ext.errorFg;
      seatText = 'Мест нет';
    } else if (freeSeats <= 5) {
      barColor = ext.warningFg;
      seatText = 'Осталось $freeSeats мест';
    } else {
      barColor = ext.successFg;
      seatText = '$freeSeats свободных мест';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              seatText,
              style: tt.labelSmall?.copyWith(
                color: barColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Text(
              '$takenSeats/$totalSeats',
              style: tt.labelSmall?.copyWith(color: ext.textTertiary),
            ),
          ],
        ),
        const SizedBox(height: 5),
        ClipRRect(
          borderRadius: BorderRadius.circular(2),
          child: LinearProgressIndicator(
            value: fill,
            minHeight: 4,
            backgroundColor: ext.divider,
            valueColor: AlwaysStoppedAnimation(barColor),
          ),
        ),
      ],
    );
  }
}

// ════════════════════════════════════════════════════════════
// Вспомогательные
// ════════════════════════════════════════════════════════════

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
  Widget build(BuildContext context) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(icon, size: 15, color: ext.textTertiary),
      const SizedBox(width: 8),
      Expanded(
        child: Text(
          label,
          style: tt.labelLarge?.copyWith(
            color: ext.textSecondary,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    ],
  );
}

class _Tag extends StatelessWidget {
  const _Tag({required this.label, required this.ext});
  final String label;
  final AppColors ext;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
    decoration: BoxDecoration(
      color: ext.surfaceTinted,
      borderRadius: BorderRadius.circular(AppTheme.radiusSm),
    ),
    child: Text(
      label,
      style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: ext.textOnTinted,
        height: 1,
      ),
    ),
  );
}