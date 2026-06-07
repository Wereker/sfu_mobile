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

  final _titleCtrl = TextEditingController();
  final _bodyCtrl = TextEditingController();
  final _startDateCtrl = TextEditingController();
  final _endDateCtrl = TextEditingController();
  final _publishAtCtrl = TextEditingController();
  final _expiresAtCtrl = TextEditingController();
  final _roomIdCtrl = TextEditingController();
  final _tagsCtrl = TextEditingController();
  final _seatsCtrl = TextEditingController();

  String _audience = 'all';
  String? _selectedStream;
  String? _selectedGroup;
  bool _isPinned = false;
  String? _coverFileName;
  final List<String> _attachments = [];

  static const _allStreams = ['КИ22', 'КИ23', 'МА23'];
  static const _allGroups = ['КИ22-13б', 'КИ22-14б', 'КИ23-01', 'МА23-01'];

  @override
  void dispose() {
    _titleCtrl.dispose();
    _bodyCtrl.dispose();
    _startDateCtrl.dispose();
    _endDateCtrl.dispose();
    _publishAtCtrl.dispose();
    _expiresAtCtrl.dispose();
    _roomIdCtrl.dispose();
    _tagsCtrl.dispose();
    _seatsCtrl.dispose();
    super.dispose();
  }

  void _resetForm() {
    _titleCtrl.clear();
    _bodyCtrl.clear();
    _startDateCtrl.clear();
    _endDateCtrl.clear();
    _publishAtCtrl.clear();
    _expiresAtCtrl.clear();
    _roomIdCtrl.clear();
    _tagsCtrl.clear();
    _seatsCtrl.clear();
    setState(() {
      _audience = 'all';
      _selectedStream = null;
      _selectedGroup = null;
      _isPinned = false;
      _coverFileName = null;
      _attachments.clear();
    });
  }

  Future<void> _pickDate(TextEditingController ctrl,
      {bool withTime = false}) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date == null || !mounted) return;
    if (withTime) {
      final time = await showTimePicker(
        context: context,
        initialTime: const TimeOfDay(hour: 10, minute: 0),
      );
      if (time != null) {
        final dt = DateTime(
            date.year, date.month, date.day, time.hour, time.minute);
        ctrl.text = dt.toIso8601String();
      }
    } else {
      ctrl.text = date.toIso8601String().substring(0, 10);
    }
  }

  void _submit(BuildContext context) {
    if (_titleCtrl.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Введите заголовок')));
      return;
    }
    FocusScope.of(context).unfocus();

    if (_type == 'announcement') {
      if (_publishAtCtrl.text.isEmpty || _expiresAtCtrl.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Укажите даты публикации')));
        return;
      }
      final List<int> groupIds =
      _selectedGroup != null ? [_groupIdFromName(_selectedGroup!)] : [];
      final List<int> streamIds =
      _selectedStream != null ? [_streamIdFromName(_selectedStream!)] : [];

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
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Укажите даты события')));
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

  int _groupIdFromName(String name) {
    const map = {'КИ22-13б': 5, 'КИ22-14б': 6, 'КИ23-01': 7, 'МА23-01': 8};
    return map[name] ?? 0;
  }

  int _streamIdFromName(String name) {
    const map = {'КИ22': 1, 'КИ23': 2, 'МА23': 3};
    return map[name] ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt = Theme.of(context).textTheme;

    return SliverFillRemaining(
      hasScrollBody: true,
      child: BlocListener<PublishBloc, PublishState>(
        listener: (context, state) {
          state.maybeWhen(
            success: () {
              _resetForm();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(_type == 'announcement'
                      ? 'Объявление опубликовано'
                      : 'Событие создано'),
                  backgroundColor: ext.successBg,
                ),
              );
            },
            error: (msg) => ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(msg))),
            orElse: () {},
          );
        },
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => FocusScope.of(context).unfocus(),
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Тип переключатель
              Container(
                decoration: BoxDecoration(
                  color: ext.surfaceTinted,
                  borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                ),
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: [
                    _TypeBtn(
                      label: 'Объявление',
                      icon: Icons.campaign_outlined,
                      isSelected: _type == 'announcement',
                      onTap: () => setState(() => _type = 'announcement'),
                    ),
                    _TypeBtn(
                      label: 'Событие',
                      icon: Icons.event_outlined,
                      isSelected: _type == 'event',
                      onTap: () => setState(() => _type = 'event'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Заголовок
              TextField(
                controller: _titleCtrl,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(labelText: 'Заголовок'),
              ),
              const SizedBox(height: 14),

              // Текст
              TextField(
                controller: _bodyCtrl,
                textCapitalization: TextCapitalization.sentences,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: _type == 'announcement' ? 'Текст объявления' : 'Описание события',
                  alignLabelWithHint: true,
                ),
              ),
              const SizedBox(height: 14),

              if (_type == 'announcement') ...[
                // Дата публикации
                TextField(
                  controller: _publishAtCtrl,
                  readOnly: true,
                  onTap: () => _pickDate(_publishAtCtrl),
                  decoration: InputDecoration(
                    labelText: 'Дата публикации',
                    hintText: 'Выберите дату',
                    prefixIcon: Icon(Icons.publish_outlined,
                        size: 20, color: ext.textTertiary),
                  ),
                ),
                const SizedBox(height: 14),

                // Срок действия
                TextField(
                  controller: _expiresAtCtrl,
                  readOnly: true,
                  onTap: () => _pickDate(_expiresAtCtrl),
                  decoration: InputDecoration(
                    labelText: 'Срок действия',
                    hintText: 'Когда убрать из ленты',
                    prefixIcon: Icon(Icons.event_busy_outlined,
                        size: 20, color: ext.textTertiary),
                  ),
                ),
              ],

              if (_type == 'event') ...[
                // Начало события
                TextField(
                  controller: _startDateCtrl,
                  readOnly: true,
                  onTap: () => _pickDate(_startDateCtrl, withTime: true),
                  decoration: InputDecoration(
                    labelText: 'Начало события',
                    hintText: 'Выберите дату и время',
                    prefixIcon: Icon(Icons.calendar_today_outlined,
                        size: 20, color: ext.textTertiary),
                  ),
                ),
                const SizedBox(height: 14),

                // Конец события
                TextField(
                  controller: _endDateCtrl,
                  readOnly: true,
                  onTap: () => _pickDate(_endDateCtrl, withTime: true),
                  decoration: InputDecoration(
                    labelText: 'Конец события',
                    hintText: 'Выберите дату и время',
                    prefixIcon: Icon(Icons.calendar_month_outlined,
                        size: 20, color: ext.textTertiary),
                  ),
                ),
                const SizedBox(height: 14),

                // Место проведения (ID аудитории)
                TextField(
                  controller: _roomIdCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Место проведения',
                    hintText: 'ID аудитории',
                    prefixIcon: Icon(Icons.meeting_room_outlined,
                        size: 20, color: ext.textTertiary),
                  ),
                ),
                const SizedBox(height: 14),

                // Количество мест
                TextField(
                  controller: _seatsCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Количество мест',
                    hintText: '50',
                    prefixIcon: Icon(Icons.people_outline,
                        size: 20, color: ext.textTertiary),
                  ),
                ),
              ],

              const SizedBox(height: 14),

              // Теги
              TextField(
                controller: _tagsCtrl,
                decoration: InputDecoration(
                  labelText: 'Теги',
                  hintText: 'IT, наука, спорт — через запятую',
                  prefixIcon: Icon(Icons.label_outline,
                      size: 20, color: ext.textTertiary),
                ),
              ),
              const SizedBox(height: 14),

              // Обложка
              _FilePicker(
                label: 'Обложка',
                icon: Icons.image_outlined,
                fileName: _coverFileName,
                onPick: () => setState(() => _coverFileName = 'cover.jpg'),
                onClear: () => setState(() => _coverFileName = null),
              ),

              if (_type == 'announcement') ...[
                const SizedBox(height: 14),
                // Прикрепляемые документы
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Прикреплённые документы',
                        style: tt.labelSmall
                            ?.copyWith(color: ext.textSecondary)),
                    const SizedBox(height: 8),
                    ..._attachments.map((f) => Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Row(
                        children: [
                          Icon(Icons.attach_file,
                              size: 16, color: ext.textTertiary),
                          const SizedBox(width: 6),
                          Expanded(
                              child: Text(f, style: tt.bodyMedium)),
                          GestureDetector(
                            onTap: () => setState(
                                    () => _attachments.remove(f)),
                            child: Icon(Icons.close,
                                size: 16, color: ext.textTertiary),
                          ),
                        ],
                      ),
                    )),
                    TextButton.icon(
                      onPressed: () => setState(
                              () => _attachments.add('document_${_attachments.length + 1}.pdf')),
                      icon: const Icon(Icons.add, size: 16),
                      label: const Text('Добавить документ'),
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(0, 32)),
                    ),
                  ],
                ),
              ],

              const SizedBox(height: 20),

              // Аудитория
              Text('Кто должен увидеть',
                  style:
                  tt.labelSmall?.copyWith(color: ext.textSecondary)),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _AudienceChip(
                    label: 'Все',
                    isSelected: _audience == 'all',
                    onTap: () => setState(() {
                      _audience = 'all';
                      _selectedStream = null;
                      _selectedGroup = null;
                    }),
                  ),
                  _AudienceChip(
                    label: 'Поток',
                    isSelected: _audience == 'stream',
                    onTap: () => setState(() => _audience = 'stream'),
                  ),
                  _AudienceChip(
                    label: 'Группа',
                    isSelected: _audience == 'group',
                    onTap: () => setState(() => _audience = 'group'),
                  ),
                  _AudienceChip(
                    label: 'Кафедра',
                    isSelected: _audience == 'department',
                    onTap: () => setState(() => _audience = 'department'),
                  ),
                ],
              ),

              if (_audience == 'stream') ...[
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  value: _selectedStream,
                  decoration: const InputDecoration(labelText: 'Поток'),
                  items: _allStreams
                      .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                      .toList(),
                  onChanged: (v) => setState(() => _selectedStream = v),
                ),
              ],

              if (_audience == 'group') ...[
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  value: _selectedGroup,
                  decoration: const InputDecoration(labelText: 'Группа'),
                  items: _allGroups
                      .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                      .toList(),
                  onChanged: (v) => setState(() => _selectedGroup = v),
                ),
              ],

              if (_type == 'announcement') ...[
                const SizedBox(height: 16),
                Row(
                  children: [
                    Switch(
                      value: _isPinned,
                      onChanged: (v) => setState(() => _isPinned = v),
                    ),
                    const SizedBox(width: 8),
                    Text('Закрепить объявление', style: tt.labelLarge),
                  ],
                ),
              ],

              const SizedBox(height: 24),

              BlocBuilder<PublishBloc, PublishState>(
                builder: (context, state) {
                  final isLoading = state.maybeWhen(
                      loading: () => true, orElse: () => false);
                  return SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton.icon(
                      onPressed: isLoading ? null : () => _submit(context),
                      icon: isLoading
                          ? const SizedBox(
                          width: 18, height: 18,
                          child: CircularProgressIndicator(
                              strokeWidth: 2, color: Colors.white))
                          : Icon(
                          _type == 'announcement'
                              ? Icons.campaign_outlined
                              : Icons.event_outlined,
                          size: 18),
                      label: Text(isLoading
                          ? 'Публикуем...'
                          : _type == 'announcement'
                          ? 'Опубликовать объявление'
                          : 'Создать событие'),
                    ),
                  );
                },
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class _TypeBtn extends StatelessWidget {
  const _TypeBtn({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? cs.surface : Colors.transparent,
            borderRadius: BorderRadius.circular(AppTheme.radiusMd - 2),
            boxShadow: isSelected
                ? [
              BoxShadow(
                  color: Colors.black.withValues(alpha: .06),
                  blurRadius: 4)
            ]
                : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon,
                  size: 16,
                  color: isSelected
                      ? cs.primary
                      : Theme.of(context)
                      .extension<AppColors>()!
                      .textSecondary),
              const SizedBox(width: 6),
              Text(
                label,
                style: tt.labelLarge?.copyWith(
                  fontSize: 13,
                  color: isSelected
                      ? cs.primary
                      : Theme.of(context)
                      .extension<AppColors>()!
                      .textSecondary,
                  fontWeight: isSelected
                      ? FontWeight.w600
                      : FontWeight.w400,
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
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
        const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? cs.primary.withValues(alpha: .1)
              : ext.surfaceTinted,
          borderRadius: BorderRadius.circular(AppTheme.radiusMd),
          border: Border.all(
            color: isSelected ? cs.primary : ext.border,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Text(
          label,
          style: tt.labelLarge?.copyWith(
            fontSize: 13,
            color: isSelected ? cs.primary : ext.textSecondary,
            fontWeight:
            isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class _FilePicker extends StatelessWidget {
  const _FilePicker({
    required this.label,
    required this.icon,
    required this.fileName,
    required this.onPick,
    required this.onClear,
  });

  final String label;
  final IconData icon;
  final String? fileName;
  final VoidCallback onPick;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onPick,
      child: Container(
        padding:
        const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: cs.surface,
          borderRadius: BorderRadius.circular(AppTheme.radiusMd),
          border: Border.all(
            color: fileName != null ? cs.primary : ext.border,
            width: fileName != null ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(icon,
                size: 20,
                color: fileName != null
                    ? cs.primary
                    : ext.textTertiary),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                fileName ?? label,
                style: tt.bodyMedium?.copyWith(
                  color: fileName != null
                      ? cs.primary
                      : ext.textTertiary,
                ),
              ),
            ),
            if (fileName != null)
              GestureDetector(
                onTap: onClear,
                child: Icon(Icons.close,
                    size: 16, color: ext.textTertiary),
              )
            else
              Icon(Icons.upload_outlined,
                  size: 18, color: ext.textTertiary),
          ],
        ),
      ),
    );
  }
}