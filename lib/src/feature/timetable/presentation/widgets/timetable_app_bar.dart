import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:sfu/src/core/theme/app_theme.dart';

class TimetableAppBar extends StatelessWidget {
  const TimetableAppBar({super.key, required this.target});
  final String target;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt = Theme.of(context).textTheme;

    final today = DateTime.now();
    final subtitle = DateFormat('EEEE, d MMMM', 'ru').format(today);

    return SliverAppBar(
      pinned: true,
      floating: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      expandedHeight: 72,
      flexibleSpace: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Заголовок + подзаголовок
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Расписание', style: tt.displaySmall),
                    const SizedBox(height: 2),
                    Text(
                      target.isNotEmpty ? target : subtitle,
                      style: tt.labelLarge?.copyWith(color: ext.textSecondary),
                    ),
                  ],
                ),
              ),
              Container(
                width: 48,
                height: 48,
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