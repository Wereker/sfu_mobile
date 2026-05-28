import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/core/widgets/user_avatar.dart';
import 'package:sfu/src/feature/chat/domain/entity/chat.dart';
import 'package:sfu/src/feature/chat/message/presentation/screens/message_screen.dart';

class ChatRow extends StatelessWidget {
  const ChatRow({super.key, required this.chat});
  final Chat chat;

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day) {
      return DateFormat('HH:mm').format(date);
    }
    final yesterday = now.subtract(const Duration(days: 1));
    if (date.year == yesterday.year &&
        date.month == yesterday.month &&
        date.day == yesterday.day) {
      return 'Вчера';
    }
    return DateFormat('dd.MM').format(date);
  }

  bool _isOnline() {
    if (chat.lastMessageAt == null) return false;
    return DateTime.now().difference(chat.lastMessageAt!).inMinutes < 5;
  }

  @override
  Widget build(BuildContext context) {
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

    final hasUnread = chat.unreadCount > 0;
    final date = _formatDate(chat.lastMessageAt ?? chat.updatedAt);
    final lastMsg = chat.lastMessage;

    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => MessageScreen(
            chatId: int.tryParse(chat.id) ?? 0,
            chatTitle: chat.title,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            // Аватар + онлайн-индикатор
            Stack(
              children: [
                UserAvatar(
                  name: chat.title,
                  avatarUrl: chat.avatarUrl,
                  size: 48,
                ),
                if (chat.type == ChatType.private)
                  Positioned(
                    bottom: 1, right: 1,
                    child: Container(
                      width: 12, height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _isOnline()
                            ? ext.successFg
                            : ext.textTertiary,
                        border: Border.all(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chat.title,
                    style: tt.labelLarge?.copyWith(
                      fontWeight:
                      hasUnread ? FontWeight.w700 : FontWeight.w600,
                      fontSize: 15,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  if (lastMsg != null)
                    Row(
                      children: [
                        if (lastMsg.isOutgoing) ...[
                          Icon(
                            Icons.done,
                            size: 14,
                            color: ext.textTertiary,
                          ),
                          const SizedBox(width: 3),
                        ],
                        Expanded(
                          child: Text(
                            lastMsg.body.isEmpty ? '📎 Файл' : lastMsg.body,
                            style: tt.bodyMedium?.copyWith(
                              fontSize: 13,
                              color: hasUnread
                                  ? ext.textPrimary
                                  : ext.textSecondary,
                              fontWeight: hasUnread
                                  ? FontWeight.w500
                                  : FontWeight.w400,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    )
                  else
                    Text(
                      'Нет сообщений',
                      style: tt.bodyMedium?.copyWith(
                        fontSize: 13,
                        color: ext.textTertiary,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                ],
              ),
            ),

            const SizedBox(width: 10),

            // Дата + счётчик непрочитанных
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  date,
                  style: tt.labelSmall?.copyWith(
                    color: hasUnread ? cs.primary : ext.textTertiary,
                    fontWeight:
                    hasUnread ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 4),
                if (hasUnread)
                  Container(
                    constraints: const BoxConstraints(minWidth: 20),
                    height: 20,
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                      color: cs.primary,
                      borderRadius:
                      BorderRadius.circular(AppTheme.radiusSm),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      chat.unreadCount > 99
                          ? '99+'
                          : '${chat.unreadCount}',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: cs.onPrimary,
                        height: 1,
                      ),
                    ),
                  )
                else
                  const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}