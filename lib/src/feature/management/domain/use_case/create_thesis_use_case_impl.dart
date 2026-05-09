import 'package:sfu/src/core/error/data_exception.dart';
import 'package:sfu/src/core/error/exception_handler.dart';
import 'package:sfu/src/feature/management/domain/entity/thesis.dart';
import 'package:sfu/src/feature/management/domain/repository/management_repository.dart';
import 'package:sfu/src/feature/management/domain/use_case/create_thesis_use_case.dart';

class CreateThesisUseCaseImpl implements CreateThesisUseCase {
  final ManagementRepository _repo;
  const CreateThesisUseCaseImpl(this._repo);

  @override
  Future<Thesis> call(String title) async {
    final trimmed = title.trim();

    if (trimmed.isEmpty) {
      throw const ValidationException('Введите название темы');
    }
    if (trimmed.length < 10) {
      throw const ValidationException(
        'Название слишком короткое (минимум 10 символов)',
      );
    }
    if (trimmed.length > 500) {
      throw const ValidationException(
        'Название слишком длинное (максимум 500 символов)',
      );
    }

    return ExceptionHandler.handle(() => _repo.createThesis(trimmed));
  }
}
