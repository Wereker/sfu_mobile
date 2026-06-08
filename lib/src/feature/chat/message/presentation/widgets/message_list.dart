import 'package:flutter/material.dart';
import 'package:sfu/src/core/l10n/strings.g.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/feature/chat/message/domain/entity/message.dart';
import 'package:sfu/src/feature/chat/message/presentation/widgets/message_bubble.dart';
import 'package:sfu/src/feature/chat/message/presentation/widgets/message_date_divider.dart';

class MessageList extends StatefulWidget {
  const MessageList({super.key, required this.messages});
  final List<Message> messages;

  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  final _scrollController = ScrollController();

  @override
  void didUpdateWidget(covariant MessageList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.messages.length != oldWidget.messages.length) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  bool _showAvatar(int index) {
    final msgs = widget.messages;
    if (msgs[index].isOutgoing) return false;
    if (index == 0) return true;
    return msgs[index - 1].isOutgoing ||
        msgs[index - 1].senderId != msgs[index].senderId;
  }

  bool _showDateDivider(int index) {
    if (index == 0) return true;
    final msgs = widget.messages;
    final a = msgs[index - 1].createdAt;
    final b = msgs[index].createdAt;
    return a.year != b.year || a.month != b.month || a.day != b.day;
  }

  @override
  Widget build(BuildContext context) {
    final t   = Translations.of(context);
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;
    final msgs = widget.messages;

    if (msgs.isEmpty) {
      return Center(
        child: Text(
          t.chat.noMessages,
          style: tt.bodyMedium?.copyWith(color: ext.textSecondary),
        ),
      );
    }

    return ListView.builder(
      controller: _scrollController,
      reverse: true,
      padding: EdgeInsets.only(
        left: 12, right: 12, top: 12,
        bottom: MediaQuery.of(context).viewInsets.bottom + 12,
      ),
      itemCount: msgs.length,
      itemBuilder: (_, i) {
        final realIndex = msgs.length - 1 - i;
        final msg = msgs[realIndex];

        return Column(
          children: [
            if (_showDateDivider(realIndex))
              MessageDateDivider(date: msg.createdAt),
            MessageBubble(
              message: msg,
              showAvatar: _showAvatar(realIndex),
            ),
          ],
        );
      },
    );
  }
}