import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/app/dependency_injection/injection.dart';
import 'package:sfu/src/feature/chat/presentation/bloc/chat_bloc.dart';
import 'package:sfu/src/feature/chat/presentation/widgets/chat_app_bar.dart';
import 'package:sfu/src/feature/chat/presentation/widgets/chat_empty_view.dart';
import 'package:sfu/src/feature/chat/presentation/widgets/chat_error_view.dart';
import 'package:sfu/src/feature/chat/presentation/widgets/chat_list.dart';
import 'package:sfu/src/feature/chat/presentation/widgets/chat_skeleton.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ChatBloc>()..add(const ChatEvent.loadData()),
      child: const Scaffold(body: _ChatContent()),
    );
  }
}

class _ChatContent extends StatelessWidget {
  const _ChatContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) => state.when(
        initial: () => const CustomScrollView(
          slivers: [ChatAppBar(), ChatSkeleton()],
        ),
        loading: () => const CustomScrollView(
          slivers: [ChatAppBar(), ChatSkeleton()],
        ),
        success: (chats) => chats.isEmpty
            ? const CustomScrollView(
          slivers: [ChatAppBar(), ChatEmptyView()],
        )
            : ChatList(chats: chats),
        error: (msg) => CustomScrollView(
          slivers: [const ChatAppBar(), ChatErrorView(message: msg)],
        ),
      ),
    );
  }
}