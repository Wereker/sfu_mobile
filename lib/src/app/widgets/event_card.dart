import 'package:flutter/material.dart';
import 'package:sfu/src/core/theme/app_theme.dart';

import '../../core/widgets/detail_sheet.dart';

class DepartmentEvent {
  final String id;
  final String day;
  final String month;
  final String title;
  final String preview;
  final String body;
  final String location;
  final String time;
  final String organizer;
  final int totalSeats;
  final int takenSeats;
  final List<String> tags;

  const DepartmentEvent({
    required this.id,
    required this.day,
    required this.month,
    required this.title,
    required this.preview,
    required this.body,
    required this.location,
    required this.time,
    required this.organizer,
    required this.totalSeats,
    required this.takenSeats,
    this.tags = const [],
  });

  int get freeSeats => totalSeats - takenSeats;
  bool get isFull => freeSeats <= 0;
}

const sampleEvents = [
  DepartmentEvent(
    id: 'ev_1',
    day: '07',
    month: 'МАЯ',
    title: 'Хакатон по компьютерному зрению',
    preview:
        'Команды до 4 человек. Призовой фонд 150 000 ₽. Задача — детекция объектов на спутниковых снимках.',
    body:
        'Кафедра САИ совместно с «Ростелеком» проводит хакатон по компьютерному зрению.\n\n'
        'Задача: разработать систему детекции объектов инфраструктуры на спутниковых снимках '
        'с точностью mAP ≥ 0.75. Данные и бейзлайн будут выданы на старте.\n\n'
        'Формат:\n'
        '• Командный, 2–4 человека\n'
        '• 48 часов непрерывной работы\n'
        '• Очный формат, ноутбуки с собой\n'
        '• Питание и напитки — за счёт организаторов\n\n'
        'Призы:\n'
        '• 1 место — 80 000 ₽\n'
        '• 2 место — 50 000 ₽\n'
        '• 3 место — 20 000 ₽\n\n'
        'Финальная презентация и церемония награждения — 9 мая в 16:00.',
    location: 'Корпус Л4, ауд. 21 (хакспейс)',
    time: '07 мая · 10:00',
    organizer: 'Соколова Е. В.',
    totalSeats: 40,
    takenSeats: 28,
    tags: ['Хакатон', 'CV', 'Очно'],
  ),
  DepartmentEvent(
    id: 'ev_2',
    day: '12',
    month: 'МАЯ',
    title: 'Лекция: GenAI в индустрии',
    preview:
        'Открытая встреча с инженерами Yandex. Разберём как LLM внедряются в production-системы.',
    body:
        'Открытая лекция от инженеров Yandex Cloud AI.\n\n'
        'Темы:\n'
        '• Архитектура современных LLM: от трансформера до MoE\n'
        '• Fine-tuning vs RAG — когда что применять\n'
        '• Как устроен production-пайплайн генеративных сервисов Яндекса\n'
        '• Q&A с командой: вопросы из зала\n\n'
        'Спикеры:\n'
        '• Артём Семёнов — ML Lead, Yandex Cloud\n'
        '• Дарья Ким — Research Engineer, YandexGPT team\n\n'
        'После лекции — неформальное общение и возможность попасть на стажировку.\n\n'
        'Регистрация обязательна — мест ограниченно.',
    location: 'Конференц-зал, корп. Г, ауд. 208',
    time: '12 мая · 14:00',
    organizer: 'Кузнецова А. П.',
    totalSeats: 60,
    takenSeats: 55,
    tags: ['Лекция', 'GenAI', 'Гость'],
  ),
  DepartmentEvent(
    id: 'ev_3',
    day: '18',
    month: 'МАЯ',
    title: 'Защита курсовых работ',
    preview:
        'Поток БИ22, расписание по подгруппам. Каждая презентация — 10 мин + 5 мин вопросы.',
    body:
        'Защита курсовых работ студентов потока БИ22.\n\n'
        'Расписание по подгруппам:\n'
        '• 1 подгруппа (гр. БИ22-01, БИ22-02) — 09:00–12:00, ауд. Л4-12\n'
        '• 2 подгруппа (гр. БИ22-03, БИ22-04) — 13:00–16:00, ауд. Л4-21\n\n'
        'Регламент выступления:\n'
        '• Презентация — 10 минут\n'
        '• Ответы на вопросы комиссии — 5 минут\n'
        '• Оценка выставляется сразу после выступления\n\n'
        'Состав комиссии: Иванов А. М. (председатель), Петров С. И., Соколова Е. В.\n\n'
        'Требования к презентации: не менее 12 слайдов, обязателен слайд с результатами и выводами.',
    location: 'Ауд. Л4-12 и Л4-21',
    time: '18 мая · 09:00',
    organizer: 'Иванов А. М.',
    totalSeats: 30,
    takenSeats: 30,
    tags: ['Защита', 'БИ22'],
  ),
];

class EventCard extends StatelessWidget {
  const EventCard({super.key, required this.event});
  final DepartmentEvent event;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => showDetailSheet(
        context: context,
        child: _EventDetail(event: event, cs: cs, ext: ext, tt: tt),
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
                    event.day,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: ext.textOnTinted,
                      height: 1,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    event.month,
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

            // Превью
            Text(
              event.preview,
              style: tt.bodyMedium?.copyWith(
                fontSize: 12,
                color: ext.textSecondary,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

            const Spacer(),

            // Мест осталось
            const SizedBox(height: 8),
            _SeatsIndicator(event: event, cs: cs, ext: ext, tt: tt),
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
    required this.cs,
    required this.ext,
    required this.tt,
  });

  final DepartmentEvent event;
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Дата + метка
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: ext.surfaceTinted,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '${event.day} ${event.month}',
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
              ...event.tags
                  .take(2)
                  .map(
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
                label: event.time,
                ext: ext,
                tt: tt,
              ),
              const SizedBox(height: 8),
              _MetaRow(
                icon: Icons.location_on_outlined,
                label: event.location,
                ext: ext,
                tt: tt,
              ),
              const SizedBox(height: 8),
              _MetaRow(
                icon: Icons.person_outline,
                label: 'Организатор: ${event.organizer}',
                ext: ext,
                tt: tt,
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),

        // Места
        _SeatsIndicator(event: event, cs: cs, ext: ext, tt: tt),

        Divider(color: ext.divider, height: 24),

        // Описание
        Text(
          event.body,
          style: tt.bodyLarge?.copyWith(
            fontSize: 15,
            height: 1.6,
            color: ext.textPrimary,
          ),
        ),

        const SizedBox(height: 24),

        // Кнопка записаться
        SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            onPressed: event.isFull ? null : () {},
            child: Text(event.isFull ? 'Мест нет' : 'Записаться'),
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
    required this.event,
    required this.cs,
    required this.ext,
    required this.tt,
  });

  final DepartmentEvent event;
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    final fill = event.takenSeats / event.totalSeats;

    final Color barColor;
    final String seatText;
    if (event.isFull) {
      barColor = ext.errorFg;
      seatText = 'Мест нет';
    } else if (event.freeSeats <= 5) {
      barColor = ext.warningFg;
      seatText = 'Осталось ${event.freeSeats} мест';
    } else {
      barColor = ext.successFg;
      seatText = '${event.freeSeats} свободных мест';
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
              '${event.takenSeats}/${event.totalSeats}',
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
