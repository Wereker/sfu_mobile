import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sfu/src/core/theme/app_theme.dart';

import '../widgets/staff_card.dart';

class _StaffMember {
  final String name;
  final String title;
  final List<String> tags;
  const _StaffMember({
    required this.name,
    required this.title,
    required this.tags,
  });
}

class _Thesis {
  final String title;
  final String professor;
  final bool isFree;
  final String? takenBy;
  const _Thesis({
    required this.title,
    required this.professor,
    required this.isFree,
    this.takenBy,
  });
}

class _Discipline {
  final String name;
  final String professor;
  final int credits;
  const _Discipline({
    required this.name,
    required this.professor,
    required this.credits,
  });
}

const _staff = [
  _StaffMember(
    name: 'Соколова Елена Викторовна',
    title: 'доц., к.т.н., зам. зав. кафедрой',
    tags: ['Машинное обучение', 'NLP'],
  ),
  _StaffMember(
    name: 'Петров Сергей Игоревич',
    title: 'доц., к.ф.-м.н.',
    tags: ['Базы данных', 'Алгоритмы'],
  ),
  _StaffMember(
    name: 'Иванов Александр Михайлович',
    title: 'проф., д.т.н.',
    tags: ['Линейная алгебра', 'Оптимизация'],
  ),
  _StaffMember(
    name: 'Кузнецова Анна Павловна',
    title: 'ст. преп.',
    tags: ['Python', 'CV'],
  ),
];

const _theses = [
  _Thesis(
    title: 'Сегментация медицинских снимков с помощью U-Net',
    professor: 'Соколова Е. В.',
    isFree: true,
  ),
  _Thesis(
    title: 'RAG-система для документации СФУ',
    professor: 'Кузнецова А. П.',
    isFree: true,
  ),
  _Thesis(
    title: 'Обнаружение аномалий в логах серверов',
    professor: 'Петров С. И.',
    isFree: false,
    takenBy: 'Соколов Д. А.',
  ),
  _Thesis(
    title: 'Оптимизация гиперпараметров через байесовский поиск',
    professor: 'Иванов А. М.',
    isFree: true,
  ),
];

const _bachelor = [
  _Discipline(
    name: 'Глубокое обучение',
    professor: 'Соколова Е. В.',
    credits: 4,
  ),
  _Discipline(
    name: 'Компьютерное зрение',
    professor: 'Кузнецова А. П.',
    credits: 3,
  ),
  _Discipline(name: 'Анализ данных', professor: 'Петров С. И.', credits: 3),
];

const _master = [
  _Discipline(
    name: 'Обучение с подкреплением',
    professor: 'Иванов А. М.',
    credits: 5,
  ),
  _Discipline(
    name: 'Большие языковые модели',
    professor: 'Соколова Е. В.',
    credits: 4,
  ),
  _Discipline(
    name: 'Генеративные модели',
    professor: 'Кузнецова А. П.',
    credits: 3,
  ),
];

// ════════════════════════════════════════════════════════════
// Экран
// ════════════════════════════════════════════════════════════
class DepartmentScreen extends StatefulWidget {
  const DepartmentScreen({super.key});

  @override
  State<DepartmentScreen> createState() => _DepartmentScreenState();
}

class _DepartmentScreenState extends State<DepartmentScreen> {
  int _tabIndex = 0; // 0 = staff, 1 = thesis, 2 = disc

