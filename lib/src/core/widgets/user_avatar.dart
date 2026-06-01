import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sfu/src/app/dependency_injection/injection.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    required this.name,
    this.userId,
    required this.size,
    this.fontSize,
    this.onTap,
    this.badge,
    this.localImageBytes,
    this.avatarVersion,
  });

  final String name;
  final int? userId;
  final double size;
  final double? fontSize;
  final VoidCallback? onTap;
  final Widget? badge;
  final Uint8List? localImageBytes;
  final int? avatarVersion;

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
      .map((p) => p[0].toUpperCase())
      .join();

  Color get _bg {
    int h = 0;
    for (final c in name.codeUnits) {
      h = (h * 31 + c) & 0x7FFFFFFF;
    }
    return _palette[h % _palette.length];
  }

  static void clearCacheForUser(int userId) =>
      _RemoteAvatarState._cache.remove(userId);

  static void clearAllCache() => _RemoteAvatarState._cache.clear();

  @override
  Widget build(BuildContext context) {
    final fallback = _Initials(
      initials: _initials,
      bg: _bg,
      size: size,
      fontSize: fontSize,
    );

    Widget avatar;

    if (localImageBytes != null) {
      avatar = ClipOval(
        child: Image.memory(
          localImageBytes!,
          width: size,
          height: size,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => fallback,
        ),
      );
    } else if (userId != null) {
      avatar = _RemoteAvatar(
        key: ValueKey('avatar_${userId}_${avatarVersion ?? 0}'),
        userId: userId!,
        size: size,
        fallback: fallback,
      );
    } else {
      avatar = fallback;
    }

    final Widget wrapped = badge != null
        ? Stack(
      clipBehavior: Clip.none,
      children: [
        avatar,
        Positioned(bottom: 0, right: 0, child: badge!),
      ],
    )
        : avatar;

    return onTap != null
        ? GestureDetector(onTap: onTap, child: wrapped)
        : wrapped;
  }
}


class _RemoteAvatar extends StatefulWidget {
  const _RemoteAvatar({
    super.key,
    required this.userId,
    required this.size,
    required this.fallback,
  });

  final int userId;
  final double size;
  final Widget fallback;

  @override
  State<_RemoteAvatar> createState() => _RemoteAvatarState();
}

class _RemoteAvatarState extends State<_RemoteAvatar> {
  static final _cache = <int, Uint8List>{};

  Uint8List? _bytes;
  bool _loading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _cache.remove(widget.userId);
    _load();
  }

  Future<void> _load() async {
    if (_cache.containsKey(widget.userId)) {
      if (mounted) {
        setState(() {
          _bytes = _cache[widget.userId];
          _loading = false;
        });
      }
      return;
    }

    try {
      final dio = sl<Dio>(instanceName: 'authorizedDio');
      final response = await dio.get<List<int>>(
        '/users/${widget.userId}/avatar',
        options: Options(responseType: ResponseType.bytes),
      );

      final data = response.data;
      if (data == null || data.isEmpty) {
        if (mounted) setState(() { _hasError = true; _loading = false; });
        return;
      }

      final bytes = Uint8List.fromList(data);
      _cache[widget.userId] = bytes;

      if (mounted) {
        setState(() {
          _bytes = bytes;
          _loading = false;
        });
      }
    } catch (_) {
      if (mounted) {
        setState(() {
          _hasError = true;
          _loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return SizedBox(width: widget.size, height: widget.size);
    }

    if (_hasError || _bytes == null || _bytes!.isEmpty) {
      return widget.fallback;
    }

    return ClipOval(
      child: Image.memory(
        _bytes!,
        width: widget.size,
        height: widget.size,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => widget.fallback,
      ),
    );
  }
}

// ── Инициалы ────────────────────────────────────────────────────────────────

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