import 'package:sfu/src/core/error/data_exception.dart';
import 'package:sfu/src/core/error/exception_handler.dart';
import 'package:sfu/src/feature/management/domain/entity/thesis.dart';
import 'package:sfu/src/feature/management/domain/repository/management_repository.dart';
import 'package:sfu/src/feature/management/domain/use_case/update_thesis_use_case.dart';

class UpdateThesisUseCaseImpl implements UpdateThesisUseCase {
  final ManagementRepository _repo;
  const UpdateThesisUseCaseImpl(this._repo);

  @override
  Future<Thesis> call(String id, {String? title, bool? isFree}) async {
    if (id.trim().isEmpty) {
      throw const ValidationException('Не указан идентификатор темы');
    }
    if (title != null && title.trim().length < 10) {
      throw const ValidationException('Название слишком короткое (минимум 10 символов)');
    }
    if (title == null && isFree == null) {
      throw const ValidationException('Не указаны поля для обновления');
    }

    return ExceptionHandler.handle(
          () => _repo.updateThesis(id, title: title?.trim(), isFree: isFree),
    );
  }
}