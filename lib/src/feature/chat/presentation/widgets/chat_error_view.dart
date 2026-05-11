import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/feature/chat/presentation/bloc/chat_bloc.dart';

class ChatErrorView extends StatelessWidget {
  const ChatErrorView({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

    return SliverFillRemaining(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 64, height: 64,
                decoration: BoxDecoration(
                    color: ext.errorBg, shape: BoxShape.circle),
                child: Icon(Icons.wifi_off_outlined,
                    size: 28, color: ext.errorFg),
              ),
              const SizedBox(height: 16),
              Text('Не удалось загрузить чаты',
                  textAlign: TextAlign.center,
                  style: tt.titleMedium),
              const SizedBox(height: 6),
              Text('Проверь подключение и попробуй снова',
                  textAlign: TextAlign.center,
                  style: tt.bodyMedium?.copyWith(color: ext.textSecondary)),
              const SizedBox(height: 16),
              TextButton.icon(
                onPressed: () => context
                    .read<ChatBloc>()
                    .add(const ChatEvent.loadData()),
                icon: const Icon(Icons.refresh),
                label: const Text('Повторить'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}