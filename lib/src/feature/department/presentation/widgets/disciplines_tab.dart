import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/feature/department/presentation/bloc/department_bloc.dart';
import 'package:sfu/src/feature/department/presentation/widgets/discipline_card.dart';
import 'package:sfu/src/feature/department/presentation/widgets/disciplines_skeleton.dart';

class DisciplinesTab extends StatelessWidget {
  const DisciplinesTab({super.key});

  static const _bachelor = [
    DisciplineData(name: 'Глубокое обучение',   professor: 'Соколова Е. В.', credits: 4),
    DisciplineData(name: 'Компьютерное зрение', professor: 'Кузнецова А. П.', credits: 3),
    DisciplineData(name: 'Анализ данных',        professor: 'Петров С. И.',   credits: 3),
  ];

  static const _master = [
    DisciplineData(name: 'Обучение с подкреплением',  professor: 'Иванов А. М.',   credits: 5),
    DisciplineData(name: 'Большие языковые модели',   professor: 'Соколова Е. В.', credits: 4),
    DisciplineData(name: 'Генеративные модели',        professor: 'Кузнецова А. П.', credits: 3),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DepartmentBloc, DepartmentState>(
      builder: (context, state) => state.when(
        initial: () => const DisciplinesSkeleton(),
        loading: () => const DisciplinesSkeleton(),
        error:   (_) => const DisciplinesSkeleton(),
        success: (_) => SliverMainAxisGroup(
          slivers: [
            const SliverToBoxAdapter(child: _SectionHeader(title: 'Бакалавриат')),
            SliverList.separated(
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemCount: _bachelor.length,
              itemBuilder: (_, i) => DisciplineCard(discipline: _bachelor[i]),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 24),
                child: const _SectionHeader(title: 'Магистратура'),
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

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(title, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}

// Локальная модель (до DisciplinesBloc)
class DisciplineData {
  final String name;
  final String professor;
  final int credits;
  const DisciplineData({
    required this.name,
    required this.professor,
    required this.credits,
  });
}