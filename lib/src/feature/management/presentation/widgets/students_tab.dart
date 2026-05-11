import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/core/widgets/detail_sheet.dart';
import 'package:sfu/src/feature/management/domain/entity/managed_student.dart';
import 'package:sfu/src/feature/management/presentation/bloc/students/students_bloc.dart';
import 'package:sfu/src/feature/management/presentation/widgets/shared/management_badge.dart';
import 'package:sfu/src/feature/management/presentation/widgets/shared/management_contact_icon.dart';
import 'package:sfu/src/feature/management/presentation/widgets/shared/management_contact_row.dart';
import 'package:sfu/src/feature/management/presentation/widgets/shared/management_filter_chip.dart';
import 'package:sfu/src/feature/management/presentation/widgets/shared/management_initials_avatar.dart';
import 'package:sfu/src/feature/management/presentation/widgets/students_skeleton.dart';

class StudentsTab extends StatefulWidget {
  const StudentsTab({super.key});

  @override
  State<StudentsTab> createState() => _StudentsTabState();
}

class _StudentsTabState extends State<StudentsTab> {
  // Потоки и группы — в реальном приложении приходят с бэка
  // Здесь оставляем фиксированными, так как это фильтр UI
  static const _streams = ['БИ22', 'БИ23', 'МА23'];
  static const _groupsByStream = {
    'БИ22': ['БИ22-01', 'БИ22-02'],
    'БИ23': ['БИ23-01'],
    'МА23': ['МА23-01'],
  };

  String _selectedStream = _streams.first;
  String _selectedGroup  = '';
  String _query          = '';

  List<String> get _groups =>
      _groupsByStream[_selectedStream] ?? [];

  void _applyFilter() {
    context.read<StudentsBloc>().add(
      StudentsEvent.load(
        stream:  _selectedStream,
        groupId: _selectedGroup.isEmpty ? null : _selectedGroup,
        search:  _query.isEmpty ? null : _query,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _selectedGroup = _groups.isNotEmpty ? _groups.first : '';
  }

  @override
  Widget build(BuildContext context) {
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

    return BlocBuilder<StudentsBloc, StudentsState>(
      builder: (context, state) {
        return SliverMainAxisGroup(
          slivers: [
            // ── Фильтры ──────────────────────────────────
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Потоки
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: _streams.map((stream) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ManagementFilterChip(
                              label: stream,
                              isActive: stream == _selectedStream,
                              onTap: () {
                                setState(() {
                                  _selectedStream = stream;
                                  _selectedGroup  = _groups.isNotEmpty
                                      ? _groups.first
                                      : '';
                                });
                                _applyFilter();
                              },
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Группы
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ManagementFilterChip(
                              label: 'Все группы',
                              isActive: _selectedGroup.isEmpty,
                              onTap: () {
                                setState(() => _selectedGroup = '');
                                _applyFilter();
                              },
                            ),
                          ),
                          ..._groups.map((g) => Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ManagementFilterChip(
                              label: g,
                              isActive: _selectedGroup == g,
                              onTap: () {
                                setState(() => _selectedGroup = g);
                                _applyFilter();
                              },
                            ),
                          )),
                        ],
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Поиск
                    TextField(
                      onChanged: (v) {
                        setState(() => _query = v);
                        _applyFilter();
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search,
                            color: ext.textTertiary, size: 20),
                        hintText: 'Поиск студента или группы',
                        hintStyle: tt.bodyMedium
                            ?.copyWith(color: ext.textTertiary),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Счётчик
                    state.maybeWhen(
                      success: (students) => Text(
                        '${students.length} студентов',
                        style: tt.labelSmall
                            ?.copyWith(color: ext.textSecondary),
                      ),
                      orElse: () => const SizedBox.shrink(),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),

            // ── Список / Скелетон / Ошибка ───────────────
            state.when(
              initial: () => const StudentsSkeleton(),
              loading: () => const StudentsSkeleton(),
              success: (students) => students.isEmpty
                  ? SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 48),
                  child: Center(
                    child: Text(
                      'Ничего не найдено',
                      style: tt.bodyMedium
                          ?.copyWith(color: ext.textSecondary),
                    ),
                  ),
                ),
              )
                  : SliverList.separated(
                separatorBuilder: (_, __) => Divider(
                  height: 1,
                  color: ext.divider,
                  indent: 72,
                ),
                itemCount: students.length,
                itemBuilder: (_, i) =>
                    _StudentRow(student: students[i]),
              ),
              error: (msg) => SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Center(
                    child: Text(
                      msg,
                      style: tt.bodyMedium
                          ?.copyWith(color: ext.textSecondary),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),

            const SliverPadding(padding: EdgeInsets.only(bottom: 32)),
          ],
        );
      },
    );
  }
}

// ── Строка студента ──────────────────────────────────────────
class _StudentRow extends StatelessWidget {
  const _StudentRow({required this.student});
  final ManagedStudent student;

