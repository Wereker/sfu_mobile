import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/feature/management/presentation/bloc/publish/publish_bloc.dart';

class PublishTab extends StatefulWidget {
  const PublishTab({super.key});

  @override
  State<PublishTab> createState() => _PublishTabState();
}

class _PublishTabState extends State<PublishTab> {
  String _type = 'announcement';
  String _audience = 'all';
  bool _isPinned = false;
  String? _selectedStream;
  String? _selectedGroup;

  static const _allStreams = ['БИ22', 'БИ23', 'МА23'];
  static const _allGroups = [
    'БИ22-01',
    'БИ22-02',
    'БИ23-01',
    'БИ23-02',
    'МА23-01',
  ];

  final _titleCtrl = TextEditingController();
  final _bodyCtrl = TextEditingController();
  final _dateCtrl = TextEditingController();
  final _placeCtrl = TextEditingController();
  final _startDateCtrl = TextEditingController();
  final _endDateCtrl = TextEditingController();
  final _publishAtCtrl = TextEditingController();
  final _expiresAtCtrl = TextEditingController();
  final _roomIdCtrl = TextEditingController();

  @override
  void dispose() {
    _titleCtrl.dispose();
    _bodyCtrl.dispose();
    _dateCtrl.dispose();
    _placeCtrl.dispose();
    _startDateCtrl.dispose();
    _endDateCtrl.dispose();
    _publishAtCtrl.dispose();
    _expiresAtCtrl.dispose();
    _roomIdCtrl.dispose();
    super.dispose();
  }

  void _resetForm() {
    _titleCtrl.clear();
    _bodyCtrl.clear();
    _dateCtrl.clear();
    _placeCtrl.clear();
    _startDateCtrl.clear();
    _endDateCtrl.clear();
    _publishAtCtrl.clear();
    _expiresAtCtrl.clear();
    _roomIdCtrl.clear();
    setState(() {
      _isPinned = false;
      _audience = 'all';
      _selectedStream = null;
      _selectedGroup = null;
    });
  }

