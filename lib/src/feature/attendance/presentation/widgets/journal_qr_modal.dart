import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sfu/src/core/theme/app_theme.dart';

class JournalQrModal extends StatefulWidget {
  const JournalQrModal({
    super.key,
    required this.token,
    required this.lessonTitle,
    required this.group,
  });

  final String token;
  final String lessonTitle;
  final String group;

  @override
  State<JournalQrModal> createState() => _JournalQrModalState();
}

class _JournalQrModalState extends State<JournalQrModal> {
  static const _ttlSeconds = 300;
  late int _remaining;

  @override
  void initState() {
    super.initState();
    _remaining = _ttlSeconds;
    _tick();
  }

  void _tick() {
    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      setState(() => _remaining--);
      if (_remaining > 0) _tick();
    });
  }

  String get _timeLabel {
    final m = _remaining ~/ 60;
    final s = _remaining % 60;
    return '$m:${s.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final ext     = Theme.of(context).extension<AppColors>()!;
    final tt      = Theme.of(context).textTheme;
    final screenH = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        // Блюр
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(color: Colors.black.withValues(alpha: .5)),
          ),
        ),

        // Шторка
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: screenH * 0.65,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(AppTheme.radiusLg)),
            ),
            padding: EdgeInsets.fromLTRB(
              24, 16, 24,
              MediaQuery.of(context).padding.bottom + 24,
            ),
            child: Column(
              children: [
                // Ручка
                Container(
                  width: 36, height: 4,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                      color: ext.border,
                      borderRadius: BorderRadius.circular(2)),
                ),

                Text('QR для отметки', style: tt.titleMedium),
                const SizedBox(height: 4),
                Text(
                  '${widget.lessonTitle} · ${widget.group}',
                  style: tt.labelSmall?.copyWith(color: ext.textSecondary),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 20),

                // QR или «истёк»
                Expanded(
                  child: _remaining > 0
                      ? Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(AppTheme.radiusMd),
                    ),
                    child: QrImageView(
                      data: widget.token,
                      version: QrVersions.auto,
                      backgroundColor: Colors.white,
                      eyeStyle: const QrEyeStyle(
                        eyeShape: QrEyeShape.square,
                        color: Color(0xFF1C1B1F),
                      ),
                      dataModuleStyle: const QrDataModuleStyle(
                        dataModuleShape: QrDataModuleShape.square,
                        color: Color(0xFF1C1B1F),
                      ),
                    ),
                  )
                      : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.timer_off_outlined,
                          size: 48, color: ext.errorFg),
                      const SizedBox(height: 12),
                      Text('QR-код устарел', style: tt.titleMedium),
                      const SizedBox(height: 6),
                      Text('Создайте новый',
                          style: tt.bodyMedium
                              ?.copyWith(color: ext.textSecondary)),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Таймер
                if (_remaining > 0)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.timer_outlined,
                        size: 15,
                        color: _remaining < 60
                            ? ext.warningFg : ext.textTertiary,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Действителен $_timeLabel',
                        style: tt.labelSmall?.copyWith(
                          color: _remaining < 60
                              ? ext.warningFg : ext.textTertiary,
                          fontWeight: _remaining < 60
                              ? FontWeight.w600 : FontWeight.w400,
                        ),
                      ),
                    ],
                  ),

                const SizedBox(height: 12),

                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton.icon(
                    onPressed: _remaining > 0
                        ? () {
                      Clipboard.setData(
                          ClipboardData(text: widget.token));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Токен скопирован')),
                      );
                    }
                        : () => Navigator.pop(context),
                    icon: Icon(
                      _remaining > 0 ? Icons.copy : Icons.refresh,
                      size: 18,
                    ),
                    label: Text(
                      _remaining > 0 ? 'Скопировать токен' : 'Закрыть',
                    ),
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