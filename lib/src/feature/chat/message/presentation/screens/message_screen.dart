import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/app/app.dart';
import 'package:sfu/src/app/dependency_injection/injection.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/feature/chat/message/presentation/bloc/message_bloc.dart';
import 'package:sfu/src/feature/chat/message/presentation/widgets/message_app_bar.dart';
import 'package:sfu/src/feature/chat/message/presentation/widgets/message_error_view.dart';
import 'package:sfu/src/feature/chat/message/presentation/widgets/message_input_bar.dart';
import 'package:sfu/src/feature/chat/message/presentation/widgets/message_list.dart';
import 'package:sfu/src/feature/chat/message/presentation/widgets/message_skeleton.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({
    super.key,
    required this.chatId,
    this.chatTitle = '',
  });

  final int chatId;
  final String chatTitle;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
      sl<MessageBloc>()..add(MessageEvent.connect(chatId)),
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
  final _inputCtrl  = TextEditingController();
  final _inputFocus = FocusNode();

  @override
  void dispose() {
    _inputCtrl.dispose();
    _inputFocus.dispose();
    super.dispose();
  }

  void _onSend(BuildContext context) {
    final text = _inputCtrl.text.trim();
    if (text.isEmpty) return;
    context.read<MessageBloc>().add(MessageEvent.send(text));
    _inputCtrl.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MessageBloc, MessageState>(
      listener: (context, state) {
        state.maybeWhen(
          disconnected: (reason) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(reason)),
            );
            if (reason.contains('истекла')) {
              App.navigatorKey.currentState
                  ?.pushNamedAndRemoveUntil('/signIn', (_) => false);
            }
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        appBar: MessageAppBar(chatTitle: widget.chatTitle),
        bottomNavigationBar: Builder(
          builder: (ctx) => MessageInputBar(
            controller: _inputCtrl,
            focusNode: _inputFocus,
            onSend: () => _onSend(ctx),
          ),
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => FocusScope.of(context).unfocus(),
          child: BlocBuilder<MessageBloc, MessageState>(
            builder: (context, state) => state.when(
              initial: () => const MessageSkeleton(),
              loading: () => const MessageSkeleton(),
              success: (messages, _) => MessageList(messages: messages),
              error: (msg) => MessageErrorView(message: msg),
              disconnected: (reason) => _DisconnectedView(
                reason: reason,
                chatId: null, // chatId хранится в Bloc
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DisconnectedView extends StatelessWidget {
  const _DisconnectedView({required this.reason, required this.chatId});
  final String reason;
  final int? chatId;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 64, height: 64,
              decoration:
              BoxDecoration(color: ext.warningBg, shape: BoxShape.circle),
              child: Icon(Icons.wifi_off, size: 28, color: ext.warningFg),
            ),
            const SizedBox(height: 12),
            Text(reason,
                textAlign: TextAlign.center, style: tt.bodyMedium),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back, size: 18),
              label: const Text('Назад'),
            ),
          ],
        ),
      ),
    );
  }
}