import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/feature/department/presentation/bloc/department_bloc.dart';
import 'package:sfu/src/feature/department/presentation/widgets/shared/department_filter_chip.dart';
import 'package:sfu/src/feature/department/presentation/widgets/thesis_card.dart';
import 'package:sfu/src/feature/department/presentation/widgets/thesis_skeleton.dart';

class ThesisTab extends StatefulWidget {
  const ThesisTab({super.key});

  @override
  State<ThesisTab> createState() => _ThesisTabState();
}

class _ThesisTabState extends State<ThesisTab> {
  int _filter = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DepartmentBloc, DepartmentState>(
      builder: (context, state) => state.when(
        initial: () => const ThesisSkeleton(),
        loading: () => const ThesisSkeleton(),
        error: (_) => const ThesisSkeleton(),
        success: (_) => _ThesisContent(
          filter: _filter,
          onFilterChanged: (f) => setState(() => _filter = f),
        ),
      ),
    );
  }
}

class _ThesisContent extends StatelessWidget {
  const _ThesisContent({required this.filter, required this.onFilterChanged});
  final int filter;
  final ValueChanged<int> onFilterChanged;

  static const _theses = [
    ThesisData(
      title: 'Сегментация медицинских снимков с помощью U-Net',
      professor: 'Соколова Е. В.',
      isFree: true,
      description:
      'Работа посвящена разработке системы автоматической сегментации патологических '
          'образований на МРТ-снимках с использованием архитектуры U-Net. '
          'Предполагается обучение на датасете BRATS и оценка метрик Dice, IoU. '
          'Результатом работы станет веб-сервис для загрузки и анализа снимков.',
      requirements: 'Знание PyTorch, опыт работы с изображениями (OpenCV/PIL), базовый опыт в медицинских данных.',
      tags: ['CV', 'PyTorch', 'Medical AI'],
    ),
    ThesisData(
      title: 'RAG-система для документации СФУ',
      professor: 'Кузнецова А. П.',
      isFree: true,
      description:
      'Разработка системы вопросно-ответного поиска на основе Retrieval-Augmented Generation '
          'для базы документов СФУ. Включает парсинг, векторизацию, '
          'хранение в векторной БД и интеграцию с LLM.',
      requirements: 'LangChain или LlamaIndex, работа с API LLM (OpenAI/Ollama), базы данных (Postgres/Chroma).',
      tags: ['NLP', 'RAG', 'LLM'],
    ),
    ThesisData(
      title: 'Обнаружение аномалий в логах серверов',
      professor: 'Петров С. И.',
      isFree: false,
      takenBy: 'Соколов Д. А.',
      description:
      'Разработка системы мониторинга и обнаружения аномалий в потоке логов '
          'с применением методов машинного обучения (Isolation Forest, Autoencoder). '
          'Интеграция с ELK Stack.',
      requirements: 'Scikit-learn, понимание DevOps-инфраструктуры, опыт с временными рядами.',
      tags: ['Anomaly Detection', 'ELK', 'MLOps'],
    ),
    ThesisData(
      title: 'Оптимизация гиперпараметров через байесовский поиск',
      professor: 'Иванов А. М.',
      isFree: true,
      description:
      'Исследование и реализация байесовской оптимизации гиперпараметров с применением '
          'библиотек Optuna и GPyOpt. Сравнение с Grid Search и Random Search '
          'на задачах классификации и регрессии.',
      requirements: 'Optuna/Hyperopt, статистика, опыт обучения ML-моделей.',
      tags: ['AutoML', 'Optuna', 'Research'],
    ),
  ];

  List<ThesisData> get _filtered {
    if (filter == 1) return _theses.where((t) => t.isFree).toList();
    if (filter == 2) return _theses.where((t) => !t.isFree).toList();
    return _theses;
  }

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              children: [
                DepartmentFilterChip(
                  label: 'Все',
                  isActive: filter == 0,
                  onTap: () => onFilterChanged(0),
                ),
                const SizedBox(width: 8),
                DepartmentFilterChip(
                  label: 'Свободные',
                  isActive: filter == 1,
                  onTap: () => onFilterChanged(1),
                ),
                const SizedBox(width: 8),
                DepartmentFilterChip(
                  label: 'Занятые',
                  isActive: filter == 2,
                  onTap: () => onFilterChanged(2),
                ),
              ],
            ),
          ),
        ),
        SliverList.separated(
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemCount: _filtered.length,
          itemBuilder: (ctx, i) => ThesisCard(thesis: _filtered[i]),
        ),
      ],
    );
  }
}

class ThesisData {
  final String title;
  final String professor;
  final bool isFree;
  final String? takenBy;
  final String description;
  final String requirements;
  final List<String> tags;

  const ThesisData({
    required this.title,
    required this.professor,
    required this.isFree,
    this.takenBy,
    required this.description,
    required this.requirements,
    this.tags = const [],
  });
}