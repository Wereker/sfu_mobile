import 'package:flutter/material.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/core/widgets/shimmer_box.dart';

class DisciplinesSkeleton extends StatelessWidget {
  const DisciplinesSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemCount: 5,
      itemBuilder: (_, __) => const _DisciplineCardSkeleton(),
    );
  }
}

class _DisciplineCardSkeleton extends StatelessWidget {
  const _DisciplineCardSkeleton();

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerBox(
                        width: double.infinity, height: 15, borderRadius: 4),
                    SizedBox(height: 6),
                    ShimmerBox(width: 120, height: 12, borderRadius: 4),
                  ],
                ),
              ),
              SizedBox(width: 10),
              ShimmerBox(width: 50, height: 26, borderRadius: 8),
            ],
          ),
          SizedBox(height: 12),
          ShimmerBox(width: double.infinity, height: 44, borderRadius: 12),
        ],
      ),
    );
  }
}