import 'package:flutter/material.dart';
import 'package:sfu/src/core/theme/app_theme.dart';

import '../../core/widgets/detail_sheet.dart';

class Announcement {
  final String id;
  final bool isPinned;
  final String source;
  final String date;
  final String title;
  final String preview;
  final String body;
  final List<String> tags;

  const Announcement({
    required this.id,
    this.isPinned = false,
    required this.source,
    required this.date,
    required this.title,
    required this.preview,
    required this.body,
    this.tags = const [],
  });
}

const sampleAnnouncements = [
  Announcement(
    id: 'ann_1',
    isPinned: true,
    source: 'Кафедра',
    date: 'Сегодня',
    title: 'Запись на элективы открыта до 15 мая',
    preview:
        'Список дисциплин обновлён — добавлено 8 новых курсов по направлениям ИИ и Data Science.',
    body:
        'Уважаемые студенты!\n\n'
        'Запись на элективные дисциплины второго полугодия открыта до 15 мая включительно. '
        'В этом году кафедра расширила список: добавлено 8 новых курсов по направлениям '
        '«Генеративные модели», «MLOps», «Биоинформатика» и «Компьютерная лингвистика».\n\n'
        'Для записи перейдите во вкладку «Кафедра → Дисциплины» и нажмите кнопку «Записаться» '
        'напротив интересующего курса. Количество мест ограничено — не более 25 студентов на курс.\n\n'
        'Если у вас возникнут вопросы, обращайтесь к куратору вашей группы или пишите '
        'на кафедральную почту: sai@sfu-kras.ru',
    tags: ['Учёба', 'Элективы', 'Срочно'],
  ),
  Announcement(
    id: 'ann_2',
    source: 'Деканат',
    date: '3 мая',
    title: 'Обновлён список тем ВКР на 2024/25 учебный год',
    preview:
        'Добавлено 12 новых тем по направлениям NLP и компьютерное зрение от четырёх преподавателей.',
    body:
        'Уважаемые студенты 4-го курса!\n\n'
        'Список тем выпускных квалификационных работ на 2024/25 учебный год обновлён. '
        'Добавлено 12 новых тем от преподавателей кафедры:\n\n'
        '• Соколова Е. В. — 4 темы по NLP и RAG-системам\n'
        '• Кузнецова А. П. — 3 темы по компьютерному зрению\n'
        '• Петров С. И. — 3 темы по оптимизации и аномалиям\n'
        '• Иванов А. М. — 2 темы по обучению с подкреплением\n\n'
        'Подача заявки на тему — до 20 мая. После этой даты оставшиеся свободные темы '
        'распределяются деканатом автоматически.\n\n'
        'Полный список тем доступен в разделе «Кафедра → Темы ВКР».',
    tags: ['ВКР', '4-й курс'],
  ),
  Announcement(
    id: 'ann_3',
    source: 'Учебный отдел',
    date: '28 апреля',
    title: 'Перенос занятий в связи с конференцией',
    preview:
        'Пары 12–13 мая переносятся для студентов, участвующих в научной конференции.',
    body:
        'Уважаемые студенты!\n\n'
        'В связи с проведением IX Всероссийской научной конференции «Интеллектуальные системы» '
        '12–13 мая 2025 года пары для участников конференции переносятся:\n\n'
        '• 12 мая (понедельник): все пары переносятся на 17 мая\n'
        '• 13 мая (вторник): первая и вторая пары отменяются, третья и четвёртая — по расписанию\n\n'
        'Список участников опубликован на стенде кафедры и в Telegram-канале.\n\n'
        'Для подтверждения участия свяжитесь с оргкомитетом до 5 мая.',
    tags: ['Расписание', 'Конференция'],
  ),
];

// ════════════════════════════════════════════════════════════
// Карточка объявления
// ════════════════════════════════════════════════════════════
class AnnouncementCard extends StatelessWidget {
  const AnnouncementCard({super.key, required this.announcement});
  final Announcement announcement;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => showDetailSheet(
        context: context,
        child: _AnnouncementDetail(
          announcement: announcement,
          cs: cs,
          ext: ext,
          tt: tt,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: cs.surface,
                borderRadius: BorderRadius.circular(AppTheme.radiusLg),
                border: Border.all(color: ext.border),
              ),
              padding: const EdgeInsets.fromLTRB(19, 14, 14, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Верхняя строка
                  Row(
                    children: [
                      if (announcement.isPinned) ...[
                        Icon(
                          Icons.push_pin_outlined,
                          size: 13,
                          color: cs.primary,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'ЗАКРЕПЛЕНО',
                          style: tt.labelSmall?.copyWith(
                            color: cs.primary,
                            letterSpacing: 0.7,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                      Text(
                        announcement.source,
                        style: tt.labelSmall?.copyWith(
                          color: ext.textSecondary,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        announcement.date,
                        style: tt.labelSmall?.copyWith(color: ext.textTertiary),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),

                  // Заголовок
                  Text(
                    announcement.title,
                    style: tt.labelLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),

                  // Превью
                  Text(
                    announcement.preview,
                    style: tt.bodyMedium?.copyWith(
                      fontSize: 13,
                      color: ext.textSecondary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  // Теги
                  if (announcement.tags.isNotEmpty) ...[
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 6,
                      children: announcement.tags
                          .map((t) => _Tag(label: t, ext: ext))
                          .toList(),
                    ),
                  ],

                  const SizedBox(height: 10),

                  // «Читать далее»
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Читать',
                        style: tt.labelSmall?.copyWith(color: cs.primary),
                      ),
                      const SizedBox(width: 3),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 10,
                        color: cs.primary,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Left border
            if (announcement.isPinned)
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

// ════════════════════════════════════════════════════════════
// Контент шторки объявления
// ════════════════════════════════════════════════════════════
class _AnnouncementDetail extends StatelessWidget {
  const _AnnouncementDetail({
    required this.announcement,
    required this.cs,
    required this.ext,
    required this.tt,
  });

  final Announcement announcement;
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Источник + дата
        Row(
          children: [
            Text(
              announcement.source,
              style: tt.labelSmall?.copyWith(color: ext.textSecondary),
            ),
            const Spacer(),
            Text(
              announcement.date,
              style: tt.labelSmall?.copyWith(color: ext.textTertiary),
            ),
          ],
        ),
        const SizedBox(height: 10),

        // Заголовок
        Text(
          announcement.title,
          style: tt.titleLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 8),

        // Теги
        if (announcement.tags.isNotEmpty) ...[
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: announcement.tags
                .map((t) => _Tag(label: t, ext: ext))
                .toList(),
          ),
          const SizedBox(height: 14),
        ],

        Divider(color: ext.divider),
        const SizedBox(height: 14),

        // Полный текст
        Text(
          announcement.body,
          style: tt.bodyLarge?.copyWith(
            fontSize: 15,
            height: 1.6,
            color: ext.textPrimary,
          ),
        ),
      ],
    );
  }
}

// ════════════════════════════════════════════════════════════
// Тег
// ════════════════════════════════════════════════════════════
class _Tag extends StatelessWidget {
  const _Tag({required this.label, required this.ext});
  final String label;
  final AppColors ext;

  @override
  Widget build(BuildContext context) {
    return Container(
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
}
