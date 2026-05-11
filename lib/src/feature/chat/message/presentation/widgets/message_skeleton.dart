import 'package:flutter/material.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/core/widgets/shimmer_box.dart';

class MessageSkeleton extends StatelessWidget {
  const MessageSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    // Имитируем чередование входящих и исходящих
    const pattern = [
      (isOut: false, lines: 2, width: 220.0),
      (isOut: false, lines: 1, width: 150.0),
      (isOut: true,  lines: 1, width: 180.0),
      (isOut: false, lines: 3, width: 240.0),
      (isOut: true,  lines: 2, width: 200.0),
      (isOut: true,  lines: 1, width: 120.0),
      (isOut: false, lines: 1, width: 160.0),
    ];

    return ListView.builder(
      reverse: true,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      itemCount: pattern.length,
      itemBuilder: (_, i) {
        final item = pattern[pattern.length - 1 - i];
        return _MessageBubbleSkeleton(
          isOut: item.isOut,
          lines: item.lines,
          width: item.width,
        );
      },
    );
  }
}

class _MessageBubbleSkeleton extends StatelessWidget {
  const _MessageBubbleSkeleton({
    required this.isOut,
    required this.lines,
    required this.width,
  });

  final bool isOut;
  final int lines;
  final double width;

  @override
  Widget build(BuildContext context) {
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;

    return Padding(
      padding: EdgeInsets.only(
        top: 4, bottom: 4,
        left: isOut ? 60 : 0,
        right: isOut ? 0 : 60,
      ),
      child: Row(
        mainAxisAlignment:
        isOut ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isOut) ...[
            const ShimmerBox(width: 28, height: 28, isCircle: true),
            const SizedBox(width: 6),
          ],
          Container(
            width: width,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isOut
                  ? cs.primary.withValues(alpha: .1)
                  : cs.surface,
              borderRadius: BorderRadius.only(
                topLeft:     const Radius.circular(16),
                topRight:    const Radius.circular(16),
                bottomLeft:  Radius.circular(isOut ? 16 : 4),
                bottomRight: Radius.circular(isOut ? 4 : 16),
              ),
              border: isOut ? null : Border.all(color: ext.border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...List.generate(lines, (i) => Padding(
                  padding: EdgeInsets.only(bottom: i < lines - 1 ? 6 : 0),
                  child: ShimmerBox(
                    width: i == lines - 1 && lines > 1
                        ? width * 0.6
                        : width - 24,
                    height: 13,
                    borderRadius: 4,
                  ),
                )),
                const SizedBox(height: 6),
                Align(
                  alignment: Alignment.centerRight,
                  child: ShimmerBox(width: 40, height: 10, borderRadius: 3),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}