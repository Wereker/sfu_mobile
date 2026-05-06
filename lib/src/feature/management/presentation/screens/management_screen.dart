import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sfu/src/core/theme/app_theme.dart';

import '../../../../core/widgets/detail_sheet.dart';

// ════════════════════════════════════════════════════════════
// Модели
// ════════════════════════════════════════════════════════════

class ManagedStudent {
  final String id;
  final String name;
  final String group;
  final String stream;   // поток — «БИ22»
  final bool isHeadman;
  final String? phone;
  final String? telegram;
  final String? email;

  const ManagedStudent({
    required this.id,
    required this.name,
    required this.group,
    required this.stream,
    this.isHeadman = false,
    this.phone,
    this.telegram,
    this.email,
  });
}

class ManagedThesis {
  final String id;
  final String title;
  final bool isFree;
  final String? takenBy;

  const ManagedThesis({
    required this.id,
    required this.title,
    required this.isFree,
    this.takenBy,
  });
}

// ── Синтетические данные ─────────────────────────────────────

const _streams = ['БИ22', 'БИ23', 'МА23'];

final _students = <ManagedStudent>[
  // БИ22 — группа 01
  const ManagedStudent(id: 's1',  name: 'Волков Кирилл Павлович',         group: 'БИ22-01', stream: 'БИ22', isHeadman: true,  phone: '+7 913 111 22 33', telegram: '@volkov_k'),
  const ManagedStudent(id: 's2',  name: 'Алексеев Дмитрий Сергеевич',     group: 'БИ22-01', stream: 'БИ22', phone: '+7 913 222 33 44'),
  const ManagedStudent(id: 's3',  name: 'Борисова Анна Игоревна',          group: 'БИ22-01', stream: 'БИ22', telegram: '@borisova_a'),
  const ManagedStudent(id: 's4',  name: 'Гришина Мария Александровна',     group: 'БИ22-01', stream: 'БИ22'),
  const ManagedStudent(id: 's5',  name: 'Данилов Артём Олегович',          group: 'БИ22-01', stream: 'БИ22', phone: '+7 913 333 44 55'),
  // БИ22 — группа 02
  const ManagedStudent(id: 's6',  name: 'Громова Ирина Петровна',          group: 'БИ22-02', stream: 'БИ22', isHeadman: true,  telegram: '@gromova_i', email: 'gromova@sfu-kras.ru'),
  const ManagedStudent(id: 's7',  name: 'Белов Роман Андреевич',           group: 'БИ22-02', stream: 'БИ22'),
  const ManagedStudent(id: 's8',  name: 'Дроздов Евгений Михайлович',      group: 'БИ22-02', stream: 'БИ22', phone: '+7 913 444 55 66'),
  const ManagedStudent(id: 's9',  name: 'Елисеева Татьяна Сергеевна',      group: 'БИ22-02', stream: 'БИ22'),
  // БИ23 — группа 01
  const ManagedStudent(id: 's10', name: 'Зайцев Александр Иванович',       group: 'БИ23-01', stream: 'БИ23', isHeadman: true,  phone: '+7 913 555 66 77', telegram: '@zaitsev_a'),
  const ManagedStudent(id: 's11', name: 'Кириллова Юлия Дмитриевна',       group: 'БИ23-01', stream: 'БИ23'),
  const ManagedStudent(id: 's12', name: 'Лазарев Павел Олегович',          group: 'БИ23-01', stream: 'БИ23', telegram: '@lazarev_p'),
  // МА23
  const ManagedStudent(id: 's13', name: 'Макарова Надежда Викторовна',     group: 'МА23-01', stream: 'МА23', isHeadman: true,  email: 'makarova@sfu-kras.ru'),
  const ManagedStudent(id: 's14', name: 'Никитин Сергей Романович',        group: 'МА23-01', stream: 'МА23', phone: '+7 913 666 77 88'),
];

