import 'package:sfu/src/core/error/exception_handler.dart';
import 'package:sfu/src/feature/management/domain/entity/managed_student.dart';
import 'package:sfu/src/feature/management/domain/repository/management_repository.dart';
import 'package:sfu/src/feature/management/domain/use_case/get_students_use_case.dart';

class GetStudentsUseCaseImpl implements GetStudentsUseCase {
  final ManagementRepository _repo;
  const GetStudentsUseCaseImpl(this._repo);

  @override
  Future<List<ManagedStudent>> call({
    String? stream,
    String? groupId,
    String? search,
  }) =>
      ExceptionHandler.handle(
            () => _repo.getStudents(
          stream:  stream,
          groupId: groupId,
          search:  search,
        ),
      );
}