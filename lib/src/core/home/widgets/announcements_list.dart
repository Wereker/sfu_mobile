import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/core/l10n/strings.g.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/feature/announcements/presentation/bloc/announcements_bloc.dart';
import 'package:sfu/src/feature/announcements/presentation/widgets/announcement_card.dart';


class AnnouncementsList extends StatelessWidget {
  const AnnouncementsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnnouncementsBloc, AnnouncementsState>(
      builder: (context, state) => state.when(
        initial: () => const _AnnouncementsShimmer(),
        loading: () => const _AnnouncementsShimmer(),
        success: (announcements) => announcements.isEmpty
            ? const _EmptyAnnouncements()
            : Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: announcements
                .map(
                  (a) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: AnnouncementCard(announcement: a),
              ),
            )
                .toList(),
          ),
        ),
        error: (message) => _AnnouncementsError(message: message),
      ),
    );
  }
}

class _EmptyAnnouncements extends StatelessWidget {
  const _EmptyAnnouncements();

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;
    final t = Translations.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Center(
        child: Text(
          t.home.noAnnouncements,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: ext.textSecondary),
        ),
      ),
    );
  }
}

class _AnnouncementsError extends StatelessWidget {
  const _AnnouncementsError({required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;
    final cs  = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: [
          Text(
            message,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: ext.textSecondary),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () => context
                .read<AnnouncementsBloc>()
                .add(const AnnouncementsEvent.load()),
            child: Text(t.common.retry,
                style: TextStyle(color: cs.primary)),
          ),
        ],
      ),
    );
  }
}

class _AnnouncementsShimmer extends StatefulWidget {
  const _AnnouncementsShimmer();

  @override
  State<_AnnouncementsShimmer> createState() =>
      _AnnouncementsShimmerState();
}

class _AnnouncementsShimmerState extends State<_AnnouncementsShimmer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);
    _anim = Tween<double>(begin: 0.3, end: 0.8).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return AnimatedBuilder(
      animation: _anim,
      builder: (_, __) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: List.generate(
            3,
                (_) => Container(
              width: double.infinity,
              height: 96,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: cs.onSurface
                    .withValues(alpha: _anim.value * 0.1),
                borderRadius:
                BorderRadius.circular(AppTheme.radiusLg),
              ),
            ),
          ),
        ),
      ),
    );
  }
}