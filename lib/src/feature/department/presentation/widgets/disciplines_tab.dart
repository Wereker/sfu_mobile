import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/core/widgets/detail_sheet.dart';
import 'package:sfu/src/feature/department/presentation/bloc/department_bloc.dart';
import 'package:sfu/src/feature/department/presentation/widgets/discipline_card.dart';
import 'package:sfu/src/feature/department/presentation/widgets/disciplines_skeleton.dart';

class DisciplinesTab extends StatelessWidget {
  const DisciplinesTab({super.key});

  static const _bachelor = [
    DisciplineData(
      name: 'Глубокое обучение',
      professor: 'Соколова Е. В.',
      credits: 4,
      type: DisciplineType.bachelor,
      description:
      'Курс охватывает современные архитектуры нейронных сетей: CNN, RNN, Transformer. '
          'Практические задания на PyTorch, проекты по классификации и детекции объектов.',
      seats: 25,
    ),
    DisciplineData(
      name: 'Компьютерное зрение',
      professor: 'Кузнецова А. П.',
      credits: 3,
      type: DisciplineType.bachelor,
      description:
      'Обработка изображений, детекция объектов (YOLO, Faster R-CNN), '
          'сегментация. Лабораторные на OpenCV и torchvision.',
      seats: 20,
    ),
    DisciplineData(
      name: 'Анализ данных',
      professor: 'Петров С. И.',
      credits: 3,
      type: DisciplineType.bachelor,
      description:
      'Pandas, NumPy, визуализация (Matplotlib/Seaborn), '
          'статистика, A/B тесты, регрессионный анализ. Курс для 3 курса.',
      seats: 30,
    ),
  ];

