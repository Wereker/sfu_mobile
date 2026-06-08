import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:sfu/src/core/l10n/strings.g.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/core/widgets/user_avatar.dart';
import 'package:sfu/src/feature/chat/message/domain/entity/message.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    super.key,
    required this.message,
    required this.showAvatar,
  });

  final Message message;
  final bool showAvatar;

  void _copyText(BuildContext context) {
    final t = Translations.of(context);
    Clipboard.setData(ClipboardData(text: message.body));
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(t.common.copied)));
  }

  @override
  Widget build(BuildContext context) {
    final t   = Translations.of(context);
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;
    final isOut = message.isOutgoing;

    final bubbleColor =
    isOut ? cs.primary.withValues(alpha: .15) : cs.surface;
    final bubbleBorder = isOut ? null : Border.all(color: ext.border);
    final radius = BorderRadius.only(
      topLeft:     const Radius.circular(16),
      topRight:    const Radius.circular(16),
      bottomLeft:  Radius.circular(isOut ? 16 : 4),
      bottomRight: Radius.circular(isOut ? 4 : 16),
    );

    return Padding(
      padding: EdgeInsets.only(
        top: 2, bottom: 2,
        left: isOut ? 56 : 0,
        right: isOut ? 0 : 56,
      ),
      child: Row(
        mainAxisAlignment:
        isOut ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isOut)
            SizedBox(
              width: 32,
              child: showAvatar
                  ? UserAvatar(
                name: message.senderName.isNotEmpty
                    ? message.senderName
                    : '?',
                size: 28,
              )
                  : null,
            ),
          if (!isOut) const SizedBox(width: 6),

          Flexible(
            child: GestureDetector(
              onLongPress: () => _copyText(context),
              child: Container(
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 6),
                decoration: BoxDecoration(
                  color: bubbleColor,
                  borderRadius: radius,
                  border: bubbleBorder,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (!isOut && message.senderName.isNotEmpty)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          message.senderName,
                          style: tt.labelSmall?.copyWith(
                            color: cs.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    if (!isOut && message.senderName.isNotEmpty)
                      const SizedBox(height: 2),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        message.body,
                        style: tt.bodyLarge?.copyWith(fontSize: 15),
                      ),
                    ),

                    const SizedBox(height: 3),

                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (message.isEdited)
                          Text(
                            '${t.chat.edited} ',
                            style: tt.labelSmall?.copyWith(
                              color: ext.textTertiary,
                              fontSize: 10,
                            ),
                          ),
                        Text(
                          DateFormat('HH:mm').format(message.createdAt),
                          style: tt.labelSmall?.copyWith(
                            color: ext.textTertiary,
                            fontSize: 10,
                          ),
                        ),
                        if (isOut) ...[
                          const SizedBox(width: 4),
                          _StatusIcon(status: message.status),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusIcon extends StatelessWidget {
  const _StatusIcon({required this.status});
  final MessageStatus status;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;
    switch (status) {
      case MessageStatus.sent:
        return Icon(Icons.done, size: 14, color: ext.textTertiary);
      case MessageStatus.delivered:
        return Icon(Icons.done_all, size: 14, color: ext.textTertiary);
      case MessageStatus.read:
        return Icon(Icons.done_all, size: 14, color: ext.successFg);
    }
  }
}