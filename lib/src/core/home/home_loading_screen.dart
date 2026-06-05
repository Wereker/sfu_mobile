import 'package:flutter/material.dart';
import 'package:sfu/src/core/theme/app_theme.dart';

/// Показывается пока все основные Bloc не загрузились.
/// Имитирует структуру HomeBody через шиммеры.
class HomeLoadingScreen extends StatefulWidget {
  const HomeLoadingScreen({super.key});

  @override
  State<HomeLoadingScreen> createState() => _HomeLoadingScreenState();
}

class _HomeLoadingScreenState extends State<HomeLoadingScreen>
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
    final cs  = Theme.of(context).colorScheme;

    return Scaffold(
      body: AnimatedBuilder(
        animation: _anim,
        builder: (_, __) {
          final color = cs.onSurface.withValues(alpha: _anim.value * 0.1);
          return SafeArea(
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // AppBar shimmer
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _Box(w: 42, h: 42, r: 21, color: color),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _Box(w: 140, h: 16, r: 6, color: color),
                            const SizedBox(height: 4),
                            _Box(w: 100, h: 12, r: 6, color: color),
                          ],
                        ),
                      ),
                      _Box(w: 48, h: 48, r: AppTheme.radiusMd, color: color),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // NextClassCard shimmer
                  _Box(w: double.infinity, h: 120, r: AppTheme.radiusLg, color: color),

                  const SizedBox(height: 20),

                  // Section label
                  _Box(w: 140, h: 16, r: 6, color: color),
                  const SizedBox(height: 12),

                  // Events shimmer
                  SizedBox(
                    height: 180,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (_, __) =>
                          _Box(w: 220, h: 180, r: AppTheme.radiusLg, color: color),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Announcements label
                  _Box(w: 120, h: 16, r: 6, color: color),
                  const SizedBox(height: 12),

                  // Announcements shimmer
                  ...List.generate(3, (_) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: _Box(
                      w: double.infinity, h: 100,
                      r: AppTheme.radiusLg, color: color,
                    ),
                  )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Box extends StatelessWidget {
  const _Box({
    required this.w,
    required this.h,
    required this.r,
    required this.color,
  });

  final double w;
  final double h;
  final double r;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
    width: w, height: h,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(r),
    ),
  );
}