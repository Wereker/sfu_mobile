import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sfu/src/core/theme/app_theme.dart';


// ════════════════════════════════════════════════════════════
// Модели
// ════════════════════════════════════════════════════════════

enum AttendanceStatus { present, absent, late, excused }

class AttendanceStudent {
  final String id;
  final String name;
  final bool isHeadman; // Староста
  AttendanceStatus status;

  AttendanceStudent({
    required this.id,
    required this.name,
    this.isHeadman = false,
    this.status = AttendanceStatus.absent,
  });

  AttendanceStudent copyWith({AttendanceStatus? status}) => AttendanceStudent(
        id: id,
        name: name,
        isHeadman: isHeadman,
        status: status ?? this.status,
      );
}

class AttendanceLesson {
  final String id;
  final String subject;
  final String type;
  final String time;
  final String place;
  final String group;
  final List<AttendanceStudent> students;
  bool isStarted;

  AttendanceLesson({
    required this.id,
    required this.subject,
    required this.type,
    required this.time,
    required this.place,
    required this.group,
    required this.students,
    this.isStarted = false,
  });

  int get presentCount =>
      students.where((s) => s.status == AttendanceStatus.present || s.status == AttendanceStatus.late).length;

  int get totalCount => students.length;

  double get attendanceRate => totalCount == 0 ? 0 : presentCount / totalCount;
}

List<AttendanceStudent> _makeStudents(List<(String, bool)> data) => data
    .asMap()
    .entries
    .map((e) => AttendanceStudent(
          id: 'st_${e.key}',
          name: e.value.$1,
          isHeadman: e.value.$2,
        ))
    .toList();

final _sampleLessons = [
  AttendanceLesson(
    id: 'lesson_1',
    subject: 'Машинное обучение',
    type: 'лекция',
    time: '10:15–11:50',
    place: 'Л4-21',
    group: 'БИ22-01',
    students: _makeStudents([
      ('Алексеев Дмитрий Сергеевич', false),
      ('Борисова Анна Игоревна', false),
      ('Волков Кирилл Павлович', true),  // Староста
      ('Гришина Мария Александровна', false),
      ('Данилов Артём Олегович', false),
      ('Егорова Полина Вячеславовна', false),
      ('Жуков Никита Романович', false),
      ('Захарова Виктория Андреевна', false),
      ('Иванов Максим Дмитриевич', false),
      ('Козлова Екатерина Юрьевна', false),
      ('Лебедев Антон Сергеевич', false),
      ('Морозов Илья Владимирович', false),
    ]),
    isStarted: true,
  ),
  AttendanceLesson(
    id: 'lesson_2',
    subject: 'Глубокое обучение',
    type: 'пр. занятие',
    time: '12:00–13:35',
    place: 'Л4-12',
    group: 'БИ22-02',
    students: _makeStudents([
      ('Антонова Светлана Николаевна', false),
      ('Белов Роман Андреевич', false),
      ('Громова Ирина Петровна', true),
      ('Дроздов Евгений Михайлович', false),
      ('Елисеева Татьяна Сергеевна', false),
      ('Зайцев Александр Иванович', false),
      ('Кириллова Юлия Дмитриевна', false),
      ('Лазарев Павел Олегович', false),
      ('Макарова Надежда Викторовна', false),
      ('Никитин Сергей Романович', false),
    ]),
  ),
  AttendanceLesson(
    id: 'lesson_3',
    subject: 'Компьютерное зрение',
    type: 'лаб. работа',
    time: '14:10–15:45',
    place: 'УЛК 2-15',
    group: 'БИ22-01',
    students: _makeStudents([
      ('Алексеев Дмитрий Сергеевич', false),
      ('Борисова Анна Игоревна', false),
      ('Волков Кирилл Павлович', true),
      ('Гришина Мария Александровна', false),
      ('Данилов Артём Олегович', false),
      ('Егорова Полина Вячеславовна', false),
    ]),
  ),
];

