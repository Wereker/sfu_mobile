import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/core/l10n/strings.g.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/feature/announcements/presentation/bloc/announcements_bloc.dart';
import 'package:sfu/src/feature/events/presentation/bloc/events_bloc.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key, required this.onTabChange});
  final ValueChanged<int> onTabChange;

  @override
  Widget build(BuildContext context) {
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;
    final t = Translations.of(context);

    final eventsCount = context.watch<EventsBloc>().state.maybeWhen(
      success: (events) => events.length,
      orElse: () => 0,
    );
    final annCount = context.watch<AnnouncementsBloc>().state.maybeWhen(
      success: (list) => list.length,
      orElse: () => 0,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: _StatCard(
              icon: Icons.calendar_month_outlined,
              label: t.home.timetableCard,
              sub: t.home.timetableCardSub,
              cs: cs, ext: ext, tt: tt,
              onTap: () => onTabChange(1),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _StatCard(
              icon: Icons.campaign_outlined,
              label: t.home.announcementsCard,
              sub: annCount > 0 ? t.home.announcementsNew(count: annCount) : t.home.announcementsNoNew,
              cs: cs, ext: ext, tt: tt,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _StatCard(
              icon: Icons.event_outlined,
              label: t.home.eventsCard,
              sub: eventsCount > 0 ? t.home.eventsCount(count: eventsCount) : t.home.eventsNone,
              cs: cs, ext: ext, tt: tt,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.icon,
    required this.label,
    required this.sub,
    required this.cs,
    required this.ext,
    required this.tt,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final String sub;
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: cs.surface,
      borderRadius: BorderRadius.circular(AppTheme.radiusLg),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: ext.border),
            borderRadius: BorderRadius.circular(AppTheme.radiusLg),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: cs.primary, size: 20),
              const SizedBox(height: 8),
              Text(
                label,
                style: tt.labelLarge?.copyWith(
                  fontSize: 11, fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                sub,
                style: tt.bodySmall?.copyWith(
                  color: ext.textSecondary, fontSize: 10,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}