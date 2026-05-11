import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sfu/src/core/theme/app_theme.dart';

class ShimmerBox extends StatelessWidget {
  const ShimmerBox({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius,
    this.isCircle = false,
  });

  final double  width;
  final double  height;
  final double? borderRadius;
  final bool    isCircle;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Shimmer.fromColors(
      baseColor: isDark
          ? const Color(0xFF2D2B4E)
          : const Color(0xFFE5E7EB),
      highlightColor: isDark
          ? const Color(0xFF3F3D6B)
          : const Color(0xFFF9FAFB),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: isCircle
              ? null
              : BorderRadius.circular(borderRadius ?? AppTheme.radiusSm),
        ),
      ),
    );
  }
}