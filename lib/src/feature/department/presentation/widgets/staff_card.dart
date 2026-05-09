import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sfu/src/core/theme/app_theme.dart';

import '../../../../core/widgets/detail_sheet.dart';

class StaffMember {
  final String id;
  final String name;
  final String position;
  final String degree;
  final String email;
  final String? phone;
  final String? telegram;
  final String? bio;
  final List<String> tags; // направления

  const StaffMember({
    required this.id,
    required this.name,
    required this.position,
    required this.degree,
    required this.email,
    this.phone,
    this.telegram,
    this.bio,
    this.tags = const [],
  });
}

// ── Синтетические данные ─────────────────────────────────────
const sampleStaff = [
  StaffMember(
    id: 'st_1',
    name: 'Соколова Елена Викторовна',
    position: 'Доцент, зам. зав. кафедрой',
    degree: 'к.т.н.',
    email: 'sokolova@sfu-kras.ru',
    phone: '+7 (391) 206-22-11',
    telegram: '@sokolova_sai',
    bio:
        'Кандидат технических наук, доцент кафедры систем искусственного интеллекта. '
        'Читает курсы «Машинное обучение» и «Обработка естественного языка». '
        'Научный руководитель 12 выпускных квалификационных работ. '
        'Участник международных конференций AAAI, ACL и Dialogue.',
    tags: ['Машинное обучение', 'NLP', 'RAG'],
  ),
  StaffMember(
    id: 'st_2',
    name: 'Петров Сергей Игоревич',
    position: 'Доцент',
    degree: 'к.ф.-м.н.',
    email: 'petrov@sfu-kras.ru',
    phone: '+7 (391) 206-22-34',
    telegram: '@petrov_db',
    bio:
        'Кандидат физико-математических наук. Специализируется в области теории алгоритмов, '
        'реляционных и NoSQL баз данных. Ведёт курсы «Базы данных», «Алгоритмы и структуры данных». '
        'Автор 23 научных статей в журналах ВАК.',
    tags: ['Базы данных', 'Алгоритмы', 'NoSQL'],
  ),
  StaffMember(
    id: 'st_3',
    name: 'Иванов Александр Михайлович',
    position: 'Профессор, зав. кафедрой',
    degree: 'д.т.н.',
    email: 'ivanov@sfu-kras.ru',
    phone: '+7 (391) 206-22-00',
    bio:
        'Доктор технических наук, профессор. Заведующий кафедрой CAИ с 2018 года. '
        'Область научных интересов: методы оптимизации, машинное обучение, цифровая трансформация. '
        'Руководитель трёх грантов РНФ. Соавтор двух учебников по линейной алгебре и '
        'оптимальному управлению, рекомендованных Минобрнауки.',
    tags: ['Линейная алгебра', 'Оптимизация', 'Управление'],
  ),
  StaffMember(
    id: 'st_4',
    name: 'Кузнецова Анна Павловна',
    position: 'Старший преподаватель',
    degree: '',
    email: 'kuznetsova@sfu-kras.ru',
    telegram: '@kuznetsova_cv',
    bio:
        'Старший преподаватель кафедры. Специалист в области компьютерного зрения '
        'и обработки изображений. Ведёт практические занятия по Python, OpenCV и PyTorch. '
        'Активный участник хакатонов, ментор команд на соревнованиях Kaggle.',
    tags: ['Python', 'CV', 'PyTorch', 'OpenCV'],
  ),
];

// ════════════════════════════════════════════════════════════
// Карточка преподавателя
// ════════════════════════════════════════════════════════════
class StaffCard extends StatelessWidget {
  const StaffCard({super.key, required this.member});
  final StaffMember member;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => showDetailSheet(
        context: context,
        child: _StaffDetail(member: member, cs: cs, ext: ext, tt: tt),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: cs.surface,
          borderRadius: BorderRadius.circular(AppTheme.radiusLg),
          border: Border.all(color: ext.border),
        ),
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Аватар
            _InitialsAvatar(name: member.name, size: 52, primary: cs.primary),
            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Имя
                  Text(
                    member.name,
                    style: tt.labelLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 3),

                  // Должность + степень
                  Text(
                    member.degree.isNotEmpty
                        ? '${member.position} · ${member.degree}'
                        : member.position,
                    style: tt.labelSmall?.copyWith(color: ext.textSecondary),
                  ),
                  const SizedBox(height: 10),

                  // Теги
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: member.tags
                        .take(3)
                        .map((t) => _Tag(label: t, ext: ext))
                        .toList(),
                  ),
                ],
              ),
            ),

            // Стрелка
            Icon(Icons.chevron_right, size: 20, color: ext.textTertiary),
          ],
        ),
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════
// Контент шторки преподавателя
// ════════════════════════════════════════════════════════════
class _StaffDetail extends StatelessWidget {
  const _StaffDetail({
    required this.member,
    required this.cs,
    required this.ext,
    required this.tt,
  });

