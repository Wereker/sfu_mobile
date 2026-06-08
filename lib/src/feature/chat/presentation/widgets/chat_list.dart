import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/core/l10n/strings.g.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/feature/chat/domain/entity/chat.dart';
import 'package:sfu/src/feature/chat/presentation/bloc/chat_bloc.dart';
import 'package:sfu/src/feature/chat/presentation/widgets/chat_app_bar.dart';
import 'package:sfu/src/feature/chat/presentation/widgets/chat_row.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key, required this.chats});
  final List<Chat> chats;

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  String _query = '';

  List<Chat> get _filtered => _query.isEmpty
      ? widget.chats
      : widget.chats
      .where((c) =>
      c.title.toLowerCase().contains(_query.toLowerCase()))
      .toList();

  Future<void> _onRefresh() async {
    context.read<ChatBloc>().add(const ChatEvent.loadData());
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    final t   = Translations.of(context);
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

    return RefreshIndicator(
      color: cs.primary,
      onRefresh: _onRefresh,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusScope.of(context).unfocus(),
        child: CustomScrollView(
          slivers: [
            const ChatAppBar(),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
                child: TextField(
                  onChanged: (v) => setState(() => _query = v),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search,
                        color: ext.textTertiary, size: 20),
                    hintText: t.chat.searchHint,
                    hintStyle:
                    tt.bodyMedium?.copyWith(color: ext.textTertiary),
                  ),
                ),
              ),
            ),

            _filtered.isEmpty
                ? SliverFillRemaining(
              child: Center(
                child: Text(
                  t.common.nothingFound,
                  style: tt.bodyMedium
                      ?.copyWith(color: ext.textSecondary),
                ),
              ),
            )
                : SliverList.separated(
              separatorBuilder: (_, __) =>
                  Divider(height: 1, indent: 72, color: ext.divider),
              itemCount: _filtered.length,
              itemBuilder: (_, i) => ChatRow(chat: _filtered[i]),
            ),

            SliverPadding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom + 16),
            ),
          ],
        ),
      ),
    );
  }
}