final _myTheses = <ManagedThesis>[
  const ManagedThesis(id: 't1', title: 'Сегментация медицинских снимков с помощью U-Net',      isFree: true),
  const ManagedThesis(id: 't2', title: 'RAG-система для документации СФУ',                      isFree: false, takenBy: 'Борисова А. И.'),
  const ManagedThesis(id: 't3', title: 'Детекция аномалий во временных рядах методами LSTM',   isFree: true),
  const ManagedThesis(id: 't4', title: 'Автоматическая генерация субтитров на основе Whisper',  isFree: false, takenBy: 'Данилов А. О.'),
];

// ════════════════════════════════════════════════════════════
// Экран
// ════════════════════════════════════════════════════════════
class ManagementScreen extends StatefulWidget {
  const ManagementScreen({super.key});

  @override
  State<ManagementScreen> createState() => _ManagementScreenState();
}

class _ManagementScreenState extends State<ManagementScreen> {
  int _tabIndex = 0;

  static const _tabs = ['Студенты', 'Публикация', 'Темы ВКР'];

  @override
  Widget build(BuildContext context) {
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // ── AppBar ──────────────────────────────────────
          SliverAppBar(
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
                          Text('Управление', style: tt.displaySmall),
                          const SizedBox(height: 2),
                          Text('Студенты, публикации, темы ВКР',
                              style: tt.labelLarge
                                  ?.copyWith(color: ext.textSecondary),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 48, height: 48,
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
          ),

          // ── Переключатель ────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: _SegmentedControl(
                tabs: _tabs,
                selected: _tabIndex,
                onChanged: (i) => setState(() => _tabIndex = i),
                cs: cs, ext: ext, tt: tt,
              ),
            ),
          ),

          // ── Контент ──────────────────────────────────────
          switch (_tabIndex) {
            0 => _StudentsTab(cs: cs, ext: ext, tt: tt),
            1 => _PublishTab(cs: cs, ext: ext, tt: tt),
            _ => _ThesesTab(
                theses: _myTheses,
                onChanged: (updated) => setState(() {
                  final idx = _myTheses.indexWhere((t) => t.id == updated.id);
                  if (idx != -1) _myTheses[idx] = updated;
                }),
                onAdd: (title) => setState(() {
                  _myTheses.add(ManagedThesis(
                    id: 't${_myTheses.length + 1}',
                    title: title,
                    isFree: true,
                  ));
                }),
                cs: cs, ext: ext, tt: tt,
              ),
          },
        ],
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════
// Вкладка 1 — Студенты
// ════════════════════════════════════════════════════════════
class _StudentsTab extends StatefulWidget {
  const _StudentsTab({required this.cs, required this.ext, required this.tt});
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  @override
  State<_StudentsTab> createState() => _StudentsTabState();
}

class _StudentsTabState extends State<_StudentsTab> {
  String _selectedStream = _streams.first;
  String _selectedGroup  = '';
  String _query          = '';

  List<String> get _groups => _students
      .where((s) => s.stream == _selectedStream)
      .map((s) => s.group)
      .toSet()
      .toList()
    ..sort();

  List<ManagedStudent> get _filtered {
    var list = _students
        .where((s) => s.stream == _selectedStream)
        .where((s) => _selectedGroup.isEmpty || s.group == _selectedGroup)
        .toList();
    if (_query.isNotEmpty) {
      list = list
          .where((s) =>
              s.name.toLowerCase().contains(_query.toLowerCase()) ||
              s.group.toLowerCase().contains(_query.toLowerCase()))
          .toList();
    }
    // Старосты — наверх
    list.sort((a, b) {
      if (a.isHeadman && !b.isHeadman) return -1;
      if (!a.isHeadman && b.isHeadman) return 1;
      return a.name.compareTo(b.name);
    });
    return list;
  }

  @override
  void initState() {
    super.initState();
    _selectedGroup = _groups.isNotEmpty ? _groups.first : '';
  }

