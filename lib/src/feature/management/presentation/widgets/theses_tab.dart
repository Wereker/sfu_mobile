import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/feature/management/domain/entity/thesis.dart';
import 'package:sfu/src/feature/management/presentation/bloc/theses/theses_bloc.dart';
import 'package:sfu/src/feature/management/presentation/widgets/theses_skeleton.dart';

class ThesesTab extends StatelessWidget {
  const ThesesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThesesBloc, ThesesState>(
      listener: (context, state) {
        state.maybeWhen(
          error: (msg) => ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(msg))),
          orElse: () {},
        );
      },
      builder: (context, state) {
        return state.when(
          initial: () => const ThesesSkeleton(),
          loading: () => const ThesesSkeleton(),
          success: (theses) => _ThesesContent(theses: theses),
          error: (_) => const ThesesSkeleton(),
        );
      },
    );
  }
}

class _ThesesContent extends StatelessWidget {
  const _ThesesContent({required this.theses});
  final List<Thesis> theses;

  void _showAddSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius:
        BorderRadius.vertical(top: Radius.circular(AppTheme.radiusLg)),
      ),
      builder: (_) => BlocProvider.value(
        value: context.read<ThesesBloc>(),
        child: const _ThesisCreateSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt = Theme.of(context).textTheme;

    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: SizedBox(
              height: 44,
              child: ElevatedButton.icon(
                onPressed: () => _showAddSheet(context),
                icon: const Icon(Icons.add, size: 18),
                label: const Text('Добавить тему ВКР'),
              ),
            ),
          ),
        ),
        if (theses.isEmpty)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 48),
              child: Center(
                child: Text('Нет тем ВКР',
                    style: tt.bodyMedium
                        ?.copyWith(color: ext.textSecondary)),
              ),
            ),
          )
        else
          SliverList.separated(
            separatorBuilder: (_, __) =>
                Divider(height: 1, color: ext.divider),
            itemCount: theses.length,
            itemBuilder: (_, i) => _ThesisRow(thesis: theses[i]),
          ),
        const SliverPadding(padding: EdgeInsets.only(bottom: 32)),
      ],
    );
  }
}

class _ThesisCreateSheet extends StatefulWidget {
  const _ThesisCreateSheet();

  @override
  State<_ThesisCreateSheet> createState() => _ThesisCreateSheetState();
}

class _ThesisCreateSheetState extends State<_ThesisCreateSheet> {
  final _titleCtrl = TextEditingController();
  final _descCtrl = TextEditingController();
  final _tagsCtrl = TextEditingController();
  int _maxStudents = 1;

  @override
  void dispose() {
    _titleCtrl.dispose();
    _descCtrl.dispose();
    _tagsCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (_titleCtrl.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Введите название темы')));
      return;
    }
    context.read<ThesesBloc>().add(
      ThesesEvent.create(_titleCtrl.text.trim()),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        16, 16, 16,
        MediaQuery.of(context).viewInsets.bottom + 32,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
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
            const SizedBox(height: 20),

            TextField(
              controller: _titleCtrl,
              textCapitalization: TextCapitalization.sentences,
              maxLines: 2,
              decoration: const InputDecoration(
                labelText: 'Название темы',
                hintText: 'Разработка системы...',
                alignLabelWithHint: true,
              ),
            ),
            const SizedBox(height: 14),

            TextField(
              controller: _descCtrl,
              textCapitalization: TextCapitalization.sentences,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Описание темы',
                hintText:
                'Кратко опишите задачи, методы и ожидаемые результаты...',
                alignLabelWithHint: true,
              ),
            ),
            const SizedBox(height: 14),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Количество студентов на тему',
                          style: tt.labelSmall
                              ?.copyWith(color: ext.textSecondary)),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          IconButton(
                            onPressed: _maxStudents > 1
                                ? () => setState(() => _maxStudents--)
                                : null,
                            icon: const Icon(Icons.remove_circle_outline),
                            color: cs.primary,
                            iconSize: 28,
                          ),
                          Container(
                            width: 48,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(color: ext.border),
                              borderRadius:
                              BorderRadius.circular(AppTheme.radiusMd),
                            ),
                            child: Text(
                              '$_maxStudents',
                              style: tt.titleMedium,
                            ),
                          ),
                          IconButton(
                            onPressed: _maxStudents < 5
                                ? () => setState(() => _maxStudents++)
                                : null,
                            icon: const Icon(Icons.add_circle_outline),
                            color: cs.primary,
                            iconSize: 28,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),

            TextField(
              controller: _tagsCtrl,
              decoration: InputDecoration(
                labelText: 'Теги',
                hintText: 'ML, Python, CV — через запятую',
                prefixIcon: Icon(Icons.label_outline,
                    size: 20, color: ext.textTertiary),
              ),
            ),
            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: _submit,
                icon: const Icon(Icons.check, size: 18),
                label: const Text('Создать тему'),
              ),
            ),

            SizedBox(height: MediaQuery.of(context).viewInsets.bottom + 32),
          ],
        ),
      ),
    );
  }
}

class _ThesisRow extends StatelessWidget {
  const _ThesisRow({required this.thesis});
  final Thesis thesis;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(thesis.title,
                    style: tt.labelLarge
                        ?.copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text(
                  thesis.teacherName.isNotEmpty
                      ? thesis.teacherName
                      : 'Преподаватель не указан',
                  style:
                  tt.labelSmall?.copyWith(color: ext.textSecondary),
                ),
                if (thesis.tags.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 4,
                    children: thesis.tags
                        .map((t) => _TagChip(label: t))
                        .toList(),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 10),
          Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
            decoration: BoxDecoration(
              color: thesis.isFree ? ext.successBg : ext.errorBg,
              borderRadius: BorderRadius.circular(AppTheme.radiusSm),
            ),
            child: Text(
              thesis.isFree ? 'Свободна' : 'Занята',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: thesis.isFree ? ext.successFg : ext.errorFg,
                height: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  const _TagChip({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: ext.surfaceTinted,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: ext.textOnTinted,
          height: 1,
        ),
      ),
    );
  }
}