import 'package:sfu/src/core/error/data_exception.dart';
import 'package:sfu/src/core/error/exception_handler.dart';
import 'package:sfu/src/feature/management/domain/repository/management_repository.dart';
import 'package:sfu/src/feature/management/domain/use_case/publish_event_use_case.dart';

class PublishEventUseCaseImpl implements PublishEventUseCase {
  final ManagementRepository _repo;
  const PublishEventUseCaseImpl(this._repo);

  static const _validAudiences = {'all', 'stream', 'group', 'department'};

  @override
  Future<void> call({
    required String title,
    required String body,
    required String date,
    required String time,
    required String location,
    required int totalSeats,
    required String audience,
    String? stream,
    String? groupId,
    List<String> tags = const [],
  }) async {
    if (title.trim().isEmpty) {
      throw const ValidationException('Введите название события');
    }
    if (body.trim().isEmpty) {
      throw const ValidationException('Введите описание события');
    }
    if (location.trim().isEmpty) {
      throw const ValidationException('Укажите место проведения');
    }
    if (totalSeats <= 0) {
      throw const ValidationException('Количество мест должно быть больше 0');
    }
    if (date.trim().isEmpty) {
      throw const ValidationException('Выберите дату проведения');
    }

    // Дата не в прошлом
    final eventDate = DateTime.tryParse(date);
    if (eventDate == null) {
      throw const ValidationException('Неверный формат даты');
    }
    final today = DateTime.now();
    final todayOnly = DateTime(today.year, today.month, today.day);
    if (eventDate.isBefore(todayOnly)) {
      throw const ValidationException('Дата события не может быть в прошлом');
    }

    if (!_validAudiences.contains(audience)) {
      throw const ValidationException('Неверная аудитория');
    }
    if (audience == 'stream' && (stream == null || stream.trim().isEmpty)) {
      throw const ValidationException('Выберите поток');
    }
    if (audience == 'group' && (groupId == null || groupId.trim().isEmpty)) {
      throw const ValidationException('Выберите группу');
    }

    return ExceptionHandler.handle(
      () => _repo.createEvent(
        title: title.trim(),
        body: body.trim(),
        date: date,
        time: time,
        location: location.trim(),
        totalSeats: totalSeats,
        audience: audience,
        stream: stream,
        groupId: groupId,
        tags: tags,
      ),
    );
  }
}
