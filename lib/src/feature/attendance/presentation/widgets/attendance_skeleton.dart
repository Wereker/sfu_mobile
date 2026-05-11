import 'package:flutter/material.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/core/widgets/shimmer_box.dart';

class AttendanceSkeleton extends StatelessWidget {
  const AttendanceSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemCount: 3,
      itemBuilder: (_, __) => const _LessonCardSkeleton(),
    );
  }
}

class _LessonCardSkeleton extends StatelessWidget {
  const _LessonCardSkeleton();

  @override
  Widget build(BuildContext context) {
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;

    return Container(
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        border: Border.all(color: ext.border),
      ),
      padding: const EdgeInsets.fromLTRB(19, 14, 14, 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Тип + время
          Row(
            children: const [
              ShimmerBox(width: 70, height: 20, borderRadius: 4),
              Spacer(),
              ShimmerBox(width: 80, height: 12, borderRadius: 4),
            ],
          ),
          const SizedBox(height: 10),
          // Название
          const ShimmerBox(width: double.infinity, height: 16, borderRadius: 4),
          const SizedBox(height: 8),
          // Группа + место
          Row(
            children: const [
              ShimmerBox(width: 70, height: 12, borderRadius: 4),
              SizedBox(width: 12),
              ShimmerBox(width: 60, height: 12, borderRadius: 4),
            ],
          ),
          const SizedBox(height: 14),
          // Прогресс-строка
          Row(
            children: const [
              ShimmerBox(width: 140, height: 12, borderRadius: 4),
              Spacer(),
              ShimmerBox(width: 36, height: 12, borderRadius: 4),
            ],
          ),
          const SizedBox(height: 8),
          // Прогресс-бар
          const ShimmerBox(width: double.infinity, height: 4, borderRadius: 2),
        ],
      ),
    );
  }
}