  final StaffMember member;
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Шапка: аватар + имя
        Row(
          children: [
            _InitialsAvatar(name: member.name, size: 56, primary: cs.primary),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    member.name,
                    style: tt.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    member.degree.isNotEmpty
                        ? '${member.position} · ${member.degree}'
                        : member.position,
                    style: tt.labelSmall?.copyWith(color: ext.textSecondary),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Теги
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: member.tags.map((t) => _Tag(label: t, ext: ext)).toList(),
        ),

        Divider(color: ext.divider, height: 24),

        // Контакты
        _ContactsBlock(member: member, cs: cs, ext: ext, tt: tt),

        const SizedBox(height: 16),

        // Биография
        if (member.bio != null && member.bio!.isNotEmpty) ...[
          Text(
            'О преподавателе',
            style: tt.titleSmall?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(
            member.bio!,
            style: tt.bodyLarge?.copyWith(
              fontSize: 15,
              height: 1.6,
              color: ext.textPrimary,
            ),
          ),
          const SizedBox(height: 24),
        ],

        // Кнопка «Написать»
        SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton.icon(
            onPressed: () {}, // TODO: открыть чат с преподавателем
            icon: const Icon(Icons.send_outlined, size: 18),
            label: const Text('Написать'),
          ),
        ),
      ],
    );
  }
}

// ════════════════════════════════════════════════════════════
// Блок контактов (email, телефон, tg, офис) + копирование
// ════════════════════════════════════════════════════════════
class _ContactsBlock extends StatelessWidget {
  const _ContactsBlock({
    required this.member,
    required this.cs,
    required this.ext,
    required this.tt,
  });

  final StaffMember member;
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  void _copy(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  @override
  Widget build(BuildContext context) {
    final items = <_ContactItem>[
      _ContactItem(
        icon: Icons.mail_outline,
        label: 'Почта',
        value: member.email,
      ),
      if (member.phone != null)
        _ContactItem(
          icon: Icons.phone_outlined,
          label: 'Телефон',
          value: member.phone!,
        ),
      if (member.telegram != null)
        _ContactItem(
          icon: Icons.telegram,
          label: 'Telegram',
          value: member.telegram!,
        ),
    ];

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        border: Border.all(color: ext.border),
      ),
      child: Column(
        children: items.asMap().entries.map((entry) {
          final i = entry.key;
          final item = entry.value;
          final isLast = i == items.length - 1;

          return Column(
            children: [
              InkWell(
                borderRadius: BorderRadius.vertical(
                  top: i == 0
                      ? const Radius.circular(AppTheme.radiusMd)
                      : Radius.zero,
                  bottom: isLast
                      ? const Radius.circular(AppTheme.radiusMd)
                      : Radius.zero,
                ),
                onTap: () => _copy(context, item.value),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 11,
                  ),
                  child: Row(
                    children: [
                      Icon(item.icon, size: 17, color: ext.textTertiary),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.label,
                              style: tt.labelSmall?.copyWith(
                                color: ext.textSecondary,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              item.value,
                              style: tt.labelLarge?.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.copy_outlined,
                        size: 15,
                        color: ext.textTertiary,
                      ),
                    ],
                  ),
                ),
              ),
              if (!isLast) Divider(height: 1, color: ext.divider, indent: 14),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class _ContactItem {
  final IconData icon;
  final String label;
  final String value;
  const _ContactItem({
    required this.icon,
    required this.label,
    required this.value,
  });
}

// ════════════════════════════════════════════════════════════
// Аватар с инициалами
// ════════════════════════════════════════════════════════════
class _InitialsAvatar extends StatelessWidget {
  const _InitialsAvatar({
    required this.name,
    required this.size,
    required this.primary,
  });

  final String name;
  final double size;
  final Color primary;

  static const _hues = [
    Color(0xFFFF9900),
    Color(0xFFFFB84D),
    Color(0xFFE68A00),
    Color(0xFFCC7A00),
    Color(0xFFFFA726),
    Color(0xFFFB8C00),
  ];

  Color get _bg {
    int h = 0;
    for (final c in name.codeUnits) {
      h = (h * 31 + c) & 0x7FFFFFFF;
    }
    return _hues[h % _hues.length];
  }

  String get _initials => name
      .split(' ')
      .where((p) => p.isNotEmpty)
      .take(2)
      .map((p) => p[0])
      .join()
      .toUpperCase();

  @override
  Widget build(BuildContext context) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(shape: BoxShape.circle, color: _bg),
    alignment: Alignment.center,
    child: Text(
      _initials,
      style: TextStyle(
        fontSize: size * 0.34,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        height: 1,
      ),
    ),
  );
}

// ════════════════════════════════════════════════════════════
// Тег
// ════════════════════════════════════════════════════════════
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
