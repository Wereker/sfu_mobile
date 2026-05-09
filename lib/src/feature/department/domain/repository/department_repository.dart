import 'package:sfu/src/feature/department/domain/entity/staff_member.dart';

abstract class DepartmentRepository {
  Future<List<StaffMember>> getStaff();
  Future<StaffMember> getStaffMember(String id);
}