// ════════════════════════════════════════════════════════════
// Экран
// ════════════════════════════════════════════════════════════
class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  int _selectedDay = DateTime.now().weekday.clamp(1, 6);
  late List<AttendanceLesson> _lessons;

  static const _dowShort = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб'];

  @override
  void initState() {
    super.initState();
    // Глубокая копия чтобы изменения статусов не портили оригинал
    _lessons = _sampleLessons
        .map((l) => AttendanceLesson(
              id: l.id,
              subject: l.subject,
              type: l.type,
              time: l.time,
              place: l.place,
              group: l.group,
              students: l.students
                  .map((s) => AttendanceStudent(
                        id: s.id,
                        name: s.name,
                        isHeadman: s.isHeadman,
                        status: s.status,
                      ))
                  .toList(),
              isStarted: l.isStarted,
            ))
        .toList();
  }

  DateTime _dateForWeekday(int wd) {
    final today = DateTime.now();
    final monday = today.subtract(Duration(days: today.weekday - 1));
    return monday.add(Duration(days: wd - 1));
  }

  void _openJournal(AttendanceLesson lesson) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      builder: (_) => _JournalSheet(
        lesson: lesson,
        onStudentStatusChanged: (studentId, status) {
          setState(() {
            final lessonIndex = _lessons.indexWhere((l) => l.id == lesson.id);
            if (lessonIndex == -1) return;
            final studentIndex = _lessons[lessonIndex]
                .students
                .indexWhere((s) => s.id == studentId);
            if (studentIndex == -1) return;
            _lessons[lessonIndex].students[studentIndex].status = status;
          });
        },
        onStartLesson: () {
          setState(() {
            final idx = _lessons.indexWhere((l) => l.id == lesson.id);
            if (idx != -1) _lessons[idx].isStarted = true;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;
    final now = DateTime.now();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // ── AppBar ────────────────────────────────────────
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
                          Text('Журнал', style: tt.displaySmall),
                          const SizedBox(height: 2),
                          Text(
                            'Посещаемость',
                            style: tt.labelLarge
                                ?.copyWith(color: ext.textSecondary),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 48, height: 48,
                      decoration: BoxDecoration(
                        color: cs.primary,
                        borderRadius:
                        BorderRadius.circular(AppTheme.radiusMd),
                      ),
                      padding: const EdgeInsets.all(6),
                      child: SvgPicture.asset('assets/images/logo_app_bar.svg'),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ── Чипы дней ────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Row(
                children: List.generate(6, (i) {
                  final wd = i + 1;
                  final date = _dateForWeekday(wd);
                  final isActive = wd == _selectedDay;
                  final isToday = wd == now.weekday;

                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: i < 5 ? 6 : 0),
                      child: GestureDetector(
                        onTap: () => setState(() => _selectedDay = wd),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 150),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: isActive ? cs.primary : cs.surface,
                            borderRadius:
                                BorderRadius.circular(AppTheme.radiusMd),
                            border: Border.all(
                              color: isActive
                                  ? cs.primary
                                  : isToday
                                      ? cs.primary.withValues(alpha: .4)
                                      : ext.border,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(_dowShort[i],
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: isActive
                                        ? cs.onPrimary
                                        : ext.textSecondary,
                                  )),
                              const SizedBox(height: 3),
                              Text('${date.day}',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: isActive
                                        ? cs.onPrimary
                                        : ext.textPrimary,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
            sliver: _lessons.isEmpty
                ? SliverToBoxAdapter(
                    child: _EmptyDay(ext: ext, tt: tt),
                  )
                : SliverList.separated(
                    separatorBuilder: (_, __) =>
                        const SizedBox(height: 10),
                    itemCount: _lessons.length,
                    itemBuilder: (_, i) => _LessonAttendanceCard(
                      lesson: _lessons[i],
                      onTap: () => _openJournal(_lessons[i]),
                      cs: cs,
                      ext: ext,
                      tt: tt,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════
// Карточка пары со статистикой явки
// ════════════════════════════════════════════════════════════
class _LessonAttendanceCard extends StatelessWidget {
  const _LessonAttendanceCard({
    required this.lesson,
    required this.onTap,
    required this.cs,
    required this.ext,
    required this.tt,
  });

  final AttendanceLesson lesson;
  final VoidCallback onTap;
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  Color _typeBg() {
    switch (lesson.type) {
      case 'лекция':      return ext.infoBg;
      case 'пр. занятие': return ext.successBg;
      case 'лаб. работа': return ext.warningBg;
      default:            return ext.divider;
    }
  }

  Color _typeFg() {
    switch (lesson.type) {
      case 'лекция':      return ext.infoFg;
      case 'пр. занятие': return ext.successFg;
      case 'лаб. работа': return ext.warningFg;
      default:            return ext.textSecondary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final rate    = lesson.attendanceRate;
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
                  // Верхняя строка
                  Row(
                    children: [
                      // Тип пары
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 7, vertical: 3),
                        decoration: BoxDecoration(
                          color: _typeBg(),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(lesson.type,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: _typeFg(),
                              height: 1,
                            )),
                      ),
                      const Spacer(),
                      Text(lesson.time,
                          style: tt.labelSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: ext.textSecondary)),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Название
                  Text(lesson.subject, style: tt.titleMedium?.copyWith(fontSize: 15)),

                  const SizedBox(height: 4),

                  // Группа + место
                  Row(
                    children: [
                      Icon(Icons.groups_outlined,
                          size: 13, color: ext.textTertiary),
                      const SizedBox(width: 4),
                      Text(lesson.group,
                          style: tt.labelSmall
                              ?.copyWith(color: ext.textSecondary)),
                      const SizedBox(width: 10),
                      Icon(Icons.location_on_outlined,
                          size: 13, color: ext.textTertiary),
                      const SizedBox(width: 4),
                      Text(lesson.place,
                          style: tt.labelSmall
                              ?.copyWith(color: ext.textSecondary)),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Прогресс явки
                  if (started) ...[
                    Row(
                      children: [
                        Text(
                          '${lesson.presentCount} из ${lesson.totalCount} присутствует',
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
                        Text('${(rate * 100).round()}%',
                            style: tt.labelSmall?.copyWith(
                                color: ext.textTertiary)),
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
                        Text('${lesson.totalCount} студентов',
                            style: tt.labelSmall
                                ?.copyWith(color: ext.textSecondary)),
                        const Spacer(),
                        Text('Нажмите, чтобы начать',
                            style: tt.labelSmall
                                ?.copyWith(color: ext.textTertiary)),
                      ],
                    ),
                  ],
                ],
              ),
            ),

            // Left border — активная пара
            if (started)
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
// Шторка журнала пары
// ════════════════════════════════════════════════════════════
class _JournalSheet extends StatefulWidget {
  const _JournalSheet({
    required this.lesson,
    required this.onStudentStatusChanged,
    required this.onStartLesson,
  });

  final AttendanceLesson lesson;
  final void Function(String studentId, AttendanceStatus status)
      onStudentStatusChanged;
  final VoidCallback onStartLesson;

  @override
  State<_JournalSheet> createState() => _JournalSheetState();
}

class _JournalSheetState extends State<_JournalSheet> {
  late List<AttendanceStudent> _students;
  String _filter = 'all'; // all / present / absent

  @override
  void initState() {
    super.initState();
    _students = widget.lesson.students
        .map((s) => AttendanceStudent(
              id: s.id,
              name: s.name,
              isHeadman: s.isHeadman,
              status: s.status,
            ))
        .toList();
  }

  void _setStatus(AttendanceStudent student, AttendanceStatus status) {
    setState(() => student.status = status);
    widget.onStudentStatusChanged(student.id, status);
  }

  void _markAll(AttendanceStatus status) {
    for (final s in _students) {
      _setStatus(s, status);
    }
  }

  List<AttendanceStudent> get _filtered {
    switch (_filter) {
      case 'present':
        return _students
            .where((s) =>
                s.status == AttendanceStatus.present ||
                s.status == AttendanceStatus.late)
            .toList();
      case 'absent':
        return _students
            .where((s) =>
                s.status == AttendanceStatus.absent ||
                s.status == AttendanceStatus.excused)
            .toList();
      default:
        return _students;
    }
  }

  int get _presentCount => _students
      .where((s) =>
          s.status == AttendanceStatus.present ||
          s.status == AttendanceStatus.late)
      .length;

  void _openQr(BuildContext context) {
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;

    // Генерируем уникальный токен для пары
    final token =
        'sfu_attend_${widget.lesson.id}_${DateTime.now().millisecondsSinceEpoch}';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      builder: (_) => _QrModal(
        token: token,
        lessonTitle: widget.lesson.subject,
        group: widget.lesson.group,
        cs: cs,
        ext: ext,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;
    final screenH = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        // Блюр
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: Container(color: Colors.black.withValues(alpha: .35)),
          ),
        ),

        // Шторка
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: screenH * 0.78,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(AppTheme.radiusLg),
              ),
            ),
            child: Column(
              children: [
                // Ручка
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 4),
                  child: Container(
                    width: 36, height: 4,
                    decoration: BoxDecoration(
                      color: ext.border,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),

                // Заголовок шторки
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.lesson.subject,
                                    style: tt.titleMedium),
                                const SizedBox(height: 2),
                                Text(
                                  '${widget.lesson.group} · ${widget.lesson.time} · ${widget.lesson.place}',
                                  style: tt.labelSmall
                                      ?.copyWith(color: ext.textSecondary),
                                ),
                              ],
                            ),
                          ),
                          // QR-кнопка
                          _QrButton(
                            onTap: () => _openQr(context),
                            cs: cs,
                            ext: ext,
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      // Статистика + кнопки быстрой отметки
                      Row(
                        children: [
                          // Счётчик
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              color: ext.successBg,
                              borderRadius:
                                  BorderRadius.circular(AppTheme.radiusSm),
                            ),
                            child: Text(
                              '$_presentCount / ${_students.length}',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: ext.successFg,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),

                          // Отметить всех
                          _SmallButton(
                            label: 'Все здесь',
                            icon: Icons.done_all,
                            onTap: () =>
                                _markAll(AttendanceStatus.present),
                            cs: cs,
                            ext: ext,
                          ),
                          const SizedBox(width: 6),
                          _SmallButton(
                            label: 'Сбросить',
                            icon: Icons.restart_alt,
                            onTap: () =>
                                _markAll(AttendanceStatus.absent),
                            cs: cs,
                            ext: ext,
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      // Фильтр-чипы
                      Row(
                        children: [
                          _FilterChip(
                            label: 'Все',
                            isActive: _filter == 'all',
                            onTap: () => setState(() => _filter = 'all'),
                            cs: cs, ext: ext, tt: tt,
                          ),
                          const SizedBox(width: 6),
                          _FilterChip(
                            label: 'Присутствуют',
                            isActive: _filter == 'present',
                            onTap: () =>
                                setState(() => _filter = 'present'),
                            cs: cs, ext: ext, tt: tt,
                          ),
                          const SizedBox(width: 6),
                          _FilterChip(
                            label: 'Отсутствуют',
                            isActive: _filter == 'absent',
                            onTap: () =>
                                setState(() => _filter = 'absent'),
                            cs: cs, ext: ext, tt: tt,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Divider(height: 16, color: ext.divider),

                // Если пара не начата — кнопка начать
                if (!widget.lesson.isStarted)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                    child: SizedBox(
                      width: double.infinity,
                      height: 44,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          widget.onStartLesson();
                          setState(() {});
                        },
                        icon: const Icon(Icons.play_arrow_rounded, size: 18),
                        label: const Text('Начать занятие'),
                      ),
                    ),
                  ),

                // Список студентов
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    separatorBuilder: (_, __) =>
                        Divider(height: 1, color: ext.divider),
                    itemCount: _filtered.length,
                    itemBuilder: (_, i) => _StudentRow(
                      student: _filtered[i],
                      onStatusChanged: (status) =>
                          _setStatus(_filtered[i], status),
                      cs: cs,
                      ext: ext,
                      tt: tt,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ════════════════════════════════════════════════════════════
// Строка студента в журнале
// ════════════════════════════════════════════════════════════
class _StudentRow extends StatelessWidget {
  const _StudentRow({
    required this.student,
    required this.onStatusChanged,
    required this.cs,
    required this.ext,
    required this.tt,
  });

  final AttendanceStudent student;
  final ValueChanged<AttendanceStatus> onStatusChanged;
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  static const _statusColors = {
    AttendanceStatus.present: (bg: Color(0x1A10B981), fg: Color(0xFF047857)),
    AttendanceStatus.absent:  (bg: Color(0x1AEF4444), fg: Color(0xFFB91C1C)),
    AttendanceStatus.late:    (bg: Color(0x1FF59E0B), fg: Color(0xFFB45309)),
    AttendanceStatus.excused: (bg: Color(0x1A6366F1), fg: Color(0xFF4338CA)),
  };

  static const _statusLabels = {
    AttendanceStatus.present: 'Присут.',
    AttendanceStatus.absent:  'Отсутст.',
    AttendanceStatus.late:    'Опоздал',
    AttendanceStatus.excused: 'УВ',
  };

  static const _statusIcons = {
    AttendanceStatus.present: Icons.check_circle_outline,
    AttendanceStatus.absent:  Icons.cancel_outlined,
    AttendanceStatus.late:    Icons.watch_later_outlined,
    AttendanceStatus.excused: Icons.info_outline,
  };

  void _showStatusPicker(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;
    final cs  = Theme.of(context).colorScheme;

    showModalBottomSheet(
      context: context,
      backgroundColor: cs.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppTheme.radiusLg),
        ),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
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
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Text(student.name.split(' ').first,
                style: tt.titleMedium),
            const SizedBox(height: 12),
            ...AttendanceStatus.values.map((status) {
              final colors = _statusColors[status]!;
              final isSelected = student.status == status;
              return ListTile(
                dense: true,
                leading: Container(
                  width: 32, height: 32,
                  decoration: BoxDecoration(
                    color: colors.bg,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(_statusIcons[status],
                      size: 16, color: colors.fg),
                ),
                title: Text(_statusLabels[status]!,
                    style: tt.labelLarge?.copyWith(
                      fontWeight: isSelected
                          ? FontWeight.w700
                          : FontWeight.w400,
                    )),
                trailing: isSelected
                    ? Icon(Icons.check, color: cs.primary, size: 18)
                    : null,
                onTap: () {
                  onStatusChanged(status);
                  Navigator.pop(context);
                },
              );
            }),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = _statusColors[student.status]!;
    final label  = _statusLabels[student.status]!;
    final icon   = _statusIcons[student.status]!;

    return InkWell(
      onTap: () => _showStatusPicker(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            // Аватар
            _InitialsAvatar(name: student.name, size: 36, primary: cs.primary),
            const SizedBox(width: 12),

            // Имя + «Ст.»
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          // Сокращение ФИО: Фамилия И. О.
                          _shortName(student.name),
                          style: tt.labelLarge?.copyWith(fontSize: 14),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (student.isHeadman) ...[
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: ext.infoBg,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text('Ст.',
                              style: TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w700,
                                  color: ext.infoFg,
                                  height: 1)),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),

            // Статус
            GestureDetector(
              onTap: () => _showStatusPicker(context),
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: colors.bg,
                  borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(icon, size: 12, color: colors.fg),
                    const SizedBox(width: 4),
                    Text(label,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: colors.fg,
                          height: 1,
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _shortName(String fullName) {
    final parts = fullName.trim().split(' ');
    if (parts.length == 1) return parts[0];
    final last   = parts[0];
    final first  = parts.length > 1 ? '${parts[1][0]}.' : '';
    final middle = parts.length > 2 ? '${parts[2][0]}.' : '';
    return '$last $first$middle';
  }
}

// ════════════════════════════════════════════════════════════
// Модалка с QR-кодом
// ════════════════════════════════════════════════════════════
class _QrModal extends StatefulWidget {
  const _QrModal({
    required this.token,
    required this.lessonTitle,
    required this.group,
    required this.cs,
    required this.ext,
  });

  final String token;
  final String lessonTitle;
  final String group;
  final ColorScheme cs;
  final AppColors ext;

  @override
  State<_QrModal> createState() => _QrModalState();
}

class _QrModalState extends State<_QrModal> {
  // QR живёт 5 минут, потом нужно обновить
  static const _ttlSeconds = 300;
  late int _remaining;

  @override
  void initState() {
    super.initState();
    _remaining = _ttlSeconds;
    _tick();
  }

  void _tick() {
    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      setState(() => _remaining--);
      if (_remaining > 0) _tick();
    });
  }

  String get _timeLabel {
    final m = _remaining ~/ 60;
    final s = _remaining % 60;
    return '$m:${s.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final cs  = widget.cs;
    final ext = widget.ext;
    final tt  = Theme.of(context).textTheme;
    final screenH = MediaQuery.of(context).size.height;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Stack(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(color: Colors.black.withValues(alpha: .5)),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: screenH * 0.65,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(AppTheme.radiusLg),
              ),
            ),
            padding: EdgeInsets.fromLTRB(
              24, 16, 24,
              MediaQuery.of(context).padding.bottom + 24,
            ),
            child: Column(
              children: [
                // Ручка
                Container(
                  width: 36, height: 4,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: ext.border,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),

                // Заголовок
                Text('QR для отметки', style: tt.titleMedium),
                const SizedBox(height: 4),
                Text(
                  '${widget.lessonTitle} · ${widget.group}',
                  style: tt.labelSmall?.copyWith(color: ext.textSecondary),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 20),

                // QR-код
                Expanded(
                  child: _remaining > 0
                      ? Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(AppTheme.radiusMd),
                          ),
                          child: QrImageView(
                            data: widget.token,
                            version: QrVersions.auto,
                            backgroundColor: Colors.white,
                            eyeStyle: const QrEyeStyle(
                              eyeShape: QrEyeShape.square,
                              color: Color(0xFF1C1B1F),
                            ),
                            dataModuleStyle: const QrDataModuleStyle(
                              dataModuleShape: QrDataModuleShape.square,
                              color: Color(0xFF1C1B1F),
                            ),
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.timer_off_outlined,
                                size: 48, color: ext.errorFg),
                            const SizedBox(height: 12),
                            Text('QR-код устарел',
                                style: tt.titleMedium),
                            const SizedBox(height: 6),
                            Text('Создайте новый',
                                style: tt.bodyMedium
                                    ?.copyWith(color: ext.textSecondary)),
                          ],
                        ),
                ),

                const SizedBox(height: 16),

                // Таймер
                if (_remaining > 0)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.timer_outlined,
                          size: 15,
                          color: _remaining < 60
                              ? ext.warningFg
                              : ext.textTertiary),
                      const SizedBox(width: 6),
                      Text(
                        'Действителен $_timeLabel',
                        style: tt.labelSmall?.copyWith(
                          color: _remaining < 60
                              ? ext.warningFg
                              : ext.textTertiary,
                          fontWeight: _remaining < 60
                              ? FontWeight.w600
                              : FontWeight.w400,
                        ),
                      ),
                    ],
                  ),

                const SizedBox(height: 12),

                // Кнопка
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton.icon(
                    onPressed: _remaining > 0
                        ? () {
                            Clipboard.setData(
                                ClipboardData(text: widget.token));
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Токен скопирован')),
                            );
                          }
                        : () => Navigator.pop(context),
                    icon: Icon(
                      _remaining > 0 ? Icons.copy : Icons.refresh,
                      size: 18,
                    ),
                    label: Text(
                      _remaining > 0 ? 'Скопировать токен' : 'Закрыть',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ════════════════════════════════════════════════════════════
// Вспомогательные виджеты
// ════════════════════════════════════════════════════════════
class _QrButton extends StatelessWidget {
  const _QrButton({required this.onTap, required this.cs, required this.ext});
  final VoidCallback onTap;
  final ColorScheme cs;
  final AppColors ext;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          width: 40, height: 40,
          decoration: BoxDecoration(
            color: cs.primary.withValues(alpha: .1),
            borderRadius: BorderRadius.circular(AppTheme.radiusMd),
          ),
          child: Icon(Icons.qr_code_2, color: cs.primary, size: 22),
        ),
      );
}

class _SmallButton extends StatelessWidget {
  const _SmallButton({
    required this.label,
    required this.icon,
    required this.onTap,
    required this.cs,
    required this.ext,
  });
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final ColorScheme cs;
  final AppColors ext;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: ext.surfaceTinted,
            borderRadius: BorderRadius.circular(AppTheme.radiusSm),
          ),
          child: Row(
            children: [
              Icon(icon, size: 13, color: ext.textOnTinted),
              const SizedBox(width: 4),
              Text(label,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: ext.textOnTinted,
                    height: 1,
                  )),
            ],
          ),
        ),
      );
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
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: isActive ? cs.primary : ext.surfaceTinted,
            borderRadius: BorderRadius.circular(AppTheme.radiusSm),
          ),
          child: Text(label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: isActive ? cs.onPrimary : ext.textOnTinted,
                height: 1,
              )),
        ),
      );
}

class _EmptyDay extends StatelessWidget {
  const _EmptyDay({required this.ext, required this.tt});
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 64),
        child: Column(
          children: [
            Icon(Icons.coffee_outlined, size: 40, color: ext.textTertiary),
            const SizedBox(height: 12),
            Text('Пар нет, отдыхай',
                style: tt.bodyMedium?.copyWith(color: ext.textSecondary)),
          ],
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