  static const _tabs = ['Преподаватели', 'Темы ВКР', 'Дисциплины'];

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt = Theme.of(context).textTheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _DepartmentAppBar(cs: cs, ext: ext, tt: tt),

          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                  child: _SegmentedControl(
                    tabs: _tabs,
                    selected: _tabIndex,
                    onChanged: (i) => setState(() => _tabIndex = i),
                    cs: cs,
                    ext: ext,
                    tt: tt,
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
            sliver: switch (_tabIndex) {
              0 => _StaffTab(cs: cs, ext: ext, tt: tt),
              1 => _ThesisTab(cs: cs, ext: ext, tt: tt),
              _ => _DisciplinesTab(cs: cs, ext: ext, tt: tt),
            },
          ),
        ],
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════
// AppBar
// ════════════════════════════════════════════════════════════
class _DepartmentAppBar extends StatelessWidget {
  const _DepartmentAppBar({
    required this.cs,
    required this.ext,
    required this.tt,
  });
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      toolbarHeight: 72,
      flexibleSpace: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Кафедра СИИ', style: tt.displaySmall),
                    const SizedBox(height: 2),
                    Text(
                      'Системы искусственного интеллекта',
                      style: tt.labelLarge?.copyWith(color: ext.textSecondary),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: cs.primary,
                  borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                ),
                padding: const EdgeInsets.all(6),
                child: SvgPicture.asset('assets/images/logo_app_bar.svg'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════
// Сегментированный переключатель
// ════════════════════════════════════════════════════════════
class _SegmentedControl extends StatelessWidget {
  const _SegmentedControl({
    required this.tabs,
    required this.selected,
    required this.onChanged,
    required this.cs,
    required this.ext,
    required this.tt,
  });

  final List<String> tabs;
  final int selected;
  final ValueChanged<int> onChanged;
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ext.surfaceTinted,
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        children: List.generate(tabs.length, (i) {
          final isSelected = i == selected;
          return Expanded(
            child: GestureDetector(
              onTap: () => onChanged(i),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                padding: const EdgeInsets.symmetric(vertical: 9),
                decoration: BoxDecoration(
                  color: isSelected
                      ? cs.surface
                      : cs.surface.withValues(alpha: 0),
                  borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                ),
                alignment: Alignment.center,
                child: Text(
                  tabs[i],
                  style: tt.labelLarge?.copyWith(
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                    color: isSelected ? ext.textPrimary : ext.textSecondary,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════
// Вкладка 1 — Преподаватели
// ════════════════════════════════════════════════════════════
class _StaffTab extends StatelessWidget {
  const _StaffTab({required this.cs, required this.ext, required this.tt});
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemCount: _staff.length,
      itemBuilder: (_, i) => StaffCard(member: sampleStaff[i]),
    );
  }
}

// ════════════════════════════════════════════════════════════
// Вкладка 2 — Темы ВКР
// ════════════════════════════════════════════════════════════
class _ThesisTab extends StatefulWidget {
  const _ThesisTab({required this.cs, required this.ext, required this.tt});
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  @override
  State<_ThesisTab> createState() => _ThesisTabState();
}

class _ThesisTabState extends State<_ThesisTab> {
  // 0 = все, 1 = свободные, 2 = занятые
  int _filter = 0;

  List<_Thesis> get _filtered {
    if (_filter == 1) return _theses.where((t) => t.isFree).toList();
    if (_filter == 2) return _theses.where((t) => !t.isFree).toList();
    return _theses;
  }

  @override
  Widget build(BuildContext context) {
    final cs = widget.cs;
    final ext = widget.ext;
    final tt = widget.tt;

    return SliverMainAxisGroup(
      slivers: [
        // Фильтр-чипы
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              children: [
                _FilterChip(
                  label: 'Все',
                  isActive: _filter == 0,
                  onTap: () => setState(() => _filter = 0),
                  cs: cs,
                  ext: ext,
                  tt: tt,
                ),
                const SizedBox(width: 8),
                _FilterChip(
                  label: 'Свободные',
                  isActive: _filter == 1,
                  onTap: () => setState(() => _filter = 1),
                  cs: cs,
                  ext: ext,
                  tt: tt,
                ),
                const SizedBox(width: 8),
                _FilterChip(
                  label: 'Занятые',
                  isActive: _filter == 2,
                  onTap: () => setState(() => _filter = 2),
                  cs: cs,
                  ext: ext,
                  tt: tt,
                ),
              ],
            ),
          ),
        ),

        // Карточки
        SliverList.separated(
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemCount: _filtered.length,
          itemBuilder: (_, i) =>
              _ThesisCard(thesis: _filtered[i], cs: cs, ext: ext, tt: tt),
        ),
      ],
    );
  }
}

class _ThesisCard extends StatelessWidget {
  const _ThesisCard({
    required this.thesis,
    required this.cs,
    required this.ext,
    required this.tt,
  });

  final _Thesis thesis;
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        border: Border.all(color: ext.border),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Заголовок + статус
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  thesis.title,
                  style: tt.labelLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              _StatusBadge(
                label: thesis.isFree ? 'Свободна' : 'Занята',
                bg: thesis.isFree ? ext.successBg : ext.errorBg,
                fg: thesis.isFree ? ext.successFg : ext.errorFg,
                tt: tt,
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Преподаватель
          Row(
            children: [
              _InitialsAvatar(
                name: thesis.professor,
                size: 36,
                primary: cs.primary,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  thesis.takenBy != null
                      ? '${thesis.professor} · взял ${thesis.takenBy}'
                      : thesis.professor,
                  style: tt.labelSmall?.copyWith(color: ext.textSecondary),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),

          // Кнопка «Подать заявку» только для свободных
          if (thesis.isFree) ...[
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 44,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Подать заявку'),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════
// Вкладка 3 — Дисциплины
// ════════════════════════════════════════════════════════════
class _DisciplinesTab extends StatelessWidget {
  const _DisciplinesTab({
    required this.cs,
    required this.ext,
    required this.tt,
  });
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        // Бакалавриат
        SliverToBoxAdapter(
          child: _SectionHeader(title: 'Бакалавриат', ext: ext, tt: tt),
        ),
        SliverList.separated(
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemCount: _bachelor.length,
          itemBuilder: (_, i) => _DisciplineCard(
            discipline: _bachelor[i],
            cs: cs,
            ext: ext,
            tt: tt,
          ),
        ),

        // Магистратура
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 24),
            child: _SectionHeader(title: 'Магистратура', ext: ext, tt: tt),
          ),
        ),
        SliverList.separated(
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemCount: _master.length,
          itemBuilder: (_, i) =>
              _DisciplineCard(discipline: _master[i], cs: cs, ext: ext, tt: tt),
        ),
      ],
    );
  }
}

class _DisciplineCard extends StatelessWidget {
  const _DisciplineCard({
    required this.discipline,
    required this.cs,
    required this.ext,
    required this.tt,
  });

  final _Discipline discipline;
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        border: Border.all(color: ext.border),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      discipline.name,
                      style: tt.labelLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      discipline.professor,
                      style: tt.labelSmall?.copyWith(color: ext.textSecondary),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              _Tag(label: '${discipline.credits} з.е.', ext: ext, tt: tt),
            ],
          ),

          const SizedBox(height: 12),

          SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(
                  context,
                ).extension<AppColors>()!.surfaceTinted,
                foregroundColor: Theme.of(
                  context,
                ).extension<AppColors>()!.textOnTinted,
                elevation: 0,
                side: BorderSide.none,
              ),
              child: const Text('Записаться'),
            ),
          ),
        ],
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════
// Вспомогательные виджеты
// ════════════════════════════════════════════════════════════

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.title,
    required this.ext,
    required this.tt,
  });
  final String title;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(title, style: tt.titleMedium),
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag({required this.label, required this.ext, required this.tt});
  final String label;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: ext.surfaceTinted,
        borderRadius: BorderRadius.circular(AppTheme.radiusSm),
      ),
      child: Text(
        label,
        style: tt.labelSmall?.copyWith(
          color: ext.textOnTinted,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.isActive,
    required this.onTap,
    required this.cs,
    required this.ext,
    required this.tt,
  });

  final String label;
  final bool isActive;
  final VoidCallback onTap;
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
          color: isActive ? cs.primary : ext.surfaceTinted,
          borderRadius: BorderRadius.circular(AppTheme.radiusSm),
        ),
        child: Text(
          label,
          style: tt.labelLarge?.copyWith(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: isActive ? cs.onPrimary : ext.textOnTinted,
          ),
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({
    required this.label,
    required this.bg,
    required this.fg,
    required this.tt,
  });

  final String label;
  final Color bg;
  final Color fg;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(AppTheme.radiusSm),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: fg,
          height: 1,
        ),
      ),
    );
  }
}

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
  Widget build(BuildContext context) {
    return Container(
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
}
