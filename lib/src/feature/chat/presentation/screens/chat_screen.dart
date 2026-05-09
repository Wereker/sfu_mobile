import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:sfu/src/app/dependency_injection/injection.dart' as di;
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/core/widgets/loading_indicator_widget.dart';
import 'package:sfu/src/feature/chat/domain/entity/chat.dart';
import 'package:sfu/src/feature/chat/message/domain/entity/message.dart';
import 'package:sfu/src/feature/chat/message/presentation/screens/message_screen.dart';
import 'package:sfu/src/feature/chat/presentation/bloc/chat_bloc.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<ChatBloc>()..add(ChatEvent.loadData()),
      child: const Scaffold(body: _ChatContent()),
    );
  }
}

class _ChatContent extends StatelessWidget {
  const _ChatContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) => state.maybeWhen(
        loading: () => const _LoadingView(),
        success: (chats) => _ChatBody(chats: chats),
        error: (_) => const _ErrorView(),
        orElse: () => const _EmptyView(),
      ),
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      const _ChatAppBar(),
      const SliverFillRemaining(
        child: Center(child: LoadingIndicatorWidget()),
      ),
    ]);
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView();

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt = Theme.of(context).textTheme;

    return CustomScrollView(slivers: [
      const _ChatAppBar(),
      SliverFillRemaining(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 64, height: 64,
                  decoration: BoxDecoration(
                    color: ext.errorBg, shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.wifi_off_outlined, size: 28, color: ext.errorFg),
                ),
                const SizedBox(height: 16),
                Text('Не удалось загрузить чаты',
                    textAlign: TextAlign.center, style: tt.titleMedium),
                const SizedBox(height: 6),
                Text('Проверь подключение и попробуй снова',
                    textAlign: TextAlign.center,
                    style: tt.bodyMedium?.copyWith(color: ext.textSecondary)),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}

class _EmptyView extends StatelessWidget {
  const _EmptyView();

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt = Theme.of(context).textTheme;

    return CustomScrollView(slivers: [
      const _ChatAppBar(),
      SliverFillRemaining(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.chat_bubble_outline, size: 48, color: ext.textTertiary),
              const SizedBox(height: 12),
              Text('Чатов пока нет',
                  style: tt.bodyMedium?.copyWith(color: ext.textSecondary)),
            ],
          ),
        ),
      ),
    ]);
  }
}


class _ChatAppBar extends StatelessWidget {
  const _ChatAppBar();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt = Theme.of(context).textTheme;

