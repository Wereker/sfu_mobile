import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/core/widgets/detail_sheet.dart';
import 'package:sfu/src/feature/management/domain/entity/managed_student.dart';
import 'package:sfu/src/feature/management/presentation/bloc/students/students_bloc.dart';
import 'package:sfu/src/feature/management/presentation/widgets/shared/management_badge.dart';
import 'package:sfu/src/feature/management/presentation/widgets/shared/management_initials_avatar.dart';
import 'package:sfu/src/feature/management/presentation/widgets/students_skeleton.dart';

class StudentsTab extends StatefulWidget {
  const StudentsTab({super.key});

  @override
  State<StudentsTab> createState() => _StudentsTabState();
}

class _StudentsTabState extends State<StudentsTab> {
  static const _streams = ['КИ22', 'КИ23', 'МА23'];
  static const _groupsByStream = {
    'КИ22': ['КИ22-13б', 'КИ22-14б'],
    'КИ23': ['КИ23-01'],
    'МА23': ['МА23-01'],
  };

  String _selectedStream = _streams.first;
  String? _selectedGroup;
  String _query = '';

  List<String> get _groups => _groupsByStream[_selectedStream] ?? [];

  void _applyFilter() {
    context.read<StudentsBloc>().add(
      StudentsEvent.load(
        stream: _selectedStream,
        groupId: _selectedGroup,
        search: _query.isEmpty ? null : _query,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _applyFilter();
  }

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;
    final cs  = Theme.of(context).colorScheme;

    return BlocBuilder<StudentsBloc, StudentsState>(
      builder: (context, state) {
        return SliverMainAxisGroup(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // Поток
                        Expanded(
                          child: _DropdownFilter<String>(
                            hint: 'Поток',
                            value: _selectedStream,
                            items: _streams,
                            labelBuilder: (s) => s,
                            onChanged: (val) {
                              if (val == null) return;
                              setState(() {
                                _selectedStream = val;
                                _selectedGroup = null;
                              });
                              _applyFilter();
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        // Группа
                        Expanded(
                          child: _DropdownFilter<String>(
                            hint: 'Группа',
                            value: _selectedGroup,
                            items: _groups,
                            labelBuilder: (g) => g,
                            onChanged: (val) {
                              setState(() => _selectedGroup = val);
                              _applyFilter();
                            },
                            clearable: true,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // ── Поиск ──
                    TextField(
                      onChanged: (v) {
                        setState(() => _query = v);
                        _applyFilter();
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search,
                            color: ext.textTertiary, size: 20),
                        hintText: 'Поиск по имени',
                        hintStyle: tt.bodyMedium
                            ?.copyWith(color: ext.textTertiary),
                      ),
                    ),

                    const SizedBox(height: 10),

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

            state.when(
              initial: () => const StudentsSkeleton(),
              loading: () => const StudentsSkeleton(),
              success: (students) => students.isEmpty
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
                itemCount: students.length,
                itemBuilder: (_, i) =>
                    _StudentRow(student: students[i]),
              ),
              error: (msg) => SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Center(
                    child: Text(msg,
                        style: tt.bodyMedium
                            ?.copyWith(color: ext.textSecondary),
                        textAlign: TextAlign.center),
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
            ManagementInitialsAvatar(name: student.name, size: 44),
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

            Icon(Icons.chevron_right, size: 18, color: ext.textTertiary),
          ],
        ),
      ),
    );
  }
}

class _StudentDetail extends StatelessWidget {
  const _StudentDetail({required this.student});
  final ManagedStudent student;

  void _copy(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Скопировано')));
  }

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

    final contacts = <_ContactItem>[
      if (student.phone != null)
        _ContactItem(Icons.phone_outlined, 'Телефон', student.phone!),
      if (student.telegram != null)
        _ContactItem(Icons.telegram, 'Telegram', student.telegram!),
      if (student.email != null)
        _ContactItem(Icons.mail_outline, 'Почта', student.email!),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Шапка
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

        // Контакты — с копированием
        if (contacts.isEmpty)
          Text('Контакты не указаны',
              style: tt.bodyMedium?.copyWith(color: ext.textSecondary))
        else
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(AppTheme.radiusMd),
              border: Border.all(color: ext.border),
            ),
            child: Column(
              children: contacts.asMap().entries.map((entry) {
                final i = entry.key;
                final item = entry.value;
                final isLast = i == contacts.length - 1;

                return Column(
                  children: [
                    InkWell(
                      onTap: () => _copy(context, item.value),
                      borderRadius: BorderRadius.vertical(
                        top: i == 0
                            ? const Radius.circular(AppTheme.radiusMd)
                            : Radius.zero,
                        bottom: isLast
                            ? const Radius.circular(AppTheme.radiusMd)
                            : Radius.zero,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 11),
                        child: Row(
                          children: [
                            Icon(item.icon, size: 17, color: ext.textTertiary),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item.label,
                                      style: tt.labelSmall?.copyWith(
                                          color: ext.textSecondary)),
                                  const SizedBox(height: 2),
                                  Text(item.value,
                                      style: tt.labelLarge?.copyWith(
                                          fontWeight: FontWeight.w400)),
                                ],
                              ),
                            ),
                            Icon(Icons.copy_outlined,
                                size: 15, color: ext.textTertiary),
                          ],
                        ),
                      ),
                    ),
                    if (!isLast)
                      Divider(height: 1, color: ext.divider, indent: 14),
                  ],
                );
              }).toList(),
            ),
          ),

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

class _ContactItem {
  final IconData icon;
  final String label;
  final String value;
  const _ContactItem(this.icon, this.label, this.value);
}

class _DropdownFilter<T> extends StatelessWidget {
  const _DropdownFilter({
    required this.hint,
    required this.value,
    required this.items,
    required this.labelBuilder,
    required this.onChanged,
    this.clearable = false,
  });

  final String hint;
  final T? value;
  final List<T> items;
  final String Function(T) labelBuilder;
  final ValueChanged<T?> onChanged;
  final bool clearable;

  @override
  Widget build(BuildContext context) {
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        border: Border.all(
          color: value != null ? cs.primary : ext.border,
          width: value != null ? 1.5 : 1,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          isExpanded: true,
          hint: Text(hint,
              style: tt.bodyMedium?.copyWith(color: ext.textTertiary)),
          icon: value != null && clearable
              ? GestureDetector(
            onTap: () => onChanged(null),
            child: Icon(Icons.close, size: 16, color: ext.textTertiary),
          )
              : Icon(Icons.keyboard_arrow_down,
              size: 20, color: ext.textSecondary),
          style: tt.labelLarge?.copyWith(
            color: value != null ? cs.primary : ext.textPrimary,
            fontWeight: value != null ? FontWeight.w600 : FontWeight.w400,
          ),
          items: items
              .map((item) => DropdownMenuItem<T>(
            value: item,
            child: Text(labelBuilder(item)),
          ))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}