  @override
  Widget build(BuildContext context) {
    final cs  = widget.cs;
    final ext = widget.ext;
    final tt  = widget.tt;

    return SliverMainAxisGroup(
      slivers: [
        // Поток
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Чипы потоков
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _streams.map((stream) {
                      final isActive = stream == _selectedStream;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: _FilterChip(
                          label: stream,
                          isActive: isActive,
                          onTap: () => setState(() {
                            _selectedStream = stream;
                            _selectedGroup =
                                _groups.isNotEmpty ? _groups.first : '';
                          }),
                          cs: cs, ext: ext, tt: tt,
                        ),
                      );
                    }).toList(),
                  ),
                ),

                const SizedBox(height: 10),

                // Чипы групп
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: _FilterChip(
                          label: 'Все группы',
                          isActive: _selectedGroup.isEmpty,
                          onTap: () => setState(() => _selectedGroup = ''),
                          cs: cs, ext: ext, tt: tt,
                        ),
                      ),
                      ..._groups.map((g) => Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: _FilterChip(
                              label: g,
                              isActive: _selectedGroup == g,
                              onTap: () =>
                                  setState(() => _selectedGroup = g),
                              cs: cs, ext: ext, tt: tt,
                            ),
                          )),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                // Поиск
                TextField(
                  onChanged: (v) => setState(() => _query = v),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search,
                        color: ext.textTertiary, size: 20),
                    hintText: 'Поиск студента или группы',
                    hintStyle:
                        tt.bodyMedium?.copyWith(color: ext.textTertiary),
                  ),
                ),

                const SizedBox(height: 12),

                // Счётчик
                Text(
                  '${_filtered.length} студентов',
                  style: tt.labelSmall?.copyWith(color: ext.textSecondary),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),

        // Список
        _filtered.isEmpty
            ? SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 48),
                  child: Center(
                    child: Text('Ничего не найдено',
                        style: tt.bodyMedium
                            ?.copyWith(color: ext.textSecondary)),
                  ),
                ),
              )
            : SliverList.separated(
                separatorBuilder: (_, __) =>
                    Divider(height: 1, color: ext.divider, indent: 72),
                itemCount: _filtered.length,
                itemBuilder: (_, i) => _StudentRow(
                  student: _filtered[i],
                  cs: cs, ext: ext, tt: tt,
                ),
              ),

        const SliverPadding(padding: EdgeInsets.only(bottom: 32)),
      ],
    );
  }
}

// ── Строка студента ──────────────────────────────────────────
class _StudentRow extends StatelessWidget {
  const _StudentRow({
    required this.student,
    required this.cs, required this.ext, required this.tt,
  });

  final ManagedStudent student;
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showDetailSheet(
        context: context,
        child: _StudentDetail(
            student: student, cs: cs, ext: ext, tt: tt),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            _InitialsAvatar(
                name: student.name, size: 44, primary: cs.primary),
            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          _short(student.name),
                          style: tt.labelLarge?.copyWith(
                              fontWeight: FontWeight.w600),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (student.isHeadman) ...[
                        const SizedBox(width: 6),
                        _Badge(
                            label: 'Ст.',
                            bg: ext.infoBg,
                            fg: ext.infoFg),
                      ],
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(student.group,
                      style: tt.labelSmall
                          ?.copyWith(color: ext.textSecondary)),
                ],
              ),
            ),

            // Быстрые контакты
            Row(
              children: [
                if (student.telegram != null)
                  _ContactIcon(
                    icon: Icons.telegram,
                    color: cs.primary,
                    onTap: () {},
                  ),
                if (student.phone != null)
                  _ContactIcon(
                    icon: Icons.phone_outlined,
                    color: ext.textSecondary,
                    onTap: () {},
                  ),
              ],
            ),

            Icon(Icons.chevron_right, size: 18, color: ext.textTertiary),
          ],
        ),
      ),
    );
  }

  String _short(String full) {
    final p = full.trim().split(' ');
    if (p.length == 1) return p[0];
    return '${p[0]} ${p.length > 1 ? '${p[1][0]}.' : ''}${p.length > 2 ? '${p[2][0]}.' : ''}';
  }
}