    return SliverAppBar(
      pinned: true,
      floating: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      toolbarHeight: 72,
      flexibleSpace: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Чаты', style: tt.displaySmall),
                    const SizedBox(height: 2),
                    Text('Кафедра, группы, преподаватели',
                        style: tt.labelLarge?.copyWith(color: ext.textSecondary)),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 48, height: 48,
                decoration: BoxDecoration(
                  color: cs.primary,
                  borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                ),
                padding: const EdgeInsets.all(6),
                child: SvgPicture.asset('assets/images/logo_app_bar.svg'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class _ChatBody extends StatefulWidget {
  const _ChatBody({required this.chats});
  final List<Chat> chats;

  @override
  State<_ChatBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<_ChatBody> {
  String _query = '';

  List<Chat> get _filtered => _query.isEmpty
      ? widget.chats
      : widget.chats
          .where((c) => c.title.toLowerCase().contains(_query.toLowerCase()))
          .toList();

  Future<void> _onRefresh() async {
    context.read<ChatBloc>().add(ChatEvent.loadData());
    await Future.delayed(const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt = Theme.of(context).textTheme;

    return RefreshIndicator(
      color: cs.primary,
      onRefresh: _onRefresh,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusScope.of(context).unfocus(),
        child: CustomScrollView(
          slivers: [
            const _ChatAppBar(),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
                child: TextField(
                  onChanged: (v) => setState(() => _query = v),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: ext.textTertiary, size: 20),
                    hintText: 'Поиск чатов и сообщений',
                    hintStyle: tt.bodyMedium?.copyWith(color: ext.textTertiary),
                  ),
                ),
              ),
            ),

            _filtered.isEmpty
                ? SliverFillRemaining(
                    child: Center(
                      child: Text('Ничего не найдено',
                          style: tt.bodyMedium?.copyWith(color: ext.textSecondary)),
                    ),
                  )
                : SliverList.separated(
                    separatorBuilder: (_, __) => Divider(
                      height: 1,
                      indent: 72,
                      color: ext.divider,
                    ),
                    itemCount: _filtered.length,
                    itemBuilder: (_, i) => _ChatRow(
                      chat: _filtered[i],
                      cs: cs,
                      ext: ext,
                      tt: tt,
                    ),
                  ),

            SliverPadding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom + 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class _ChatRow extends StatelessWidget {
  const _ChatRow({
    required this.chat,
    required this.cs,
    required this.ext,
    required this.tt,
  });

  final Chat chat;
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  String _initials(String title) => title
      .split(' ')
      .where((w) => w.isNotEmpty)
      .take(2)
      .map((w) => w[0])
      .join()
      .toUpperCase();

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    if (date.year == now.year && date.month == now.month && date.day == now.day) {
      return DateFormat('HH:mm').format(date);
    }
    final yesterday = now.subtract(const Duration(days: 1));
    if (date.year == yesterday.year &&
        date.month == yesterday.month &&
        date.day == yesterday.day) return 'Вчера';
    return DateFormat('dd.MM').format(date);
  }

  bool _isOnline(Chat c) {
    if (c.lastMessageAt == null) return false;
    return DateTime.now().difference(c.lastMessageAt!).inMinutes < 5;
  }

  static const _hues = [
    Color(0xFFFF9900), Color(0xFFFFB84D), Color(0xFFE68A00),
    Color(0xFFCC7A00), Color(0xFFFFA726), Color(0xFFFB8C00),
  ];

  Color _avatarColor(String title) {
    int h = 0;
    for (final c in title.codeUnits) { h = (h * 31 + c) & 0x7FFFFFFF; }
    return _hues[h % _hues.length];
  }

  @override
  Widget build(BuildContext context) {
    final hasUnread = chat.unreadCount > 0;
    final date = _formatDate(chat.lastMessageAt ?? chat.updatedAt);

    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => MessageScreen(chatId: chat.id, chatTitle: chat.title),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  width: 48, height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _avatarColor(chat.title),
                    image: chat.avatarUrl != null
                        ? DecorationImage(
                            image: NetworkImage(chat.avatarUrl!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  alignment: Alignment.center,
                  child: chat.avatarUrl == null
                      ? Text(
                          _initials(chat.title),
                          style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600,
                            color: Colors.white, height: 1,
                          ),
                        )
                      : null,
                ),
                // Индикатор онлайн
                if (chat.type == ChatType.private)
                  Positioned(
                    bottom: 1, right: 1,
                    child: Container(
                      width: 12, height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _isOnline(chat) ? ext.success : ext.textTertiary,
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
                  // Название
                  Text(
                    chat.title,
                    style: tt.labelLarge?.copyWith(
                      fontWeight: hasUnread ? FontWeight.w700 : FontWeight.w600,
                      fontSize: 15,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  // Превью последнего сообщения
                  Row(
                    children: [
                      if (chat.lastMessage!.isOutgoing) ...[
                        Icon(
                          chat.lastMessage.status == MessageStatus.read
                              ? Icons.done_all
                              : Icons.done,
                          size: 14,
                          color: chat.lastMessage.status == MessageStatus.read
                              ? ext.success
                              : ext.textTertiary,
                        ),
                        const SizedBox(width: 3),
                      ],
                      Expanded(
                        child: Text(
                          chat.lastMessage.text.isEmpty
                              ? '📎 Файл'
                              : chat.lastMessage.text,
                          style: tt.bodyMedium?.copyWith(
                            fontSize: 13,
                            color: hasUnread ? ext.textPrimary : ext.textSecondary,
                            fontWeight: hasUnread
                                ? FontWeight.w500
                                : FontWeight.w400,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: 10),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  date,
                  style: tt.labelSmall?.copyWith(
                    color: hasUnread ? cs.primary : ext.textTertiary,
                    fontWeight: hasUnread ? FontWeight.w600 : FontWeight.w400,
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
                      borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      chat.unreadCount > 99 ? '99+' : '${chat.unreadCount}',
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