  void _submit(BuildContext context) {
    if (_titleCtrl.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Введите заголовок')));
      return;
    }

    FocusScope.of(context).unfocus();

    if (_type == 'announcement') {
      if (_publishAtCtrl.text.isEmpty || _expiresAtCtrl.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Укажите даты публикации')),
        );
        return;
      }

      final List<int> groupIds = _selectedGroup != null
          ? [int.tryParse(_selectedGroup!) ?? 0]
          : [];
      final List<int> streamIds = _selectedStream != null
          ? [int.tryParse(_selectedStream!) ?? 0]
          : [];

      context.read<PublishBloc>().add(
        PublishEvent.publishAnnouncement(
          title: _titleCtrl.text.trim(),
          content: _bodyCtrl.text.trim(),
          publishAt: '${_publishAtCtrl.text}T00:00:00.000Z',
          expiresAt: '${_expiresAtCtrl.text}T23:59:59.000Z',
          targetGroupIds: groupIds,
          targetStreamIds: streamIds,
        ),
      );
    } else {
      if (_startDateCtrl.text.isEmpty || _endDateCtrl.text.isEmpty) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Укажите даты события')));
        return;
      }
      if (_roomIdCtrl.text.isEmpty) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Укажите ID аудитории')));
        return;
      }

      context.read<PublishBloc>().add(
        PublishEvent.publishEvent(
          title: _titleCtrl.text.trim(),
          annotation: _bodyCtrl.text.trim(),
          startsAt: _startDateCtrl.text,
          endsAt: _endDateCtrl.text,
          roomId: int.tryParse(_roomIdCtrl.text) ?? 0,
        ),
      );
    }
  }

  Future<void> _openPicker({required bool isStream}) async {
    final items = isStream ? _allStreams : _allGroups;
    final current = isStream ? _selectedStream : _selectedGroup;

    final result = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _SearchBottomSheet(
        title: isStream ? 'Выберите поток' : 'Выберите группу',
        items: items,
        selected: current,
      ),
    );

    if (result != null && mounted) {
      setState(() {
        if (isStream) {
          _selectedStream = result;
        } else {
          _selectedGroup = result;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt = Theme.of(context).textTheme;

    return BlocConsumer<PublishBloc, PublishState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            _resetForm();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  _type == 'announcement'
                      ? 'Объявление опубликовано'
                      : 'Событие создано',
                ),
                backgroundColor: ext.successBg,
              ),
            );
            _resetForm();
          },
          error: (msg) => ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(msg))),
          orElse: () {},
        );
      },
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        return SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Тип
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
                      ),
                      _TypeSegment(
                        icon: Icons.event_outlined,
                        label: 'Событие',
                        value: 'event',
                        selected: _type,
                        onTap: () => setState(() => _type = 'event'),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                TextField(
                  controller: _titleCtrl,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    labelText: 'Заголовок',
                    hintText: _type == 'announcement'
                        ? 'Запись на элективы открыта'
                        : 'Хакатон по компьютерному зрению',
                    prefixIcon: Icon(
                      Icons.title,
                      size: 20,
                      color: ext.textTertiary,
                    ),
                  ),
                ),

                const SizedBox(height: 14),

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
                      child: Icon(
                        Icons.notes,
                        size: 20,
                        color: ext.textTertiary,
                      ),
                    ),
                  ),
                ),

                if (_type == 'event') ...[
                  const SizedBox(height: 14),
                  // Дата начала
                  TextField(
                    controller: _startDateCtrl,
                    readOnly: true,
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                      );
                      if (date != null && mounted) {
                        final time = await showTimePicker(
                          context: context,
                          initialTime: const TimeOfDay(hour: 10, minute: 0),
                        );
                        if (time != null) {
                          final dt = DateTime(
                            date.year,
                            date.month,
                            date.day,
                            time.hour,
                            time.minute,
                          );
                          _startDateCtrl.text = dt.toIso8601String();
                        }
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Начало события',
                      hintText: 'Выберите дату и время',
                      prefixIcon: Icon(
                        Icons.calendar_today_outlined,
                        size: 20,
                        color: ext.textTertiary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  // Дата конца
                  TextField(
                    controller: _endDateCtrl,
                    readOnly: true,
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                      );
                      if (date != null && mounted) {
                        final time = await showTimePicker(
                          context: context,
                          initialTime: const TimeOfDay(hour: 18, minute: 0),
                        );
                        if (time != null) {
                          final dt = DateTime(
                            date.year,
                            date.month,
                            date.day,
                            time.hour,
                            time.minute,
                          );
                          _endDateCtrl.text = dt.toIso8601String();
                        }
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Конец события',
                      hintText: 'Выберите дату и время',
                      prefixIcon: Icon(
                        Icons.calendar_month_outlined,
                        size: 20,
                        color: ext.textTertiary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  // room_id
                  TextField(
                    controller: _roomIdCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'ID аудитории',
                      hintText: 'Например: 4',
                      prefixIcon: Icon(
                        Icons.meeting_room_outlined,
                        size: 20,
                        color: ext.textTertiary,
                      ),
                    ),
                  ),
                ],

                // Для объявления — даты публикации и истечения
                if (_type == 'announcement') ...[
                  const SizedBox(height: 14),
                  TextField(
                    controller: _publishAtCtrl,
                    readOnly: true,
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                      );
                      if (date != null && mounted) {
                        _publishAtCtrl.text = date.toIso8601String().substring(
                          0,
                          10,
                        );
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Дата публикации',
                      hintText: 'Выберите дату',
                      prefixIcon: Icon(
                        Icons.publish_outlined,
                        size: 20,
                        color: ext.textTertiary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  TextField(
                    controller: _expiresAtCtrl,
                    readOnly: true,
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now().add(
                          const Duration(days: 7),
                        ),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                      );
                      if (date != null && mounted) {
                        _expiresAtCtrl.text = date.toIso8601String().substring(
                          0,
                          10,
                        );
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Срок действия',
                      hintText: 'Когда убрать из ленты',
                      prefixIcon: Icon(
                        Icons.event_busy_outlined,
                        size: 20,
                        color: ext.textTertiary,
                      ),
                    ),
                  ),
                ],

                const SizedBox(height: 24),

                // ── Кнопка «Создать» ──
                BlocBuilder<PublishBloc, PublishState>(
                  builder: (context, state) {
                    final isLoading = state.maybeWhen(
                      loading: () => true,
                      orElse: () => false,
                    );
                    return SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton.icon(
                        onPressed: isLoading ? null : () => _submit(context),
                        icon: isLoading
                            ? const SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : Icon(
                                _type == 'announcement'
                                    ? Icons.campaign_outlined
                                    : Icons.event_outlined,
                                size: 18,
                              ),
                        label: Text(
                          isLoading
                              ? 'Публикуем...'
                              : _type == 'announcement'
                              ? 'Опубликовать объявление'
                              : 'Создать событие',
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ── Внутренние виджеты PublishTab ────────────────────────────

class _TypeSegment extends StatelessWidget {
  const _TypeSegment({
    required this.icon,
    required this.label,
    required this.value,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final String label, value, selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt = Theme.of(context).textTheme;
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
              Icon(
                icon,
                size: 16,
                color: isSelected ? cs.primary : ext.textSecondary,
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: tt.labelLarge?.copyWith(
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  color: isSelected ? ext.textPrimary : ext.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AudienceChip extends StatelessWidget {
  const _AudienceChip({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isActive ? cs.primary : ext.surfaceTinted,
            borderRadius: BorderRadius.circular(AppTheme.radiusMd),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                size: 18,
                color: isActive ? cs.onPrimary : ext.textOnTinted,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: isActive ? cs.onPrimary : ext.textOnTinted,
                  height: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StreamGroupPicker extends StatelessWidget {
  const _StreamGroupPicker({
    required this.isStream,
    required this.selected,
    required this.onTap,
  });

  final bool isStream;
  final String? selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt = Theme.of(context).textTheme;
    final hasValue = selected != null && selected!.isNotEmpty;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: cs.surface,
          borderRadius: BorderRadius.circular(AppTheme.radiusMd),
          border: Border.all(
            color: hasValue ? cs.primary : ext.border,
            width: hasValue ? 1.5 : 1,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        child: Row(
          children: [
            Icon(
              isStream ? Icons.account_tree_outlined : Icons.groups_outlined,
              size: 18,
              color: hasValue ? cs.primary : ext.textTertiary,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                hasValue
                    ? selected!
                    : (isStream ? 'Выберите поток...' : 'Выберите группу...'),
                style: tt.bodyLarge?.copyWith(
                  fontSize: 15,
                  color: hasValue ? ext.textPrimary : ext.textTertiary,
                ),
              ),
            ),
            Icon(
              Icons.search,
              size: 18,
              color: hasValue ? cs.primary : ext.textTertiary,
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchBottomSheet extends StatefulWidget {
  const _SearchBottomSheet({
    required this.title,
    required this.items,
    required this.selected,
  });

  final String title;
  final List<String> items;
  final String? selected;

  @override
  State<_SearchBottomSheet> createState() => _SearchBottomSheetState();
}

class _SearchBottomSheetState extends State<_SearchBottomSheet> {
  final _ctrl = TextEditingController();
  String _query = '';

  List<String> get _filtered => _query.isEmpty
      ? widget.items
      : widget.items
            .where((i) => i.toLowerCase().contains(_query.toLowerCase()))
            .toList();

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt = Theme.of(context).textTheme;

    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(AppTheme.radiusLg),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 4),
            child: Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: ext.border,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Text(widget.title, style: tt.titleMedium),
                const Spacer(),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.close, size: 20, color: ext.textSecondary),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
            child: TextField(
              controller: _ctrl,
              autofocus: true,
              onChanged: (v) => setState(() => _query = v),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  size: 20,
                  color: ext.textTertiary,
                ),
                hintText: 'Поиск...',
                hintStyle: tt.bodyMedium?.copyWith(color: ext.textTertiary),
              ),
            ),
          ),
          Divider(height: 1, color: ext.divider),
          Expanded(
            child: _filtered.isEmpty
                ? Center(
                    child: Text(
                      'Ничего не найдено',
                      style: tt.bodyMedium?.copyWith(color: ext.textSecondary),
                    ),
                  )
                : ListView.separated(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).padding.bottom + 16,
                    ),
                    separatorBuilder: (_, __) =>
                        Divider(height: 1, color: ext.divider, indent: 16),
                    itemCount: _filtered.length,
                    itemBuilder: (_, i) {
                      final item = _filtered[i];
                      final isSel = item == widget.selected;
                      return ListTile(
                        dense: true,
                        title: Text(
                          item,
                          style: tt.labelLarge?.copyWith(
                            fontWeight: isSel
                                ? FontWeight.w700
                                : FontWeight.w400,
                            color: isSel ? cs.primary : ext.textPrimary,
                          ),
                        ),
                        trailing: isSel
                            ? Icon(
                                Icons.check_circle,
                                color: cs.primary,
                                size: 20,
                              )
                            : null,
                        onTap: () => Navigator.pop(context, item),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
