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
  int _filter = 0; // 0=все, 1=свободные, 2=занятые

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DepartmentBloc, DepartmentState>(
      builder: (context, state) => state.when(
        initial: () => const ThesisSkeleton(),
        loading: () => const ThesisSkeleton(),
        error:   (_) => const ThesisSkeleton(),
        success: (staff) {
          return _ThesisContent(filter: _filter, onFilterChanged: (f) {
            setState(() => _filter = f);
          });
        },
      ),
    );
  }
}

class _ThesisContent extends StatelessWidget {
  const _ThesisContent({
    required this.filter,
    required this.onFilterChanged,
  });

  final int filter;
  final ValueChanged<int> onFilterChanged;

  static const _theses = [
    ThesisData(
      title: 'Сегментация медицинских снимков с помощью U-Net',
      professor: 'Соколова Е. В.',
      isFree: true,
    ),
    ThesisData(
      title: 'RAG-система для документации СФУ',
      professor: 'Кузнецова А. П.',
      isFree: true,
    ),
    ThesisData(
      title: 'Обнаружение аномалий в логах серверов',
      professor: 'Петров С. И.',
      isFree: false,
      takenBy: 'Соколов Д. А.',
    ),
    ThesisData(
      title: 'Оптимизация гиперпараметров через байесовский поиск',
      professor: 'Иванов А. М.',
      isFree: true,
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
          itemBuilder: (_, i) => ThesisCard(thesis: _filtered[i]),
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

  const ThesisData({
    required this.title,
    required this.professor,
    required this.isFree,
    this.takenBy,
  });
}