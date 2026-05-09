import 'package:sfu/src/feature/department/data/dto/staff_member_dto.dart';

abstract class DepartmentRemoteDataSource {
  Future<List<StaffMemberDTO>> getStaff();
  Future<StaffMemberDTO>       getStaffMember(String id);
}