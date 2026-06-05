import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/feature/events/presentation/bloc/events_bloc.dart';

import '../../../../feature/events/presentation/widgets/event_card.dart';

class EventsRow extends StatelessWidget {
  const EventsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventsBloc, EventsState>(
      builder: (context, state) {
        return SizedBox(
          height: 190,
          child: state.maybeWhen(
            loading: () => _EventsShimmer(),
            success: (events) => events.isEmpty
                ? const _EmptyEvents()
                : ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemCount: events.length,
              itemBuilder: (_, i) => EventCard(event: events[i]),
            ),
            orElse: () => _EventsShimmer(),
          ),
        );
      },
    );
  }
}

class _EventsShimmer extends StatefulWidget {
  @override
  State<_EventsShimmer> createState() => _EventsShimmerState();
}

class _EventsShimmerState extends State<_EventsShimmer>
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
      builder: (_, __) => ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 3,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (_, __) => Container(
          width: 160,
          decoration: BoxDecoration(
            color: cs.onSurface.withValues(alpha: _anim.value * 0.1),
            borderRadius: BorderRadius.circular(AppTheme.radiusLg),
          ),
        ),
      ),
    );
  }
}

class _EmptyEvents extends StatelessWidget {
  const _EmptyEvents();

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;
    return Center(
      child: Text(
        'Нет событий',
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: ext.textSecondary),
      ),
    );
  }
}