// ── Детальная карточка студента ──────────────────────────────
class _StudentDetail extends StatelessWidget {
  const _StudentDetail({
    required this.student,
    required this.cs, required this.ext, required this.tt,
  });

  final ManagedStudent student;
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Шапка
        Row(
          children: [
            _InitialsAvatar(
                name: student.name, size: 56, primary: cs.primary),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(student.name,
                      style: tt.titleMedium
                          ?.copyWith(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(student.group,
                          style: tt.labelSmall
                              ?.copyWith(color: ext.textSecondary)),
                      if (student.isHeadman) ...[
                        const SizedBox(width: 8),
                        _Badge(
                            label: 'Староста',
                            bg: ext.infoBg,
                            fg: ext.infoFg),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),

        Divider(color: ext.divider, height: 24),

        // Контакты
        if (student.phone != null)
          _ContactRow(
              icon: Icons.phone_outlined,
              label: 'Телефон',
              value: student.phone!,
              ext: ext, tt: tt),
        if (student.telegram != null) ...[
          const SizedBox(height: 10),
          _ContactRow(
              icon: Icons.telegram,
              label: 'Telegram',
              value: student.telegram!,
              ext: ext, tt: tt),
        ],
        if (student.email != null) ...[
          const SizedBox(height: 10),
          _ContactRow(
              icon: Icons.mail_outline,
              label: 'Почта',
              value: student.email!,
              ext: ext, tt: tt),
        ],

        if (student.phone == null &&
            student.telegram == null &&
            student.email == null) ...[
          Text('Контакты не указаны',
              style: tt.bodyMedium?.copyWith(color: ext.textSecondary)),
        ],

        const SizedBox(height: 24),

        // Кнопка написать
        SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton.icon(
            onPressed: () {}, // TODO: открыть чат со студентом
            icon: const Icon(Icons.send_outlined, size: 18),
            label: const Text('Написать'),
          ),
        ),
      ],
    );
  }
}

// ════════════════════════════════════════════════════════════
// Вкладка 2 — Публикация (объявление или событие)
// ════════════════════════════════════════════════════════════
class _PublishTab extends StatefulWidget {
  const _PublishTab({required this.cs, required this.ext, required this.tt});
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  @override
  State<_PublishTab> createState() => _PublishTabState();
}

class _PublishTabState extends State<_PublishTab> {
  String _type     = 'announcement'; // announcement / event
  String _audience = 'all';          // all / stream / group
  bool   _isPinned = false;

  final _titleCtrl = TextEditingController();
  final _bodyCtrl  = TextEditingController();
  final _dateCtrl  = TextEditingController();
  final _placeCtrl = TextEditingController();

  @override
  void dispose() {
    _titleCtrl.dispose();
    _bodyCtrl.dispose();
    _dateCtrl.dispose();
    _placeCtrl.dispose();
    super.dispose();
  }

