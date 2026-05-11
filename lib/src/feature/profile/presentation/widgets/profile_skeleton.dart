import 'package:flutter/material.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/core/widgets/shimmer_box.dart';
import 'package:sfu/src/feature/profile/presentation/widgets/profile_app_bar.dart';

class ProfileSkeleton extends StatelessWidget {
  const ProfileSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const ProfileAppBar(),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              // Шапка профиля
              const _ProfileHeaderSkeleton(),
              const SizedBox(height: 24),

              // Секция «Контакты»
              const _SectionLabelSkeleton(),
              const SizedBox(height: 8),
              const _ContactCardSkeleton(),
              const SizedBox(height: 24),

              // Секция «Настройки»
              const _SectionLabelSkeleton(),
              const SizedBox(height: 8),
              const _ToggleCardSkeleton(rows: 2),
              const SizedBox(height: 24),

              // Секция «Уведомления»
              const _SectionLabelSkeleton(),
              const SizedBox(height: 8),
              const _ToggleCardSkeleton(rows: 3),
              const SizedBox(height: 32),

              // Кнопка выхода
              const ShimmerBox(
                  width: double.infinity, height: 48, borderRadius: 12),
            ]),
          ),
        ),
      ],
    );
  }
}

// ── Шапка с аватаром и мета-данными ─────────────────────────
class _ProfileHeaderSkeleton extends StatelessWidget {
  const _ProfileHeaderSkeleton();

  @override
  Widget build(BuildContext context) {
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;

    return Container(
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        border: Border.all(color: ext.border),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Аватар
          const ShimmerBox(width: 64, height: 64, isCircle: true),
          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                // Имя
                ShimmerBox(width: 180, height: 16, borderRadius: 4),
                SizedBox(height: 8),
                // Бейдж роли
                ShimmerBox(width: 90, height: 22, borderRadius: 8),
                SizedBox(height: 12),
                // Мета-строки
                ShimmerBox(width: double.infinity, height: 12, borderRadius: 4),
                SizedBox(height: 6),
                ShimmerBox(width: 160, height: 12, borderRadius: 4),
                SizedBox(height: 6),
                ShimmerBox(width: 200, height: 12, borderRadius: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Метка секции ─────────────────────────────────────────────
class _SectionLabelSkeleton extends StatelessWidget {
  const _SectionLabelSkeleton();

  @override
  Widget build(BuildContext context) =>
      const ShimmerBox(width: 100, height: 16, borderRadius: 4);
}

// ── Карточка контактов ───────────────────────────────────────
class _ContactCardSkeleton extends StatelessWidget {
  const _ContactCardSkeleton();

  @override
  Widget build(BuildContext context) {
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;

    return Container(
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        border: Border.all(color: ext.border),
      ),
      child: Column(
        children: [
          _ContactRowSkeleton(isLast: false, ext: ext),
          Divider(height: 1, color: ext.divider, indent: 16),
          _ContactRowSkeleton(isLast: false, ext: ext),
          Divider(height: 1, color: ext.divider, indent: 16),
          _ContactRowSkeleton(isLast: true, ext: ext),
        ],
      ),
    );
  }
}

class _ContactRowSkeleton extends StatelessWidget {
  const _ContactRowSkeleton({required this.isLast, required this.ext});
  final bool isLast;
  final AppColors ext;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Row(
        children: [
          // Иконка
          ShimmerBox(width: 18, height: 18, isCircle: true),
          const SizedBox(width: 12),
          // Лейбл + значение
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerBox(width: 60, height: 11, borderRadius: 3),
                SizedBox(height: 5),
                ShimmerBox(width: 140, height: 14, borderRadius: 4),
              ],
            ),
          ),
          // Кнопка редактирования
          const ShimmerBox(width: 32, height: 32, isCircle: true),
        ],
      ),
    );
  }
}

// ── Карточка с переключателями (настройки / уведомления) ─────
class _ToggleCardSkeleton extends StatelessWidget {
  const _ToggleCardSkeleton({required this.rows});
  final int rows;

  @override
  Widget build(BuildContext context) {
    final cs  = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;

    return Container(
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        border: Border.all(color: ext.border),
      ),
      child: Column(
        children: List.generate(rows, (i) {
          final isLast = i == rows - 1;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 14, vertical: 10),
                child: Row(
                  children: const [
                    ShimmerBox(width: 18, height: 18, isCircle: true),
                    SizedBox(width: 12),
                    Expanded(
                      child: ShimmerBox(
                          width: 120, height: 14, borderRadius: 4),
                    ),
                    ShimmerBox(width: 44, height: 24, borderRadius: 12),
                  ],
                ),
              ),
              if (!isLast) Divider(height: 1, color: ext.divider, indent: 16),
            ],
          );
        }),
      ),
    );
  }
}