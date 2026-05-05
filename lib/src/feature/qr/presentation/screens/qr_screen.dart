import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/core/utils/qr_scanner.dart';


class QrScreen extends StatefulWidget {
  const QrScreen({super.key});

  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  _ScanFeedback? _feedback;

  // Заглушка истории — заменить на реальный источник данных
  // когда появится фича attendance history
  final List<_AttendanceRecord> _history = const [
    _AttendanceRecord(subject: 'Машинное обучение',  time: 'Сегодня · 10:32'),
    _AttendanceRecord(subject: 'Базы данных',         time: 'Вчера · 13:02'),
    _AttendanceRecord(subject: 'Линейная алгебра',    time: '3 мая · 08:35'),
  ];

  Future<void> _onScan() async {
    final result = await QRScannerUtils.scan(
      context: context,
      allowFlash: true,
      autoCloseDelay: const Duration(milliseconds: 800),
    );

    if (!mounted) return;

    switch (result.status) {
      case QRScannerStatus.success:
        setState(() => _feedback = _ScanFeedback.success(result.value!));
        // TODO: отправить result.value на сервер посещаемости
        break;
      case QRScannerStatus.permissionDenied:
        setState(() => _feedback = const _ScanFeedback.permissionDenied());
        break;
      case QRScannerStatus.error:
        setState(() => _feedback = const _ScanFeedback.error());
        break;
      case QRScannerStatus.cancelled:
        // Пользователь закрыл — ничего не показываем
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt = Theme.of(context).textTheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _QrAppBar(cs: cs, ext: ext, tt: tt),

          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
            sliver: SliverList(
              delegate: SliverChildListDelegate([

                if (_feedback != null) ...[
                  _FeedbackBanner(feedback: _feedback!, ext: ext, tt: tt),
                  const SizedBox(height: 12),
                ],

                _ScannerCard(onScan: _onScan, cs: cs, ext: ext, tt: tt),

                const SizedBox(height: 24),
                _SectionHeader(title: 'Последние отметки', ext: ext, tt: tt),
                const SizedBox(height: 8),
                ..._history.map(
                  (r) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: _HistoryCard(record: r, cs: cs, ext: ext, tt: tt),
                  ),
                ),

              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _QrAppBar extends StatelessWidget {
  const _QrAppBar({required this.cs, required this.ext, required this.tt});
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      toolbarHeight: 72,
      flexibleSpace: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Логотип
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Посещаемость', style: tt.displaySmall),
                    const SizedBox(height: 2),
                    Text(
                      'Отметка через QR-код',
                      style: tt.labelLarge?.copyWith(color: ext.textSecondary),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: cs.primary,
                  borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                ),
                padding: const EdgeInsets.all(6),
                child: SvgPicture.asset('assets/images/logo_app_bar.svg'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ScannerCard extends StatelessWidget {
  const _ScannerCard({
    required this.onScan,
    required this.cs,
    required this.ext,
    required this.tt,
  });

  final VoidCallback onScan;
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        border: Border.all(color: ext.border),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Подсказка
          Text(
            'НАВЕДИТЕ КАМЕРУ НА QR-КОД ПРЕПОДАВАТЕЛЯ',
            style: tt.labelSmall?.copyWith(
              color: ext.textSecondary,
              letterSpacing: 0.6,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 16),

          // QR-viewfinder
          _QrViewfinder(primary: cs.primary),

          const SizedBox(height: 20),

          // Кнопка
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              onPressed: onScan,
              icon: const Icon(Icons.qr_code_scanner_outlined, size: 20),
              label: const Text('Сканировать QR'),
            ),
          ),
        ],
      ),
    );
  }
}


class _QrViewfinder extends StatelessWidget {
  const _QrViewfinder({required this.primary});
  final Color primary;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;

    return Container(
      width: 220,
      height: 220,
      decoration: BoxDecoration(
        color: ext.divider,
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        border: Border.all(color: ext.border),
      ),
      child: CustomPaint(
        painter: _ViewfinderPainter(primary: primary),
        child: Center(
          child: Icon(
            Icons.qr_code_rounded,
            size: 80,
            color: ext.textTertiary,
          ),
        ),
      ),
    );
  }
}

class _ViewfinderPainter extends CustomPainter {
  const _ViewfinderPainter({required this.primary});
  final Color primary;

