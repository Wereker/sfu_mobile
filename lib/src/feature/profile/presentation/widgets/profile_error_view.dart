import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:sfu/src/feature/profile/presentation/widgets/profile_app_bar.dart';

class ProfileErrorView extends StatelessWidget {
  const ProfileErrorView({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

    return CustomScrollView(
      slivers: [
        const ProfileAppBar(),
        SliverFillRemaining(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 64, height: 64,
                  decoration: BoxDecoration(
                    color: ext.errorBg,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.wifi_off_outlined,
                      size: 28, color: ext.errorFg),
                ),
                const SizedBox(height: 16),
                Text(
                  'Не удалось загрузить профиль',
                  style: tt.titleMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  message,
                  style: tt.bodyMedium?.copyWith(color: ext.textSecondary),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                TextButton.icon(
                  onPressed: () => context
                      .read<ProfileBloc>()
                      .add(const ProfileEvent.loadData()),
                  icon: const Icon(Icons.refresh),
                  label: const Text('Повторить'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}