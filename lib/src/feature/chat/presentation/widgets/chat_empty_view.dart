import 'package:flutter/material.dart';
import 'package:sfu/src/core/theme/app_theme.dart';

class ChatEmptyView extends StatelessWidget {
  const ChatEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

    return SliverFillRemaining(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.chat_bubble_outline,
                size: 48, color: ext.textTertiary),
            const SizedBox(height: 12),
            Text('Чатов пока нет',
                style: tt.bodyMedium?.copyWith(color: ext.textSecondary)),
          ],
        ),
      ),
    );
  }
}