  void _publish(BuildContext context) {
    // TODO: вызвать PostBloc.add(CreatePost(...))
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_type == 'announcement'
            ? 'Объявление опубликовано'
            : 'Событие создано'),
        backgroundColor: widget.ext.successBg,
      ),
    );
    _titleCtrl.clear();
    _bodyCtrl.clear();
    _dateCtrl.clear();
    _placeCtrl.clear();
    setState(() {
      _isPinned = false;
      _audience = 'all';
    });
  }

  @override
  Widget build(BuildContext context) {
    final cs  = widget.cs;
    final ext = widget.ext;
    final tt  = widget.tt;

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Тип публикации
            Container(
              decoration: BoxDecoration(
                color: ext.surfaceTinted,
                borderRadius: BorderRadius.circular(AppTheme.radiusMd),
              ),
              padding: const EdgeInsets.all(4),
              child: Row(
                children: [
                  _TypeSegment(
                    icon: Icons.campaign_outlined,
                    label: 'Объявление',
                    value: 'announcement',
                    selected: _type,
                    onTap: () => setState(() => _type = 'announcement'),
                    cs: cs, ext: ext, tt: tt,
                  ),
                  _TypeSegment(
                    icon: Icons.event_outlined,
                    label: 'Событие',
                    value: 'event',
                    selected: _type,
                    onTap: () => setState(() => _type = 'event'),
                    cs: cs, ext: ext, tt: tt,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Заголовок
            TextField(
              controller: _titleCtrl,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                labelText: 'Заголовок',
                hintText: _type == 'announcement'
                    ? 'Запись на элективы открыта'
                    : 'Хакатон по компьютерному зрению',
                prefixIcon: Icon(Icons.title, size: 20, color: ext.textTertiary),
              ),
            ),

            const SizedBox(height: 14),

            // Текст
            TextField(
              controller: _bodyCtrl,
              maxLines: 5,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                labelText: 'Текст',
                hintText: 'Подробное описание...',
                alignLabelWithHint: true,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(bottom: 64),
                  child: Icon(Icons.notes, size: 20, color: ext.textTertiary),
                ),
              ),
            ),

            // Поля только для события
            if (_type == 'event') ...[
              const SizedBox(height: 14),
              TextField(
                controller: _dateCtrl,
                readOnly: true,
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                    builder: (_, child) => Theme(
                      data: Theme.of(context),
                      child: child!,
                    ),
                  );
                  if (date != null) {
                    _dateCtrl.text =
                        '${date.day}.${date.month}.${date.year}';
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Дата проведения',
                  hintText: 'Выберите дату',
                  prefixIcon: Icon(Icons.calendar_today_outlined,
                      size: 20, color: ext.textTertiary),
                ),
              ),
              const SizedBox(height: 14),
              TextField(
                controller: _placeCtrl,
                decoration: InputDecoration(
                  labelText: 'Место проведения',
                  hintText: 'Корпус Л4, ауд. 21',
                  prefixIcon: Icon(Icons.location_on_outlined,
                      size: 20, color: ext.textTertiary),
                ),
              ),
            ],

            const SizedBox(height: 20),

            // Аудитория
            Text('Аудитория', style: tt.labelLarge),
            const SizedBox(height: 8),
            _AudienceSelector(
              selected: _audience,
              onChanged: (v) => setState(() => _audience = v),
              cs: cs, ext: ext, tt: tt,
            ),

            // Закрепить (только объявление)
            if (_type == 'announcement') ...[
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: cs.surface,
                  borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                  border: Border.all(color: ext.border),
                ),
                child: SwitchListTile(
                  dense: true,
                  title: Text('Закрепить объявление', style: tt.labelLarge),
                  subtitle: Text('Будет отображаться вверху списка',
                      style: tt.labelSmall
                          ?.copyWith(color: ext.textSecondary)),
                  value: _isPinned,
                  activeColor: cs.primary,
                  onChanged: (v) => setState(() => _isPinned = v),
                ),
              ),
            ],

            const SizedBox(height: 28),

            // Кнопка
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: () => _publish(context),
                icon: Icon(
                  _type == 'announcement'
                      ? Icons.send_outlined
                      : Icons.event_available_outlined,
                  size: 18,
                ),
                label: Text(_type == 'announcement'
                    ? 'Опубликовать объявление'
                    : 'Создать событие'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Сегмент типа публикации ──────────────────────────────────
class _TypeSegment extends StatelessWidget {
  const _TypeSegment({
    required this.icon,
    required this.label,
    required this.value,
    required this.selected,
    required this.onTap,
    required this.cs, required this.ext, required this.tt,
  });
  final IconData icon;
  final String label, value, selected;
  final VoidCallback onTap;
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    final isSelected = value == selected;
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? cs.surface : Colors.transparent,
            borderRadius: BorderRadius.circular(AppTheme.radiusSm),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon,
                  size: 16,
                  color: isSelected ? cs.primary : ext.textSecondary),
              const SizedBox(width: 6),
              Text(label,
                  style: tt.labelLarge?.copyWith(
                    fontWeight:
                        isSelected ? FontWeight.w600 : FontWeight.w500,
                    color: isSelected
                        ? ext.textPrimary
                        : ext.textSecondary,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Выбор аудитории ──────────────────────────────────────────
class _AudienceSelector extends StatelessWidget {
  const _AudienceSelector({
    required this.selected,
    required this.onChanged,
    required this.cs, required this.ext, required this.tt,
  });
  final String selected;
  final ValueChanged<String> onChanged;
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  static const _options = [
    (value: 'all',    label: 'Все',      icon: Icons.public_outlined),
    (value: 'stream', label: 'Поток',    icon: Icons.account_tree_outlined),
    (value: 'group',  label: 'Группа',   icon: Icons.groups_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _options.map((o) {
        final isActive = o.value == selected;
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
                right: o == _options.last ? 0 : 8),
            child: GestureDetector(
              onTap: () => onChanged(o.value),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: isActive ? cs.primary : ext.surfaceTinted,
                  borderRadius:
                      BorderRadius.circular(AppTheme.radiusMd),
                ),
                child: Column(
                  children: [
                    Icon(o.icon,
                        size: 18,
                        color: isActive
                            ? cs.onPrimary
                            : ext.textOnTinted),
                    const SizedBox(height: 4),
                    Text(o.label,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: isActive
                              ? cs.onPrimary
                              : ext.textOnTinted,
                          height: 1,
                        )),
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

// ════════════════════════════════════════════════════════════
// Вкладка 3 — Темы ВКР преподавателя
// ════════════════════════════════════════════════════════════
class _ThesesTab extends StatelessWidget {
  const _ThesesTab({
    required this.theses,
    required this.onChanged,
    required this.onAdd,
    required this.cs, required this.ext, required this.tt,
  });

  final List<ManagedThesis> theses;
  final ValueChanged<ManagedThesis> onChanged;
  final ValueChanged<String> onAdd;
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  void _showAddDialog(BuildContext context) {
    final ctrl = TextEditingController();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: cs.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppTheme.radiusLg)),
      ),
      builder: (_) => Padding(
        padding: EdgeInsets.fromLTRB(
          16, 20, 16,
          MediaQuery.of(context).viewInsets.bottom + 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 36, height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                    color: ext.border,
                    borderRadius: BorderRadius.circular(2)),
              ),
            ),
            Text('Новая тема ВКР', style: tt.titleMedium),
            const SizedBox(height: 16),
            TextField(
              controller: ctrl,
              textCapitalization: TextCapitalization.sentences,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Название темы',
                hintText: 'Разработка системы...',
                alignLabelWithHint: true,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  if (ctrl.text.trim().isNotEmpty) {
                    onAdd(ctrl.text.trim());
                    Navigator.pop(context);
                  }
                },
                child: const Text('Добавить тему'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        // Кнопка добавить
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '${theses.length} тем · '
                    '${theses.where((t) => t.isFree).length} свободных',
                    style: tt.labelSmall
                        ?.copyWith(color: ext.textSecondary),
                  ),
                ),
                GestureDetector(
                  onTap: () => _showAddDialog(context),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 7),
                    decoration: BoxDecoration(
                      color: cs.primary.withValues(alpha: .1),
                      borderRadius:
                          BorderRadius.circular(AppTheme.radiusSm),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.add, size: 16, color: cs.primary),
                        const SizedBox(width: 4),
                        Text('Добавить',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: cs.primary,
                              height: 1,
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Список тем
        SliverList.separated(
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemCount: theses.length,
          itemBuilder: (_, i) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _ThesisManageCard(
              thesis: theses[i],
              onToggleFree: () => onChanged(ManagedThesis(
                id: theses[i].id,
                title: theses[i].title,
                isFree: !theses[i].isFree,
                takenBy: theses[i].takenBy,
              )),
              cs: cs, ext: ext, tt: tt,
            ),
          ),
        ),

        const SliverPadding(padding: EdgeInsets.only(bottom: 32)),
      ],
    );
  }
}

class _ThesisManageCard extends StatelessWidget {
  const _ThesisManageCard({
    required this.thesis,
    required this.onToggleFree,
    required this.cs, required this.ext, required this.tt,
  });

  final ManagedThesis thesis;
  final VoidCallback onToggleFree;
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
                child: Text(thesis.title,
                    style: tt.labelLarge?.copyWith(
                        fontWeight: FontWeight.w600, fontSize: 14)),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 9, vertical: 4),
                decoration: BoxDecoration(
                  color: thesis.isFree ? ext.successBg : ext.errorBg,
                  borderRadius:
                      BorderRadius.circular(AppTheme.radiusSm),
                ),
                child: Text(
                  thesis.isFree ? 'Свободна' : 'Занята',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: thesis.isFree ? ext.successFg : ext.errorFg,
                    height: 1,
                  ),
                ),
              ),
            ],
          ),

          if (!thesis.isFree && thesis.takenBy != null) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.person_outline,
                    size: 13, color: ext.textTertiary),
                const SizedBox(width: 4),
                Text(thesis.takenBy!,
                    style: tt.labelSmall
                        ?.copyWith(color: ext.textSecondary)),
              ],
            ),
          ],

          const SizedBox(height: 12),

          // Кнопка изменить статус
          SizedBox(
            width: double.infinity,
            height: 40,
            child: OutlinedButton(
              onPressed: onToggleFree,
              child: Text(
                thesis.isFree ? 'Пометить как занятую' : 'Освободить тему',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════
// Переиспользуемые виджеты
// ════════════════════════════════════════════════════════════

class _SegmentedControl extends StatelessWidget {
  const _SegmentedControl({
    required this.tabs,
    required this.selected,
    required this.onChanged,
    required this.cs, required this.ext, required this.tt,
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
                  borderRadius:
                      BorderRadius.circular(AppTheme.radiusSm),
                ),
                alignment: Alignment.center,
                child: Text(tabs[i],
                    style: tt.labelLarge?.copyWith(
                      fontSize: 13,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w500,
                      color: isSelected
                          ? ext.textPrimary
                          : ext.textSecondary,
                    )),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.isActive,
    required this.onTap,
    required this.cs, required this.ext, required this.tt,
  });
  final String label;
  final bool isActive;
  final VoidCallback onTap;
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: isActive ? cs.primary : ext.surfaceTinted,
            borderRadius: BorderRadius.circular(AppTheme.radiusSm),
          ),
          child: Text(label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: isActive ? cs.onPrimary : ext.textOnTinted,
                height: 1,
              )),
        ),
      );
}

