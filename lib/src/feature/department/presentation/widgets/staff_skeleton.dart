import 'package:flutter/material.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/core/widgets/shimmer_box.dart';

class StaffSkeleton extends StatelessWidget {
  const StaffSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemCount: 4,
      itemBuilder: (_, __) => const _StaffCardSkeleton(),
    );
  }
}

class _StaffCardSkeleton extends StatelessWidget {
  const _StaffCardSkeleton();

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
      padding: const EdgeInsets.all(14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Аватар
          const ShimmerBox(width: 52, height: 52, isCircle: true),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                // Имя
                ShimmerBox(width: 180, height: 15, borderRadius: 4),
                SizedBox(height: 6),
                // Должность
                ShimmerBox(width: 140, height: 12, borderRadius: 4),
                SizedBox(height: 12),
                // Теги
                Row(
                  children: [
                    ShimmerBox(width: 80, height: 22, borderRadius: 8),
                    SizedBox(width: 6),
                    ShimmerBox(width: 70, height: 22, borderRadius: 8),
                    SizedBox(width: 6),
                    ShimmerBox(width: 60, height: 22, borderRadius: 8),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),
          const ShimmerBox(width: 20, height: 20, borderRadius: 4),
        ],
      ),
    );
  }
}