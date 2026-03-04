import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sfu/src/app/dependency_injection/injection.dart' as di;
import 'package:sfu/src/core/localization/app_localizations.dart';
import 'package:sfu/src/core/widgets/loading_indicator_widget.dart';
import 'package:sfu/src/feature/chat/domain/entity/chat/chat.dart';
import 'package:sfu/src/feature/chat/domain/entity/message/message.dart';
import 'package:sfu/src/feature/chat/presentation/bloc/chat_bloc.dart';

part '../widgets/chat_content.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => di.sl<ChatBloc>()..add(ChatEvent.loadData()),
      child: Scaffold(
        body: _ChatContent(),
      ),
    );
  }
}