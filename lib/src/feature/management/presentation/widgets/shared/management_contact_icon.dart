import 'package:flutter/material.dart';

class ManagementContactIcon extends StatelessWidget {
  const ManagementContactIcon({
    super.key,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Icon(icon, size: 18, color: color),
      ),
    );
  }
}