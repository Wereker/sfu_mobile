import 'package:sfu/src/core/error/app_exception.dart';

// Нет интернета или сервер недоступен
class NetworkException extends AppException {
  const NetworkException({String? details})
      : super('Нет подключения к сети', details: details);
}

// Сервер вернул ошибку (4xx, 5xx)
class ServerException extends AppException {
  final int? statusCode;
  const ServerException({this.statusCode, String? details})
      : super('Ошибка сервера', details: details);
}

// Таймаут запроса
class TimeoutException extends AppException {
  const TimeoutException()
      : super('Превышено время ожидания');
}