import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/core/widgets/loading_indicator_widget.dart';
import 'package:sfu/src/feature/timetable/presentation/bloc/timetable_bloc.dart';
import 'package:sfu/src/feature/timetable/presentation/widgets/timetable_app_bar.dart';
import 'package:sfu/src/feature/timetable/presentation/widgets/timetable_body.dart';

class TimetableContent extends StatelessWidget {
  const TimetableContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimetableBloc, TimetableState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const LoadingView(),
          success: (timetable) => TimetableBody(timetable: timetable),
          error: (_) => const ErrorView(),
          orElse: () => const EmptyView(),
        );
      },
    );
  }
}

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).unfocus(),
      child: CustomScrollView(
        slivers: [
          TimetableAppBar(target: ''),
          const SliverFillRemaining(
            child: Center(child: LoadingIndicatorWidget()),
          ),
        ],
      ),
    );
  }
}

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt = Theme.of(context).textTheme;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).unfocus(),
      child: CustomScrollView(
        slivers: [
          TimetableAppBar(target: ''),
          SliverFillRemaining(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: ext.errorBg,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.wifi_off_outlined,
                        size: 28,
                        color: ext.errorFg,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Не удалось загрузить расписание',
                      textAlign: TextAlign.center,
                      style: tt.titleMedium,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Проверь подключение и попробуй снова',
                      textAlign: TextAlign.center,
                      style: tt.bodyMedium?.copyWith(color: ext.textSecondary),
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
}

class EmptyView extends StatelessWidget {
  const EmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt = Theme.of(context).textTheme;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).unfocus(),
      child: CustomScrollView(
        slivers: [
          TimetableAppBar(target: ''),
          SliverFillRemaining(
            child: Center(
              child: Text(
                'Расписание не найдено',
                style: tt.bodyMedium?.copyWith(color: ext.textSecondary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
