import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

class QRScannerResult {
  final String? value;
  final QRScannerStatus status;

  const QRScannerResult.success(this.value) : status = QRScannerStatus.success;
  const QRScannerResult.cancelled()
    : value = null,
      status = QRScannerStatus.cancelled;
  const QRScannerResult.error() : value = null, status = QRScannerStatus.error;
  const QRScannerResult.permissionDenied()
    : value = null,
      status = QRScannerStatus.permissionDenied;
}

enum QRScannerStatus { success, cancelled, error, permissionDenied }

class QRScannerUtils {
  /// Сканирует QR-код и возвращает результат
  ///
  /// Возвращает:
  /// - успех: значение QR-кода
  /// - отмена: пользователь закрыл сканер
  /// - ошибка: техническая проблема
  /// - запрет разрешений: пользователь отказал в доступе к камере
  static Future<QRScannerResult> scan({
    required BuildContext context,
    bool allowFlash = true,
    Duration? autoCloseDelay,
  }) async {
    final permissionStatus = await _requestCameraPermission();
    if (permissionStatus != PermissionStatus.granted) {
      return const QRScannerResult.permissionDenied();
    }

    final result = await Navigator.push<String?>(
      context,
      MaterialPageRoute(
        builder: (context) => _QRScannerScreen(
          allowFlash: allowFlash,
          autoCloseDelay: autoCloseDelay,
        ),
      ),
    );

    if (result == null) {
      return const QRScannerResult.cancelled();
    }
    return QRScannerResult.success(result);
  }

  /// Запрашивает разрешение на камеру с обработкой отказа
  static Future<PermissionStatus> _requestCameraPermission() async {
    if (kIsWeb) return PermissionStatus.granted;

    final status = await Permission.camera.request();

    if (status.isPermanentlyDenied) {
      await openAppSettings();
      return await Permission.camera.request();
    }

    return status;
  }
}

class _QRScannerScreen extends StatefulWidget {
  final bool allowFlash;
  final Duration? autoCloseDelay;

  const _QRScannerScreen({this.allowFlash = true, this.autoCloseDelay});

  @override
  State<_QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<_QRScannerScreen> {
  late final MobileScannerController controller;
  final bool _isScanning = true;
  String? _lastScannedValue;

  @override
  void initState() {
    super.initState();
    controller = MobileScannerController(
      facing: CameraFacing.back,
      torchEnabled: false,
      formats: [BarcodeFormat.qrCode],
      detectionSpeed: DetectionSpeed.noDuplicates,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          MobileScanner(
            controller: controller,
            onDetect: _isScanning ? _onDetect : null,
          ),

          _buildScanOverlay(),

          _buildControlButtons(),

          if (_lastScannedValue != null)
            Positioned(
              bottom: 90,
              left: 0,
              right: 0,
              child: AnimatedOpacity(
                opacity: _lastScannedValue != null ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                    color: Colors.green.withValues(alpha: .85),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Отсканировано: $_lastScannedValue',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildControlButtons() {
    return Positioned.fill(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Center(
                    child: SvgPicture.asset('assets/images/logo_app_bar.svg'),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 36,
                children: [
                  if (widget.allowFlash)
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(36),
                      ),
                      child: IconButton(
                        icon: Icon(
                          controller.torchEnabled
                              ? Icons.flash_on
                              : Icons.flash_off,
                          color: controller.torchEnabled
                              ? Colors.yellow
                              : Colors.white,
                          size: 36,
                        ),
                        onPressed: () => controller.toggleTorch(),
                        padding: const EdgeInsets.all(16),
                        splashRadius: 32,
                      ),
                    ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 36,
                      ),
                      onPressed: _onCancel,
                      padding: const EdgeInsets.all(16),
                      splashRadius: 32,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onDetect(BarcodeCapture capture) {
    final code = capture.barcodes.firstOrNull?.rawValue;
    if (code == null || code == _lastScannedValue) return;

    setState(() {
      _lastScannedValue = code;
    });

    if (widget.autoCloseDelay != null) {
      Future.delayed(widget.autoCloseDelay!, () {
        if (mounted) Navigator.of(context).pop(code);
      });
    } else {
      Navigator.of(context).pop(code);
    }
  }

  void _onCancel() {
    Navigator.of(context).pop(null);
  }

  Widget _buildScanOverlay() {
    return Positioned.fill(child: CustomPaint(painter: _ScanOverlayPainter()));
  }
}

// Визуальный оверлей для сканера
class _ScanOverlayPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: .3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Центральная рамка для наведения
    final rectWidth = size.width * 0.6;
    // final rectHeight = size.height * 0.3;
    final rectHeight = rectWidth;
    final rect = Rect.fromLTWH(
      (size.width - rectWidth) / 2,
      (size.height - rectHeight) / 2,
      rectWidth,
      rectHeight,
    );

    canvas.drawRect(rect, paint);

    final cornerPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3;

    final cornerLength = 24.0;

    canvas.drawLine(
      rect.topLeft,
      Offset(rect.left, rect.top + cornerLength),
      cornerPaint,
    );
    canvas.drawLine(
      rect.topLeft,
      Offset(rect.left + cornerLength, rect.top),
      cornerPaint,
    );

    canvas.drawLine(
      rect.topRight,
      Offset(rect.right, rect.top + cornerLength),
      cornerPaint,
    );
    canvas.drawLine(
      rect.topRight,
      Offset(rect.right - cornerLength, rect.top),
      cornerPaint,
    );

    canvas.drawLine(
      rect.bottomLeft,
      Offset(rect.left, rect.bottom - cornerLength),
      cornerPaint,
    );
    canvas.drawLine(
      rect.bottomLeft,
      Offset(rect.left + cornerLength, rect.bottom),
      cornerPaint,
    );

    canvas.drawLine(
      rect.bottomRight,
      Offset(rect.right, rect.bottom - cornerLength),
      cornerPaint,
    );
    canvas.drawLine(
      rect.bottomRight,
      Offset(rect.right - cornerLength, rect.bottom),
      cornerPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
