import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sfu/src/app/dependency_injection/injection.dart' as di;
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/core/widgets/loading_indicator_widget.dart';
import 'package:sfu/src/feature/chat/message/domain/entity/message.dart';
import 'package:sfu/src/feature/chat/message/presentation/bloc/message_bloc.dart';


class MessageScreen extends StatelessWidget {
  const MessageScreen({
    super.key,
    required this.chatId,
    this.chatTitle = '',
  });

  final String chatId;
  final String chatTitle;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          di.sl<MessageBloc>()..add(MessageEvent.getMessagesForChat(chatId)),
      child: _MessageScaffold(chatTitle: chatTitle),
    );
  }
}


class _MessageScaffold extends StatefulWidget {
  const _MessageScaffold({required this.chatTitle});
  final String chatTitle;

  @override
  State<_MessageScaffold> createState() => _MessageScaffoldState();
}

class _MessageScaffoldState extends State<_MessageScaffold> {
  final TextEditingController _inputCtrl = TextEditingController();
  final FocusNode _inputFocus = FocusNode();

  @override
  void dispose() {
    _inputCtrl.dispose();
    _inputFocus.dispose();
    super.dispose();
  }

  void _onSend() {
    final text = _inputCtrl.text.trim();
    if (text.isEmpty) return;
    // TODO: подключить SendMessageUseCase когда появится
    _inputCtrl.clear();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: cs.primary),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0,
        title: Row(
          children: [
            // Аватар-заглушка в AppBar
            _InitialsAvatar(name: widget.chatTitle, size: 36, primary: cs.primary),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.chatTitle,
                    style: tt.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'в сети',
                    style: tt.labelSmall?.copyWith(color: ext.success, height: 1.2),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: ext.textSecondary),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(height: 1, color: ext.border),
        ),
      ),

      bottomNavigationBar: _InputBar(
        controller: _inputCtrl,
        focusNode: _inputFocus,
        onSend: _onSend,
        cs: cs,
        ext: ext,
        tt: tt,
      ),

      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusScope.of(context).unfocus(),
        child: BlocBuilder<MessageBloc, MessageState>(
          builder: (context, state) => state.maybeWhen(
            loading: () => const Center(child: LoadingIndicatorWidget()),
            success: (messages) => _MessageList(messages: messages, cs: cs, ext: ext, tt: tt),
            error: (_) => _ErrorBody(ext: ext, tt: tt),
            orElse: () => const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}

class _MessageList extends StatelessWidget {
  const _MessageList({
    required this.messages,
    required this.cs,
    required this.ext,
    required this.tt,
  });

  final List<Message> messages;
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  // Показывать ли аватар: первое входящее в серии от одного отправителя
  bool _showAvatar(int index) {
    if (messages[index].isOutgoing) return false;
    if (index == 0) return true;
    return messages[index - 1].isOutgoing ||
        messages[index - 1].senderId != messages[index].senderId;
  }

  // Нужен ли разделитель дней между [index-1] и [index]
  bool _showDateDivider(int index) {
    if (index == 0) return true;
    final a = messages[index - 1].sentAt;
    final b = messages[index].sentAt;
    return a.year != b.year || a.month != b.month || a.day != b.day;
  }

  @override
  Widget build(BuildContext context) {
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
        // reverse: индекс 0 = последнее сообщение
        final realIndex = messages.length - 1 - i;
        final msg = messages[realIndex];
        final showAvatar = _showAvatar(realIndex);
        final showDate = _showDateDivider(realIndex);

        return Column(
          children: [
            if (showDate) _DateDivider(date: msg.sentAt, ext: ext, tt: tt),
            _MessageBubble(
              message: msg,
              showAvatar: showAvatar,
              cs: cs,
              ext: ext,
              tt: tt,
            ),
          ],
        );
      },
    );
  }
}

// ════════════════════════════════════════════════════════════
// Пузырёк сообщения — Telegram-стиль
// ════════════════════════════════════════════════════════════
class _MessageBubble extends StatelessWidget {
  const _MessageBubble({
    required this.message,
    required this.showAvatar,
    required this.cs,
    required this.ext,
    required this.tt,
  });

  final Message message;
  final bool showAvatar;
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    final isOut = message.isOutgoing;

    // Исходящий: primary с 15% opacity; входящий: surface с border
    final bubbleColor = isOut ? cs.primary.withValues(alpha: .15) : cs.surface;
    final bubbleBorder = isOut ? null : Border.all(color: ext.border);

    // Скругление хвостика: у исходящих — нижний правый, у входящих — нижний левый
    final radius = BorderRadius.only(
      topLeft: const Radius.circular(16),
      topRight: const Radius.circular(16),
      bottomLeft: Radius.circular(isOut ? 16 : 4),
      bottomRight: Radius.circular(isOut ? 4 : 16),
    );

