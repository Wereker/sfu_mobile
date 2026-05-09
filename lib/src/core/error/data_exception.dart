import 'package:sfu/src/core/error/app_exception.dart';

// Не удалось распарсить JSON
class ParseException extends AppException {
  const ParseException({String? details})
      : super('Ошибка обработки данных', details: details);
}

// Объект не найден
class NotFoundException extends AppException {
  const NotFoundException({String? details})
      : super('Данные не найдены', details: details);
}

// Конфликт (уже записан, уже отмечен)
class ConflictException extends AppException {
  const ConflictException({String? details})
      : super('Действие уже выполнено', details: details);
}

// Локальный кэш пустой
class CacheException extends AppException {
  const CacheException()
      : super('Нет сохранённых данных');
}

class ValidationException extends AppException {
  const ValidationException(super.message);
}