class _Badge extends StatelessWidget {
  const _Badge({required this.label, required this.bg, required this.fg});
  final String label;
  final Color bg, fg;

  @override
  Widget build(BuildContext context) => Container(
        padding:
            const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(label,
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: fg,
                height: 1)),
      );
}

class _ContactRow extends StatelessWidget {
  const _ContactRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.ext,
    required this.tt,
  });
  final IconData icon;
  final String label, value;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Icon(icon, size: 16, color: ext.textTertiary),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: tt.labelSmall
                      ?.copyWith(color: ext.textSecondary)),
              Text(value, style: tt.labelLarge),
            ],
          ),
        ],
      );
}

class _ContactIcon extends StatelessWidget {
  const _ContactIcon({
    required this.icon,
    required this.color,
    required this.onTap,
  });
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Icon(icon, size: 18, color: color),
        ),
      );
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
    Color(0xFFFF9900), Color(0xFFFFB84D), Color(0xFFE68A00),
    Color(0xFFCC7A00), Color(0xFFFFA726), Color(0xFFFB8C00),
  ];

  Color get _bg {
    int h = 0;
    for (final c in name.codeUnits) { h = (h * 31 + c) & 0x7FFFFFFF; }
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
        width: size, height: size,
        decoration: BoxDecoration(shape: BoxShape.circle, color: _bg),
        alignment: Alignment.center,
        child: Text(_initials,
            style: TextStyle(
              fontSize: size * 0.34,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              height: 1,
            )),
      );
}