    return Padding(
      padding: EdgeInsets.only(
        top: 2, bottom: 2,
        left: isOut ? 56 : 0,
        right: isOut ? 0 : 56,
      ),
      child: Row(
        mainAxisAlignment: isOut ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Аватар входящего
          if (!isOut)
            SizedBox(
              width: 32,
              child: showAvatar
                  ? _InitialsAvatar(
                      name: message.senderId,
                      size: 28,
                      primary: cs.primary,
                    )
                  : null,
            ),

          if (!isOut) const SizedBox(width: 6),

          // Пузырёк
          Flexible(
            child: GestureDetector(
              onLongPress: () => _copyText(context, message.text),
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
                    // Текст
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        message.text,
                        style: tt.bodyLarge?.copyWith(fontSize: 15),
                      ),
                    ),

                    const SizedBox(height: 3),

                    // Время + статус
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (message.isEdited) ...[
                          Text('изм. ',
                              style: tt.labelSmall?.copyWith(
                                  color: ext.textTertiary, fontSize: 10)),
                        ],
                        Text(
                          DateFormat('HH:mm').format(message.sentAt),
                          style: tt.labelSmall?.copyWith(
                              color: ext.textTertiary, fontSize: 10),
                        ),
                        if (isOut) ...[
                          const SizedBox(width: 4),
                          _StatusIcon(status: message.status, ext: ext),
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

  void _copyText(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Скопировано')),
    );
  }
}

// ════════════════════════════════════════════════════════════
// Иконка статуса сообщения (sent / delivered / read)
// ════════════════════════════════════════════════════════════
class _StatusIcon extends StatelessWidget {
  const _StatusIcon({required this.status, required this.ext});
  final MessageStatus status;
  final AppColors ext;

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case MessageStatus.sent:
        return Icon(Icons.done, size: 14, color: ext.textTertiary);
      case MessageStatus.delivered:
        return Icon(Icons.done_all, size: 14, color: ext.textTertiary);
      case MessageStatus.read:
        return Icon(Icons.done_all, size: 14, color: ext.success);
    }
  }
}

// ════════════════════════════════════════════════════════════
// Разделитель дней (как в Telegram)
// ════════════════════════════════════════════════════════════
class _DateDivider extends StatelessWidget {
  const _DateDivider({required this.date, required this.ext, required this.tt});
  final DateTime date;
  final AppColors ext;
  final TextTheme tt;

  String _label() {
    final now = DateTime.now();
    if (date.year == now.year && date.month == now.month && date.day == now.day) {
      return 'Сегодня';
    }
    final yesterday = now.subtract(const Duration(days: 1));
    if (date.year == yesterday.year &&
        date.month == yesterday.month &&
        date.day == yesterday.day) return 'Вчера';
    return DateFormat('d MMMM', 'ru').format(date);
  }

  @override
  Widget build(BuildContext context) {
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
              color: ext.textSecondary,
              fontSize: 11,
            ),
          ),
        ),
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════
// Поле ввода (прилипает к низу экрана)
// ════════════════════════════════════════════════════════════
class _InputBar extends StatefulWidget {
  const _InputBar({
    required this.controller,
    required this.focusNode,
    required this.onSend,
    required this.cs,
    required this.ext,
    required this.tt,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback onSend;
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  @override
  State<_InputBar> createState() => _InputBarState();
}

class _InputBarState extends State<_InputBar> {
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      final has = widget.controller.text.trim().isNotEmpty;
      if (has != _hasText) setState(() => _hasText = has);
    });
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom +
        MediaQuery.of(context).padding.bottom;

    return Container(
      padding: EdgeInsets.fromLTRB(12, 8, 12, bottom + 8),
      decoration: BoxDecoration(
        color: widget.cs.surface,
        border: Border(top: BorderSide(color: widget.ext.border)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Поле
          Expanded(
            child: Container(
              constraints: const BoxConstraints(maxHeight: 120),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                border: Border.all(color: widget.ext.border),
              ),
              child: TextField(
                controller: widget.controller,
                focusNode: widget.focusNode,
                maxLines: null,
                minLines: 1,
                textInputAction: TextInputAction.newline,
                style: widget.tt.bodyLarge?.copyWith(fontSize: 15),
                decoration: InputDecoration(
                  hintText: 'Сообщение…',
                  hintStyle: widget.tt.bodyMedium?.copyWith(
                      color: widget.ext.textTertiary),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14, vertical: 10),
                  isDense: true,
                ),
              ),
            ),
          ),

          const SizedBox(width: 8),

          // Кнопка отправки
          AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _hasText ? widget.cs.primary : widget.ext.divider,
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: _hasText ? widget.onSend : null,
              icon: Icon(
                Icons.send_rounded,
                size: 18,
                color: _hasText ? widget.cs.onPrimary : widget.ext.textTertiary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════
// Ошибка загрузки
// ════════════════════════════════════════════════════════════
class _ErrorBody extends StatelessWidget {
  const _ErrorBody({required this.ext, required this.tt});
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 64, height: 64,
            decoration: BoxDecoration(color: ext.errorBg, shape: BoxShape.circle),
            child: Icon(Icons.wifi_off_outlined, size: 28, color: ext.errorFg),
          ),
          const SizedBox(height: 16),
          Text('Не удалось загрузить сообщения',
              textAlign: TextAlign.center, style: tt.titleMedium),
          const SizedBox(height: 6),
          Text('Потяни вниз, чтобы обновить',
              textAlign: TextAlign.center,
              style: tt.bodyMedium?.copyWith(color: ext.textSecondary)),
        ],
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════
// Аватар с инициалами (детерминированный цвет)
// ════════════════════════════════════════════════════════════
class _InitialsAvatar extends StatelessWidget {
  const _InitialsAvatar({
    required this.name,
    required this.size,
    required this.primary,
  });

  final String name;
  final double size;
  final Color primary;

  static const _hues = [
    Color(0xFFFF9900), Color(0xFFFFB84D), Color(0xFFE68A00),
    Color(0xFFCC7A00), Color(0xFFFFA726), Color(0xFFFB8C00),
  ];

  Color get _bg {
    int h = 0;
    for (final c in name.codeUnits) { h = (h * 31 + c) & 0x7FFFFFFF; }
    return _hues[h % _hues.length];
  }

  String get _initials => name
      .split(' ')
      .where((p) => p.isNotEmpty)
      .take(2)
      .map((p) => p[0])
      .join()
      .toUpperCase();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size, height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: _bg),
      alignment: Alignment.center,
      child: Text(
        _initials.isEmpty ? '?' : _initials,
        style: TextStyle(
          fontSize: size * 0.36,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          height: 1,
        ),
      ),
    );
  }
}
