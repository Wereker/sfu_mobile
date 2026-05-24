import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/core/widgets/detail_sheet.dart';
import 'package:sfu/src/feature/announcements/domain/entity/announcement.dart';


class AnnouncementCard extends StatelessWidget {
  const AnnouncementCard({super.key, required this.announcement});
  final Announcement announcement;

  String get _dateLabel {
    final now = DateTime.now();
    final pub = announcement.publishAt;
    final diff = DateTime(now.year, now.month, now.day)
        .difference(DateTime(pub.year, pub.month, pub.day))
        .inDays;

    if (diff == 0) return 'Сегодня';
    if (diff == 1) return 'Вчера';
    if (diff < 7)  return '$diff дня назад';
    return DateFormat('d MMM', 'ru').format(pub);
  }

  // Первый абзац контента как превью
  String get _preview {
    final first = announcement.content.split('\n').firstWhere(
          (l) => l.trim().isNotEmpty,
      orElse: () => announcement.content,
    );
    return first.length > 120 ? '${first.substring(0, 120)}…' : first;
  }

  @override
  Widget build(BuildContext context) {
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => showDetailSheet(
        context: context,
        child: _AnnouncementDetail(
          announcement: announcement,
          dateLabel: _dateLabel,
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
                  // Верхняя строка: закреп / источник / дата
                  Row(
                    children: [
                      if (announcement.isPinned) ...[
                        Icon(Icons.push_pin_outlined,
                            size: 13, color: cs.primary),
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
                            color: ext.textSecondary),
                      ),
                      const Spacer(),
                      Text(
                        _dateLabel,
                        style: tt.labelSmall?.copyWith(
                            color: ext.textTertiary),
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

                  // Превью из первого абзаца
                  Text(
                    _preview,
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Читать',
                          style:
                          tt.labelSmall?.copyWith(color: cs.primary)),
                      const SizedBox(width: 3),
                      Icon(Icons.arrow_forward_ios,
                          size: 10, color: cs.primary),
                    ],
                  ),
                ],
              ),
            ),

            if (announcement.isPinned)
              Positioned(
                left: 0, top: 0, bottom: 0,
                child: Container(width: 3, color: cs.primary),
              ),
          ],
        ),
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════
// Шторка детали
// ════════════════════════════════════════════════════════════

class _AnnouncementDetail extends StatelessWidget {
  const _AnnouncementDetail({
    required this.announcement,
    required this.dateLabel,
    required this.cs,
    required this.ext,
    required this.tt,
  });

  final Announcement announcement;
  final String dateLabel;
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(announcement.source,
                style:
                tt.labelSmall?.copyWith(color: ext.textSecondary)),
            const Spacer(),
            Text(dateLabel,
                style: tt.labelSmall?.copyWith(color: ext.textTertiary)),
          ],
        ),
        const SizedBox(height: 10),

        Text(
          announcement.title,
          style: tt.titleLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 8),

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

        Text(
          announcement.content,
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
// Вспомогательные
// ════════════════════════════════════════════════════════════

class _Tag extends StatelessWidget {
  const _Tag({required this.label, required this.ext});
  final String label;
  final AppColors ext;

  @override
  Widget build(BuildContext context) => Container(
    padding:
    const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
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