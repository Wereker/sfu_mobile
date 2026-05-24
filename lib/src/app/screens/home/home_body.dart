import 'package:flutter/material.dart';
import 'package:sfu/src/core/theme/app_theme.dart';

import 'widgets/home_app_bar.dart';
import 'widgets/next_class_card.dart';
import 'widgets/quick_actions.dart';
import 'widgets/section_header.dart';
import 'widgets/events_row.dart';
import 'widgets/announcements_list.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key, required this.onTabChange});
  final ValueChanged<int> onTabChange;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt = Theme.of(context).textTheme;

    return CustomScrollView(
      slivers: [
        const HomeAppBar(),
        SliverPadding(
          padding: const EdgeInsets.only(bottom: 24),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 4),
              const NextClassCard(),
              const SizedBox(height: 12),
              QuickActions(onTabChange: onTabChange),
              const SizedBox(height: 20),
              SectionHeader(
                title: 'События кафедры',
                moreLabel: 'Все',
                ext: ext,
                tt: tt,
              ),
              const SizedBox(height: 8),
              const EventsRow(),
              const SizedBox(height: 20),
              SectionHeader(title: 'Объявления', ext: ext, tt: tt),
              const SizedBox(height: 8),
              const AnnouncementsList(),
            ]),
          ),
        ),
      ],
    );
  }
}