  static const _master = [
    DisciplineData(
      name: 'Обучение с подкреплением',
      professor: 'Иванов А. М.',
      credits: 5,
      type: DisciplineType.master,
      description:
      'Марковские процессы принятия решений, Q-Learning, Policy Gradient, '
          'Actor-Critic методы. Реализация агентов в OpenAI Gym.',
      seats: 15,
    ),
    DisciplineData(
      name: 'Большие языковые модели',
      professor: 'Соколова Е. В.',
      credits: 4,
      type: DisciplineType.master,
      description:
      'Архитектура GPT, BERT, обучение с учителем и RLHF, '
          'fine-tuning, RAG, применение в промышленных задачах.',
      seats: 20,
    ),
    DisciplineData(
      name: 'Генеративные модели',
      professor: 'Кузнецова А. П.',
      credits: 3,
      type: DisciplineType.master,
      description:
      'GAN, VAE, Diffusion Models, Score-based models. '
          'Теория и практика генерации изображений и текста.',
      seats: 18,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;

    return BlocBuilder<DepartmentBloc, DepartmentState>(
      builder: (context, state) => state.when(
        initial: () => const DisciplinesSkeleton(),
        loading: () => const DisciplinesSkeleton(),
        error: (_) => const DisciplinesSkeleton(),
        success: (_) => SliverMainAxisGroup(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Бакалавриат', style: tt.titleMedium),
                  const SizedBox(height: 4),
                  _InfoBanner(
                    icon: Icons.info_outline,
                    text:
                    'Расставьте приоритеты от 1 (наиболее желаемое) до ${_bachelor.length}. '
                        'Деканат распределит вас на 3 курс с учётом приоритетов и мест.',
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
            _BachelorDisciplineList(disciplines: _bachelor),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Магистратура', style: tt.titleMedium),
                    const SizedBox(height: 4),
                    _InfoBanner(
                      icon: Icons.school_outlined,
                      text:
                      'Поступление через конкурс. Ознакомьтесь с программами '
                          'и обратитесь на кафедру для участия в отборе.',
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
            SliverList.separated(
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemCount: _master.length,
              itemBuilder: (_, i) => DisciplineCard(discipline: _master[i]),
            ),
          ],
        ),
      ),
    );
  }
}

class _BachelorDisciplineList extends StatefulWidget {
  const _BachelorDisciplineList({required this.disciplines});
  final List<DisciplineData> disciplines;

  @override
  State<_BachelorDisciplineList> createState() =>
      _BachelorDisciplineListState();
}

class _BachelorDisciplineListState extends State<_BachelorDisciplineList> {
  late List<DisciplineData> _ordered;
  bool _submitted = false;

  @override
  void initState() {
    super.initState();
    _ordered = List.of(widget.disciplines);
  }

  Widget _buildCard(BuildContext context, int i, {double opacity = 1.0}) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt = Theme.of(context).textTheme;
    final d = _ordered[i];

    return Opacity(
      opacity: opacity,
      child: Container(
        decoration: BoxDecoration(
          color: cs.surface,
          borderRadius: BorderRadius.circular(AppTheme.radiusLg),
          border: Border.all(color: ext.border),
          boxShadow: opacity < 1.0
              ? [
            BoxShadow(
              color: Colors.black.withValues(alpha: .12),
              blurRadius: 8,
              offset: const Offset(0, 4),
            )
          ]
              : null,
        ),
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: cs.primary,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                '${i + 1}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  height: 1,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    d.name,
                    style: tt.labelLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${d.professor} · ${d.credits} з.е.',
                    style:
                    tt.labelSmall?.copyWith(color: ext.textSecondary),
                  ),
                ],
              ),
            ),
            ReorderableDragStartListener(
              index: i,
              child: Icon(Icons.drag_handle,
                  color: ext.textTertiary, size: 22),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;

    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: ReorderableListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            buildDefaultDragHandles: false,
            // Ключевое исправление — proxyDecorator сохраняет скругление
            proxyDecorator: (child, index, animation) {
              return AnimatedBuilder(
                animation: animation,
                builder: (_, __) => Material(
                  color: Colors.transparent,
                  borderRadius:
                  BorderRadius.circular(AppTheme.radiusLg),
                  child: _buildCard(context, index, opacity: 0.95),
                ),
              );
            },
            onReorder: (oldIndex, newIndex) {
              setState(() {
                if (newIndex > oldIndex) newIndex--;
                final item = _ordered.removeAt(oldIndex);
                _ordered.insert(newIndex, item);
              });
            },
            itemCount: _ordered.length,
            itemBuilder: (_, i) {
              final d = _ordered[i];
              return Padding(
                key: ValueKey(d.name),
                padding: const EdgeInsets.only(bottom: 10),
                child: GestureDetector(
                  onTap: () => showDetailSheet(
                    context: context,
                    child: DisciplineDetailSheet(discipline: d),
                  ),
                  child: _buildCard(context, i),
                ),
              );
            },
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: SizedBox(
              height: 48,
              child: ElevatedButton.icon(
                onPressed: _submitted
                    ? null
                    : () => setState(() => _submitted = true),
                style: _submitted
                    ? ElevatedButton.styleFrom(
                  backgroundColor: ext.successBg,
                  foregroundColor: ext.successFg,
                )
                    : null,
                icon: Icon(
                  _submitted
                      ? Icons.check_circle_outline
                      : Icons.send_outlined,
                  size: 18,
                ),
                label: Text(
                  _submitted
                      ? 'Приоритеты отправлены'
                      : 'Отправить приоритеты',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _InfoBanner extends StatelessWidget {
  const _InfoBanner({required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: ext.infoBg,
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 15, color: ext.infoFg),
          const SizedBox(width: 8),
          Expanded(
            child: Text(text,
                style: tt.bodySmall
                    ?.copyWith(color: ext.infoFg, height: 1.4)),
          ),
        ],
      ),
    );
  }
}

enum DisciplineType { bachelor, master }

class DisciplineData {
  final String name;
  final String professor;
  final int credits;
  final DisciplineType type;
  final String description;
  final int seats;

  const DisciplineData({
    required this.name,
    required this.professor,
    required this.credits,
    required this.type,
    required this.description,
    required this.seats,
  });
}

class DisciplineDetailSheet extends StatelessWidget {
  const DisciplineDetailSheet({super.key, required this.discipline});
  final DisciplineData discipline;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: ext.infoBg,
                borderRadius: BorderRadius.circular(AppTheme.radiusSm),
              ),
              child: Text(
                '${discipline.credits} з.е.',
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: ext.infoFg,
                    height: 1),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: ext.surfaceTinted,
                borderRadius: BorderRadius.circular(AppTheme.radiusSm),
              ),
              child: Text(
                discipline.type == DisciplineType.bachelor
                    ? 'Бакалавриат'
                    : 'Магистратура',
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: ext.textOnTinted,
                    height: 1),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          discipline.name,
          style: tt.titleLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 6),
        Text(
          discipline.professor,
          style: tt.bodyMedium?.copyWith(color: ext.textSecondary),
        ),
        Divider(color: ext.divider, height: 24),
        Text('О дисциплине',
            style: tt.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Text(
          discipline.description,
          style: tt.bodyLarge?.copyWith(
              fontSize: 15, height: 1.6, color: ext.textPrimary),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: ext.surfaceTinted,
            borderRadius: BorderRadius.circular(AppTheme.radiusMd),
          ),
          child: Row(
            children: [
              Icon(Icons.people_outline,
                  size: 16, color: ext.textOnTinted),
              const SizedBox(width: 8),
              Text(
                'Мест: ${discipline.seats}',
                style: tt.labelLarge?.copyWith(color: ext.textOnTinted),
              ),
            ],
          ),
        ),
        if (discipline.type == DisciplineType.master) ...[
          const SizedBox(height: 24),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: ext.infoBg,
              borderRadius: BorderRadius.circular(AppTheme.radiusMd),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.school_outlined, size: 16, color: ext.infoFg),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Поступление через отдельный конкурс. '
                        'Обратитесь на кафедру для уточнения условий.',
                    style: tt.bodySmall
                        ?.copyWith(color: ext.infoFg, height: 1.4),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}