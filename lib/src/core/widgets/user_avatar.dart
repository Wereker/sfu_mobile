import 'package:flutter/material.dart';

/// Аватар пользователя с fallback на инициалы.
/// Если [avatarUrl] задан но изображение не грузится — показывает инициалы.
class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    required this.name,
    this.avatarUrl,
    required this.size,
    this.fontSize,
    this.onTap,
    this.badge,
    this.headers,
  });

  final String name;
  final String? avatarUrl;
  final double size;
  final double? fontSize;
  final VoidCallback? onTap;
  final Map<String, String>? headers;


  /// Виджет поверх аватара (например иконка редактирования)
  final Widget? badge;

  static const _palette = [
    Color(0xFF5C6BC0), Color(0xFF26A69A), Color(0xFFEF5350),
    Color(0xFFEC407A), Color(0xFF7E57C2), Color(0xFF29B6F6),
    Color(0xFF66BB6A), Color(0xFFFFA726), Color(0xFFFF7043),
    Color(0xFF8D6E63),
  ];

  String get _initials => name
      .split(' ')
      .where((p) => p.isNotEmpty)
      .take(2)
      .map((p) => p[0])
      .join()
      .toUpperCase();

  Color get _bg {
    int h = 0;
    for (final c in name.codeUnits) {
      h = (h * 31 + c) & 0x7FFFFFFF;
    }
    return _palette[h % _palette.length];
  }

  @override
  Widget build(BuildContext context) {
    final Widget avatar = avatarUrl != null
        ? _NetworkAvatar(
      url: avatarUrl!,
      size: size,
      fallback: _Initials(initials: _initials, bg: _bg, size: size, fontSize: fontSize),
      headers: headers,
    )
        : _Initials(initials: _initials, bg: _bg, size: size, fontSize: fontSize);

    final Widget wrapped = badge != null
        ? Stack(
      children: [
        avatar,
        Positioned(bottom: 0, right: 0, child: badge!),
      ],
    )
        : avatar;

    if (onTap != null) {
      return GestureDetector(onTap: onTap, child: wrapped);
    }
    return wrapped;
  }
}

class _NetworkAvatar extends StatefulWidget {
  const _NetworkAvatar({
    required this.url,
    required this.size,
    required this.fallback,
    required this.headers,
  });

  final String url;
  final double size;
  final Widget fallback;
  final Map<String, String>? headers;

  @override
  State<_NetworkAvatar> createState() => _NetworkAvatarState();
}

class _NetworkAvatarState extends State<_NetworkAvatar> {
  bool _hasError = false;

  @override
  Widget build(BuildContext context) {
    if (_hasError) return widget.fallback;

    return ClipOval(
      child: Image.network(
        widget.url,
        width: widget.size,
        height: widget.size,
        fit: BoxFit.cover,
        headers: widget.headers,
        errorBuilder: (_, __, ___) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) setState(() => _hasError = true);
          });
          return widget.fallback;
        },
      ),
    );
  }
}

class _Initials extends StatelessWidget {
  const _Initials({
    required this.initials,
    required this.bg,
    required this.size,
    this.fontSize,
  });

  final String initials;
  final Color bg;
  final double size;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: bg),
      alignment: Alignment.center,
      child: Text(
        initials,
        style: TextStyle(
          fontSize: fontSize ?? size * 0.38,
          fontWeight: FontWeight.w700,
          color: Colors.white,
          height: 1,
        ),
      ),
    );
  }
}