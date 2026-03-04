part of '../screens/chat_screen.dart';

class _ChatContent extends StatelessWidget {
  const _ChatContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (BuildContext context, ChatState state) {
        return state.maybeWhen(
          loading: () => const _ChatLoadingContent(),
          success: (chats) => _ChatContentState(chats: chats),
          error: (message) => const _ChatErrorContent(),
          orElse: () => const _ChatEmptyContent(),
        );
      },
    );
  }
}

class _ChatLoadingContent extends StatelessWidget {
  const _ChatLoadingContent();

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

class _ChatErrorContent extends StatelessWidget {
  const _ChatErrorContent();

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

class _ChatEmptyContent extends StatelessWidget {
  const _ChatEmptyContent();

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

class _ChatContentState extends StatelessWidget {
  final List<Chat> chats;

  const _ChatContentState({required this.chats});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return CustomScrollView(
      slivers: [
        // Заголовок экрана + поиск
        SliverAppBar(
          pinned: true,
          backgroundColor: Theme.of(context).colorScheme.surface,
          title: Text(
            "Чаты пользователя",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Поиск чата...',
                  filled: true,
                  fillColor: Theme.of(context).brightness == Brightness.light
                      ? Colors.orange.withOpacity(0.1)
                      : Colors.grey.withOpacity(0.2),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverPadding(padding: EdgeInsets.only(top: 16)),

        // Список чатов
        if (chats.isEmpty)
          SliverFillRemaining(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.chat_outlined, size: 48, color: Colors.grey),
                  const SizedBox(height: 16),
                  Text(
                    'У вас пока нет чатов с пользователями',
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
          )
        else
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final chat = chats[index];
              return ChatItem(chat: chat);
            }, childCount: chats.length),
          ),

        // Отступ снизу для комфортной прокрутки
        SliverPadding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom,
          ),
        ),
      ],
    );
  }
}

class ChatItem extends StatelessWidget {
  final Chat chat;

  const ChatItem({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              // Аватар
              _buildAvatar(context, chat),

              const SizedBox(width: 12),

              // Основная информация
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Имя чата + статус онлайн (для личных чатов)
                    Text(
                      chat.title,
                      style: TextStyle(
                        fontWeight: chat.unreadCount > 0
                            ? FontWeight.bold
                            : FontWeight.normal,
                        fontSize: 16,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    // Предпросмотр последнего сообщения
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            _getLastMessagePreview(chat.lastMessage),
                            style: TextStyle(
                              color: chat.unreadCount > 0
                                  ? Theme.of(context).colorScheme.onSurface
                                  : Colors.grey,
                              fontWeight: chat.unreadCount > 0
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontSize: 14,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (chat.lastMessage.isOutgoing)
                          Padding(
                            padding: const EdgeInsets.only(top: 2, right: 4),
                            child: Icon(
                              Icons.done_all,
                              size: 14,
                              color:
                                  chat.lastMessage.status == MessageStatus.read
                                  ? Colors.green
                                  : Colors.blue,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 12),

              // Время + бейдж непрочитанных
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _formatChatDate(chat.lastMessageAt ?? chat.updatedAt),
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  if (chat.unreadCount > 0)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        chat.unreadCount > 99
                            ? '99+'
                            : chat.unreadCount.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar(BuildContext context, Chat chat) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.grey.withOpacity(0.3),
          backgroundImage: chat.avatarUrl?.isNotEmpty == true
              ? NetworkImage(chat.avatarUrl!)
              : null,
          child: chat.avatarUrl?.isNotEmpty != true
              ? Text(
                  chat.title.isNotEmpty
                      ? chat.title
                            .split(' ')
                            .map((word) => word.isNotEmpty ? word[0] : '')
                            .take(2)
                            .join()
                      : '?',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : null,
        ),
        // Индикатор онлайн для личных чатов
        if (chat.type == ChatType.private)
          Positioned(
            bottom: 4,
            right: 4,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: _isOnline(chat) ? Colors.green : Colors.grey,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).colorScheme.surface,
                  width: 2,
                ),
              ),
            ),
          ),
      ],
    );
  }

  String _getLastMessagePreview(Message message) {
    if (message.text.isEmpty) return '📎 Файл';
    return message.text;
  }

  String _formatChatDate(DateTime date) {
    final now = DateTime.now();
    final isToday =
        date.year == now.year && date.month == now.month && date.day == now.day;
    final isYesterday =
        date.year == now.year &&
        date.month == now.month &&
        date.day == now.day - 1;

    if (isToday) {
      return DateFormat('HH:mm').format(date);
    } else if (isYesterday) {
      return 'Вчера';
    } else {
      return DateFormat('dd.MM').format(date);
    }
  }

  bool _isOnline(Chat chat) {
    // Для демо: считаем онлайн, если последнее сообщение было < 5 минут назад
    if (chat.lastMessageAt == null) return false;
    final diff = DateTime.now().difference(chat.lastMessageAt!);
    return diff.inMinutes < 5;
  }
}
