import 'dart:math';

abstract class MockDelay {
  static Future<void> apply() {
    final ms = 600 + Random().nextInt(800);
    return Future.delayed(Duration(milliseconds: ms));
  }
}