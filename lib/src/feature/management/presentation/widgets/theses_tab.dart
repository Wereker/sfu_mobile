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
          error:   (_) => const ThesesSkeleton(),
        );
      },
    );
  }
}

class _ThesesContent extends StatelessWidget {
  const _ThesesContent({required this.theses});
  final List<Thesis> theses;

  void _showAddDialog(BuildContext context) {
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;
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
              decoration: const InputDecoration(
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
                    context.read<ThesesBloc>().add(
                      ThesesEvent.create(ctrl.text.trim()),
                    );
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
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;
    final free = theses.where((t) => t.isFree).length;

    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '${theses.length} тем · $free свободных',
                    style: tt.labelSmall?.copyWith(color: ext.textSecondary),
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
                        Text(
                          'Добавить',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: cs.primary,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        SliverList.separated(
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemCount: theses.length,
          itemBuilder: (_, i) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _ThesisCard(thesis: theses[i]),
          ),
        ),

        const SliverPadding(padding: EdgeInsets.only(bottom: 32)),
      ],
    );
  }
}

class _ThesisCard extends StatelessWidget {
  const _ThesisCard({required this.thesis});
  final Thesis thesis;

  @override
  Widget build(BuildContext context) {
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

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
                child: Text(
                  thesis.title,
                  style: tt.labelLarge?.copyWith(
                      fontWeight: FontWeight.w600, fontSize: 14),
                ),
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
          SizedBox(
            width: double.infinity,
            height: 40,
            child: OutlinedButton(
              onPressed: () => context.read<ThesesBloc>().add(
                ThesesEvent.update(thesis.id, isFree: !thesis.isFree),
              ),
              child: Text(
                thesis.isFree
                    ? 'Пометить как занятую'
                    : 'Освободить тему',
              ),
            ),
          ),
        ],
      ),
    );
  }
}