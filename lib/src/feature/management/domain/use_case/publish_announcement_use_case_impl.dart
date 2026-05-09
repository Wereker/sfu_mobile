import 'package:sfu/src/core/error/data_exception.dart';
import 'package:sfu/src/core/error/exception_handler.dart';
import 'package:sfu/src/feature/management/domain/repository/management_repository.dart';
import 'package:sfu/src/feature/management/domain/use_case/publish_announcement_use_case.dart';

class PublishAnnouncementUseCaseImpl implements PublishAnnouncementUseCase {
  final ManagementRepository _repo;
  const PublishAnnouncementUseCaseImpl(this._repo);

  static const _validAudiences = {'all', 'stream', 'group', 'department'};

  @override
  Future<void> call({
    required String title,
    required String body,
    required String audience,
    bool isPinned = false,
    String? stream,
    String? groupId,
    List<String> tags = const [],
  }) async {
    if (title.trim().isEmpty) {
      throw const ValidationException('Введите заголовок объявления');
    }
    if (title.trim().length > 200) {
      throw const ValidationException(
        'Заголовок слишком длинный (максимум 200 символов)',
      );
    }
    if (body.trim().isEmpty) {
      throw const ValidationException('Введите текст объявления');
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
      () => _repo.createAnnouncement(
        title: title.trim(),
        body: body.trim(),
        audience: audience,
        isPinned: isPinned,
        stream: stream,
        groupId: groupId,
        tags: tags,
      ),
    );
  }
}
