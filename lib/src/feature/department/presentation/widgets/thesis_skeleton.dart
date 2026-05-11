import 'package:flutter/material.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/core/widgets/shimmer_box.dart';

class ThesisSkeleton extends StatelessWidget {
  const ThesisSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemCount: 4,
      itemBuilder: (_, __) => const _ThesisCardSkeleton(),
    );
  }
}

class _ThesisCardSkeleton extends StatelessWidget {
  const _ThesisCardSkeleton();

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
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerBox(
                        width: double.infinity, height: 14, borderRadius: 4),
                    SizedBox(height: 6),
                    ShimmerBox(width: 200, height: 14, borderRadius: 4),
                  ],
                ),
              ),
              SizedBox(width: 10),
              ShimmerBox(width: 70, height: 24, borderRadius: 8),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: const [
              ShimmerBox(width: 36, height: 36, isCircle: true),
              SizedBox(width: 8),
              ShimmerBox(width: 150, height: 12, borderRadius: 4),
            ],
          ),
          const SizedBox(height: 12),
          const ShimmerBox(
              width: double.infinity, height: 44, borderRadius: 12),
        ],
      ),
    );
  }
}