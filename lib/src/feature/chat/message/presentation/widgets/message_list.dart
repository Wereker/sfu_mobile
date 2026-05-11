import 'package:flutter/material.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/feature/chat/message/domain/entity/message.dart';
import 'package:sfu/src/feature/chat/message/presentation/widgets/message_bubble.dart';
import 'package:sfu/src/feature/chat/message/presentation/widgets/message_date_divider.dart';

class MessageList extends StatelessWidget {
  const MessageList({super.key, required this.messages});
  final List<Message> messages;

  bool _showAvatar(int index) {
    if (messages[index].isOutgoing) return false;
    if (index == 0) return true;
    return messages[index - 1].isOutgoing ||
        messages[index - 1].senderId != messages[index].senderId;
  }

  bool _showDateDivider(int index) {
    if (index == 0) return true;
    final a = messages[index - 1].sentAt;
    final b = messages[index].sentAt;
    return a.year != b.year || a.month != b.month || a.day != b.day;
  }

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

    if (messages.isEmpty) {
      return Center(
        child: Text('Сообщений пока нет',
            style: tt.bodyMedium?.copyWith(color: ext.textSecondary)),
      );
    }

    return ListView.builder(
      reverse: true,
      padding: EdgeInsets.only(
        left: 12, right: 12, top: 12,
        bottom: MediaQuery.of(context).viewInsets.bottom + 12,
      ),
      itemCount: messages.length,
      itemBuilder: (_, i) {
        final realIndex = messages.length - 1 - i;
        final msg       = messages[realIndex];

        return Column(
          children: [
            if (_showDateDivider(realIndex))
              MessageDateDivider(date: msg.sentAt),
            MessageBubble(
              message:    msg,
              showAvatar: _showAvatar(realIndex),
            ),
          ],
        );
      },
    );
  }
}