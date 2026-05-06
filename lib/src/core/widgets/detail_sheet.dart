import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sfu/src/core/theme/app_theme.dart';

Future<void> showDetailSheet({
  required BuildContext context,
  required Widget child,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.transparent,
    builder: (_) => _DetailSheet(child: child),
  );
}

class _DetailSheet extends StatelessWidget {
  const _DetailSheet({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final screenH = MediaQuery.of(context).size.height;
    final sheetH  = screenH * 0.68;
    final cs      = Theme.of(context).colorScheme;

    return Stack(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: Container(
              color: Colors.black.withValues(alpha: .35),
            ),
          ),
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: sheetH,
            decoration: BoxDecoration(
              color: cs.surface,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(AppTheme.radiusLg),
              ),
            ),
            child: Column(
              children: [
                // Ручка
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 6),
                  child: Container(
                    width: 36,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .extension<AppColors>()!
                          .border,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(
                      20, 8, 20,
                      MediaQuery.of(context).padding.bottom + 24,
                    ),
                    child: child,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
