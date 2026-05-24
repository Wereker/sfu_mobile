import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sfu/src/core/theme/app_theme.dart';

class MessageDateDivider extends StatelessWidget {
  const MessageDateDivider({super.key, required this.date});
  final DateTime date;

  String _label() {
    final now = DateTime.now();
    if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day) {
      return 'Сегодня';
    }
    final yesterday = now.subtract(const Duration(days: 1));
    if (date.year == yesterday.year &&
        date.month == yesterday.month &&
        date.day == yesterday.day) {
      return 'Вчера';
    }
    return DateFormat('d MMMM', 'ru').format(date);
  }

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
            color: ext.divider,
            borderRadius: BorderRadius.circular(AppTheme.radiusSm),
          ),
          child: Text(
            _label(),
            style: tt.labelSmall?.copyWith(
                color: ext.textSecondary, fontSize: 11),
          ),
        ),
      ),
    );
  }
}