  String _short(String full) {
    final p = full.trim().split(' ');
    if (p.length == 1) return p[0];
    return '${p[0]} ${p.length > 1 ? '${p[1][0]}.' : ''}'
        '${p.length > 2 ? '${p[2][0]}.' : ''}';
  }

  @override
  Widget build(BuildContext context) {
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

    return InkWell(
      onTap: () => showDetailSheet(
        context: context,
        child: _StudentDetail(student: student),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            ManagementInitialsAvatar(
                name: student.name, size: 44),
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
                          style: tt.labelLarge
                              ?.copyWith(fontWeight: FontWeight.w600),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (student.isHeadman) ...[
                        const SizedBox(width: 6),
                        ManagementBadge(
                            label: 'Ст.',
                            bg: ext.infoBg,
                            fg: ext.infoFg),
                      ],
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    student.groupName,
                    style: tt.labelSmall
                        ?.copyWith(color: ext.textSecondary),
                  ),
                ],
              ),
            ),

            Row(
              children: [
                if (student.telegram != null)
                  ManagementContactIcon(
                      icon: Icons.telegram,
                      color: cs.primary,
                      onTap: () {}),
                if (student.phone != null)
                  ManagementContactIcon(
                      icon: Icons.phone_outlined,
                      color: ext.textSecondary,
                      onTap: () {}),
              ],
            ),

            Icon(Icons.chevron_right, size: 18, color: ext.textTertiary),
          ],
        ),
      ),
    );
  }
}

// ── Детальная карточка студента ──────────────────────────────
class _StudentDetail extends StatelessWidget {
  const _StudentDetail({required this.student});
  final ManagedStudent student;

  @override
  Widget build(BuildContext context) {
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ManagementInitialsAvatar(name: student.name, size: 56),
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
                      Text(student.groupName,
                          style: tt.labelSmall
                              ?.copyWith(color: ext.textSecondary)),
                      if (student.isHeadman) ...[
                        const SizedBox(width: 8),
                        ManagementBadge(
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

        if (student.phone != null)
          ManagementContactRow(
              icon: Icons.phone_outlined,
              label: 'Телефон',
              value: student.phone!),
        if (student.telegram != null) ...[
          const SizedBox(height: 10),
          ManagementContactRow(
              icon: Icons.telegram,
              label: 'Telegram',
              value: student.telegram!),
        ],
        if (student.email != null) ...[
          const SizedBox(height: 10),
          ManagementContactRow(
              icon: Icons.mail_outline,
              label: 'Почта',
              value: student.email!),
        ],
        if (student.phone == null &&
            student.telegram == null &&
            student.email == null)
          Text('Контакты не указаны',
              style: tt.bodyMedium?.copyWith(color: ext.textSecondary)),

        const SizedBox(height: 24),

        SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.send_outlined, size: 18),
            label: const Text('Написать'),
          ),
        ),
      ],
    );
  }
}