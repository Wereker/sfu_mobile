import 'package:flutter/material.dart';
import 'package:sfu/src/core/theme/app_theme.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.moreLabel,
    required this.ext,
    required this.tt,
  });
  final String title;
  final String? moreLabel;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(title, style: tt.titleMedium),
          if (moreLabel != null) ...[
            const Spacer(),
            Text(
              moreLabel!,
              style: tt.labelLarge?.copyWith(
                color: AppTheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ],
      ),
    );
  }
}