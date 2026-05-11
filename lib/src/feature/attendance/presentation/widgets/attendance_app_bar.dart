import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sfu/src/core/theme/app_theme.dart';

class AttendanceAppBar extends StatelessWidget {
  const AttendanceAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;

    return SliverAppBar(
      pinned: true,
      floating: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      toolbarHeight: 72,
      flexibleSpace: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Журнал', style: tt.displaySmall),
                    const SizedBox(height: 2),
                    Text('Посещаемость',
                        style: tt.labelLarge?.copyWith(color: ext.textSecondary)),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 48, height: 48,
                decoration: BoxDecoration(
                  color: cs.primary,
                  borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                ),
                padding: const EdgeInsets.all(6),
                child: SvgPicture.asset('assets/images/logo_app_bar.svg'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}