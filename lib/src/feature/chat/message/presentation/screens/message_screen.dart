import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sfu/src/core/localization/app_localizations.dart';
import 'package:sfu/src/core/widgets/loading_indicator_widget.dart';
import 'package:sfu/src/feature/chat/message/domain/entity/message.dart';
import 'package:sfu/src/feature/chat/message/presentation/bloc/message_bloc.dart';
import 'package:sfu/src/app/dependency_injection/injection.dart' as di;

part '../widgets/message_content.dart';

class MessageScreen extends StatelessWidget {
  final String chatId;

  const MessageScreen({super.key, required this.chatId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          di.sl<MessageBloc>()..add(MessageEvent.getMessagesForChat(chatId)),
      child: Scaffold(
        appBar: AppBar(),
        body: _MessageContent(),
        bottomSheet: _MessageTextField(context),
      ),
    );
  }
}
