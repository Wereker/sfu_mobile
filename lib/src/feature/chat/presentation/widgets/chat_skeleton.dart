import 'package:flutter/material.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/core/widgets/shimmer_box.dart';

class ChatSkeleton extends StatelessWidget {
  const ChatSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;

    return SliverList.separated(
      separatorBuilder: (_, __) =>
          Divider(height: 1, indent: 72, color: ext.divider),
      itemCount: 7,
      itemBuilder: (_, __) => const _ChatRowSkeleton(),
    );
  }
}

class _ChatRowSkeleton extends StatelessWidget {
  const _ChatRowSkeleton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          // Аватар
          const ShimmerBox(width: 48, height: 48, isCircle: true),
          const SizedBox(width: 12),

          // Имя + превью
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                ShimmerBox(width: 140, height: 15, borderRadius: 4),
                SizedBox(height: 6),
                ShimmerBox(
                    width: double.infinity, height: 13, borderRadius: 4),
              ],
            ),
          ),

          const SizedBox(width: 10),

          // Время + бейдж
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              ShimmerBox(width: 32, height: 11, borderRadius: 4),
              SizedBox(height: 6),
              ShimmerBox(width: 20, height: 20, borderRadius: 10),
            ],
          ),
        ],
      ),
    );
  }
}