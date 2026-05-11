import 'package:flutter/material.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/core/widgets/shimmer_box.dart';

class StudentsSkeleton extends StatelessWidget {
  const StudentsSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;

    return SliverList.separated(
      separatorBuilder: (_, __) =>
          Divider(height: 1, color: ext.divider, indent: 72),
      itemCount: 8,
      itemBuilder: (_, __) => const _StudentRowSkeleton(),
    );
  }
}

class _StudentRowSkeleton extends StatelessWidget {
  const _StudentRowSkeleton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          // Аватар
          const ShimmerBox(width: 44, height: 44, isCircle: true),
          const SizedBox(width: 12),

          // Имя + группа
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                ShimmerBox(width: 160, height: 14, borderRadius: 4),
                SizedBox(height: 6),
                ShimmerBox(width: 80, height: 12, borderRadius: 4),
              ],
            ),
          ),

          // Иконки контактов
          const ShimmerBox(width: 18, height: 18, isCircle: true),
          const SizedBox(width: 12),
          const ShimmerBox(width: 18, height: 18, isCircle: true),
          const SizedBox(width: 12),
          const ShimmerBox(width: 18, height: 18, borderRadius: 4),
        ],
      ),
    );
  }
}