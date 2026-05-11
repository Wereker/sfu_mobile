import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/feature/chat/message/presentation/bloc/message_bloc.dart';

class MessageErrorView extends StatelessWidget {
  const MessageErrorView({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 64, height: 64,
            decoration:
            BoxDecoration(color: ext.errorBg, shape: BoxShape.circle),
            child:
            Icon(Icons.wifi_off_outlined, size: 28, color: ext.errorFg),
          ),
          const SizedBox(height: 16),
          Text('Не удалось загрузить сообщения',
              textAlign: TextAlign.center, style: tt.titleMedium),
          const SizedBox(height: 6),
          Text(message,
              textAlign: TextAlign.center,
              style: tt.bodyMedium?.copyWith(color: ext.textSecondary)),
          const SizedBox(height: 16),
          // MessageBloc не хранит chatId — повтор через Navigator
          TextButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
            label: const Text('Назад'),
          ),
        ],
      ),
    );
  }
}