import 'package:sfu/src/core/error/exception_handler.dart';
import 'package:sfu/src/feature/department/domain/entity/staff_member.dart';
import 'package:sfu/src/feature/department/domain/repository/department_repository.dart';
import 'package:sfu/src/feature/department/domain/use_case/get_staff_use_case.dart';

class GetStaffUseCaseImpl implements GetStaffUseCase {
  final DepartmentRepository _repo;
  const GetStaffUseCaseImpl(this._repo);

  @override
  Future<List<StaffMember>> call() => ExceptionHandler.handle(_repo.getStaff);
}
