import 'package:sfu/src/core/error/exception_handler.dart';
import 'package:sfu/src/feature/management/domain/entity/thesis.dart';
import 'package:sfu/src/feature/management/domain/repository/management_repository.dart';
import 'package:sfu/src/feature/management/domain/use_case/get_my_theses_use_case.dart';

class GetMyThesesUseCaseImpl implements GetMyThesesUseCase {
  final ManagementRepository _repo;
  const GetMyThesesUseCaseImpl(this._repo);

  @override
  Future<List<Thesis>> call() => ExceptionHandler.handle(_repo.getMyTheses);
}
