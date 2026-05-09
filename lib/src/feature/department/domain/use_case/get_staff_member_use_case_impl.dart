import 'package:sfu/src/core/error/data_exception.dart';
import 'package:sfu/src/core/error/exception_handler.dart';
import 'package:sfu/src/feature/department/domain/entity/staff_member.dart';
import 'package:sfu/src/feature/department/domain/repository/department_repository.dart';
import 'package:sfu/src/feature/department/domain/use_case/get_staff_member_use_case.dart';

class GetStaffMemberUseCaseImpl implements GetStaffMemberUseCase {
  final DepartmentRepository _repo;
  const GetStaffMemberUseCaseImpl(this._repo);

  @override
  Future<StaffMember> call(String id) async {
    if (id.trim().isEmpty) {
      throw const ValidationException('Не указан идентификатор преподавателя');
    }
    return ExceptionHandler.handle(() => _repo.getStaffMember(id));
  }
}
