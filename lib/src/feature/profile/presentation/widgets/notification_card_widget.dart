import 'package:flutter/material.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/feature/profile/presentation/widgets/settings_toggle_button.dart';

class NotificationsCard extends StatelessWidget {
  const NotificationsCard({
    super.key,
    required this.notifyChats,
    required this.notifyNews,
    required this.notifyEvents,
    required this.onChats,
    required this.onNews,
    required this.onEvents,
  });

  final bool notifyChats, notifyNews, notifyEvents;
  final ValueChanged<bool> onChats, onNews, onEvents;

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
      child: Column(
        children: [
          SettingsToggleRow(
            icon: Icons.chat_bubble_outline,
            label: 'Чаты',
            value: notifyChats,
            onChanged: onChats,
            isLast: false,
          ),
          Divider(height: 1, color: ext.divider, indent: 16),
          SettingsToggleRow(
            icon: Icons.campaign_outlined,
            label: 'Объявления',
            value: notifyNews,
            onChanged: onNews,
            isLast: false,
          ),
          Divider(height: 1, color: ext.divider, indent: 16),
          SettingsToggleRow(
            icon: Icons.event_outlined,
            label: 'События',
            value: notifyEvents,
            onChanged: onEvents,
            isLast: true,
          ),
        ],
      ),
    );
  }
}