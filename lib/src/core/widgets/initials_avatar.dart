import 'package:flutter/material.dart';

class InitialsAvatar extends StatelessWidget {
  const InitialsAvatar({
    super.key,
    required this.name,
    required this.size,
  });

  final String name;
  final double size;

  static const _hues = [
    Color(0xFFFF9900), Color(0xFFFFB84D), Color(0xFFE68A00),
    Color(0xFFCC7A00), Color(0xFFFFA726), Color(0xFFFB8C00),
  ];

  Color get _bg {
    int h = 0;
    for (final c in name.codeUnits) { h = (h * 31 + c) & 0x7FFFFFFF; }
    return _hues[h % _hues.length];
  }

  String get _initials => name
      .split(' ')
      .where((p) => p.isNotEmpty)
      .take(2)
      .map((p) => p[0])
      .join()
      .toUpperCase();

  @override
  Widget build(BuildContext context) => Container(
    width: size, height: size,
    decoration: BoxDecoration(shape: BoxShape.circle, color: _bg),
    alignment: Alignment.center,
    child: Text(
      _initials.isEmpty ? '?' : _initials,
      style: TextStyle(
        fontSize: size * 0.36,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        height: 1,
      ),
    ),
  );
}