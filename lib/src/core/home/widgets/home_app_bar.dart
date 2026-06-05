import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/core/widgets/user_avatar.dart';
import 'package:sfu/src/feature/profile/presentation/bloc/profile_bloc.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt  = Theme.of(context).textTheme;
    final subtitle = DateFormat('EEEE, d MMMM', 'ru').format(DateTime.now());

    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          loading: () => true,
          initial: () => true,
          orElse: () => false,
        );
        final user = state.maybeWhen(
          success: (u) => u,
          orElse: () => null,
        );

        return SliverAppBar(
          pinned: true,
          floating: false,
          expandedHeight: 0,
          toolbarHeight: 72,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Аватар
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/profile'),
                    child: isLoading
                        ? Container(
                      width: 42, height: 42,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: cs.surfaceContainerHighest,
                      ),
                      child: Center(
                        child: SizedBox(
                          width: 18, height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: cs.primary,
                          ),
                        ),
                      ),
                    )
                        : UserAvatar(
                      name: user?.fullName ?? '?',
                      userId: user?.id,
                      size: 42,
                      fontSize: 14,
                      avatarVersion: user?.updatedAt.millisecondsSinceEpoch,
                    ),
                  ),
                  const SizedBox(width: 10),

                  // Имя + дата
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        isLoading
                            ? _ShimmerLine(width: 140, height: 16, cs: cs)
                            : Text(
                          user != null
                              ? 'Привет, ${user.firstName}'
                              : 'Привет!',
                          style: tt.displaySmall,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          subtitle,
                          style: tt.labelLarge?.copyWith(
                              color: ext.textSecondary),
                        ),
                      ],
                    ),
                  ),

                  // Лого
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
      },
    );
  }
}

class _ShimmerLine extends StatefulWidget {
  const _ShimmerLine({required this.width, required this.height, required this.cs});
  final double width;
  final double height;
  final ColorScheme cs;

  @override
  State<_ShimmerLine> createState() => _ShimmerLineState();
}

class _ShimmerLineState extends State<_ShimmerLine>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
    _anim = Tween<double>(begin: 0.3, end: 0.7).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() { _ctrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: _anim,
    builder: (_, __) => Container(
      width: widget.width, height: widget.height,
      decoration: BoxDecoration(
        color: widget.cs.onSurface.withValues(alpha: _anim.value * 0.15),
        borderRadius: BorderRadius.circular(6),
      ),
    ),
  );
}