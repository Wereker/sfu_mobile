abstract class AppException implements Exception {
  final String message;
  final String? details;

  const AppException(this.message, {this.details});

  @override
  String toString() =>
      'AppException: $message${details != null ? ' ($details)' : ''}';
}
