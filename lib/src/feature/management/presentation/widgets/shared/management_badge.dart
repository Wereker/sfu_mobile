import 'package:flutter/material.dart';

class ManagementBadge extends StatelessWidget {
  const ManagementBadge({
    super.key,
    required this.label,
    required this.bg,
    required this.fg,
  });

  final String label;
  final Color bg, fg;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: TextStyle(
            fontSize: 10, fontWeight: FontWeight.w700, color: fg, height: 1),
      ),
    );
  }
}