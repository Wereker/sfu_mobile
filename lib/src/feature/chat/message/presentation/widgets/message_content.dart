part of '../screens/message_screen.dart';

class _MessageContent extends StatelessWidget {
  const _MessageContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessageBloc, MessageState>(
      builder: (BuildContext context, MessageState state) {
        return state.maybeWhen(
          loading: () => const _MessageLoadingContent(),
          success: (messages) => _MessageContentState(messages: messages),
          error: (message) => const _MessageErrorContent(),
          orElse: () => const _MessageEmptyContent(),
        );
      },
    );
  }
}

class _MessageLoadingContent extends StatelessWidget {
  const _MessageLoadingContent();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).unfocus(),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(child: Center(child: LoadingIndicatorWidget())),
        ],
      ),
    );
  }
}

class _MessageErrorContent extends StatelessWidget {
  const _MessageErrorContent();

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).unfocus(),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, size: 48, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    '${t!.timetableError}: Не удалось загрузить расписание',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MessageEmptyContent extends StatelessWidget {
  const _MessageEmptyContent();

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).unfocus(),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Center(
              child: Text(
                t!.timetableNotFoundData,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MessageContentState extends StatelessWidget {
  final List<Message> messages;

  const _MessageContentState({required this.messages});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).unfocus(),
      child: CustomScrollView(
        reverse: true,
        slivers: [
          SliverPadding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: MediaQuery.of(context).padding.bottom + 90,
            ),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final message = messages[messages.length - 1 - index];
                return _MessageItem(message: message);
              }, childCount: messages.length),
            ),
          ),
        ],
      ),
    );
  }
}

class _MessageTextField extends StatelessWidget {
  final BuildContext scaffoldContext;

  const _MessageTextField(this.scaffoldContext);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 12,
        right: 12,
        bottom: MediaQuery.of(scaffoldContext).padding.bottom + 8,
      ),
      color: Theme.of(context).colorScheme.surface,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Сообщение',
                filled: true,
                fillColor: Theme.of(context).brightness == Brightness.light
                    ? Colors.grey.withOpacity(0.1)
                    : Colors.grey.withOpacity(0.2),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          FloatingActionButton(
            mini: true,
            onPressed: () {},
            child: const Icon(Icons.send, size: 18),
          ),
        ],
      ),
    );
  }
}

class _MessageItem extends StatelessWidget {
  final Message message;

  const _MessageItem({required this.message});

  @override
  Widget build(BuildContext context) {
    final isOutgoing = message.isOutgoing;
    final showStatus = isOutgoing;

    return Padding(
      padding: EdgeInsets.only(
        top: 8,
        left: isOutgoing ? 80 : 16,
        right: isOutgoing ? 16 : 80,
      ),
      child: Row(
        mainAxisAlignment: isOutgoing
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isOutgoing)
            Container(
              width: 32,
              height: 32,
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withOpacity(0.3),
              ),
              child: const Center(
                child: Text('?', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          Flexible(
            child: Column(
              crossAxisAlignment: isOutgoing
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isOutgoing
                        ? Colors.blue.withOpacity(0.1)
                        : Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(12),
                      topRight: const Radius.circular(12),
                      bottomLeft: isOutgoing
                          ? const Radius.circular(12)
                          : Radius.zero,
                      bottomRight: isOutgoing
                          ? Radius.zero
                          : const Radius.circular(12),
                    ),
                  ),
                  child: Text(
                    message.text,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      DateFormat('HH:mm').format(message.sentAt),
                      style: const TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                    if (showStatus) ...[
                      const SizedBox(width: 4),
                      _buildStatusIcon(message.status),
                    ],
                    if (message.isEdited) ...[
                      const SizedBox(width: 4),
                      const Text(
                        'изменено',
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          if (isOutgoing)
            const SizedBox(width: 8), // Отступ после исходящего сообщения
        ],
      ),
    );
  }

  Widget _buildStatusIcon(MessageStatus status) {
    switch (status) {
      case MessageStatus.sent:
        return const Icon(Icons.done, size: 14, color: Colors.grey);
      case MessageStatus.delivered:
        return const Icon(Icons.done_all, size: 14, color: Colors.blue);
      case MessageStatus.read:
        return const Icon(Icons.done_all, size: 14, color: Colors.green);
    }
  }
}