  @override
  void paint(Canvas canvas, Size size) {
    const cornerLen = 28.0;
    const strokeW = 3.0;
    const inset = 12.0;

    final paint = Paint()
      ..color = primary
      ..strokeWidth = strokeW
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final l = inset, t = inset;
    final r = size.width - inset, b = size.height - inset;

    // Верхний левый
    canvas.drawLine(Offset(l, t + cornerLen), Offset(l, t), paint);
    canvas.drawLine(Offset(l, t), Offset(l + cornerLen, t), paint);
    // Верхний правый
    canvas.drawLine(Offset(r - cornerLen, t), Offset(r, t), paint);
    canvas.drawLine(Offset(r, t), Offset(r, t + cornerLen), paint);
    // Нижний левый
    canvas.drawLine(Offset(l, b - cornerLen), Offset(l, b), paint);
    canvas.drawLine(Offset(l, b), Offset(l + cornerLen, b), paint);
    // Нижний правый
    canvas.drawLine(Offset(r - cornerLen, b), Offset(r, b), paint);
    canvas.drawLine(Offset(r, b), Offset(r, b - cornerLen), paint);
  }

  @override
  bool shouldRepaint(covariant _ViewfinderPainter old) => old.primary != primary;
}

class _FeedbackBanner extends StatelessWidget {
  const _FeedbackBanner({
    required this.feedback,
    required this.ext,
    required this.tt,
  });

  final _ScanFeedback feedback;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    final Color bg;
    final Color fg;
    final IconData icon;
    final String text;

    switch (feedback.type) {
      case _FeedbackType.success:
        bg = ext.successBg; fg = ext.successFg;
        icon = Icons.check_circle_outline;
        text = 'Отметка принята';
        break;
      case _FeedbackType.permissionDenied:
        bg = ext.warningBg; fg = ext.warningFg;
        icon = Icons.no_photography_outlined;
        text = 'Нет доступа к камере — разреши в настройках';
        break;
      case _FeedbackType.error:
        bg = ext.errorBg; fg = ext.errorFg;
        icon = Icons.error_outline;
        text = 'Не удалось отсканировать. Попробуй ещё раз';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: fg),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: tt.labelLarge?.copyWith(color: fg, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}

class _HistoryCard extends StatelessWidget {
  const _HistoryCard({
    required this.record,
    required this.cs,
    required this.ext,
    required this.tt,
  });

  final _AttendanceRecord record;
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        border: Border.all(color: ext.border),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Row(
        children: [
          // Зелёный круг с галочкой
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: ext.successBg,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.check_rounded, size: 18, color: ext.successFg),
          ),
          const SizedBox(width: 12),

          // Название + время
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  record.subject,
                  style: tt.labelLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 2),
                Text(
                  record.time,
                  style: tt.labelSmall?.copyWith(color: ext.textSecondary),
                ),
              ],
            ),
          ),

          Icon(Icons.chevron_right, size: 20, color: ext.textTertiary),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, required this.ext, required this.tt});
  final String title;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: tt.titleMedium);
  }
}

class _AttendanceRecord {
  final String subject;
  final String time;
  const _AttendanceRecord({required this.subject, required this.time});
}

enum _FeedbackType { success, permissionDenied, error }

class _ScanFeedback {
  final _FeedbackType type;
  final String? value;

  const _ScanFeedback.success(this.value) : type = _FeedbackType.success;
  const _ScanFeedback.permissionDenied()
      : type = _FeedbackType.permissionDenied,
        value = null;
  const _ScanFeedback.error()
      : type = _FeedbackType.error,
        value = null;
}
