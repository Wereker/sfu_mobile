import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  final String chatId;
  final String chatTitle;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<MessageBloc>()
        ..add(MessageEvent.getMessagesForChat(chatId)),
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

  void _onSend() {
    final text = _inputCtrl.text.trim();
    if (text.isEmpty) return;
    // TODO: SendMessageUseCase
    _inputCtrl.clear();
  }

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: MessageAppBar(chatTitle: widget.chatTitle),
      bottomNavigationBar: MessageInputBar(
        controller: _inputCtrl,
        focusNode:  _inputFocus,
        onSend:     _onSend,
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusScope.of(context).unfocus(),
        child: BlocBuilder<MessageBloc, MessageState>(
          builder: (context, state) => state.when(
            initial: () => const MessageSkeleton(),
            loading: () => const MessageSkeleton(),
            success: (messages) => MessageList(messages: messages),
            error:   (msg)      => MessageErrorView(message: msg),
          ),
        ),
      ),
    );
  }
}