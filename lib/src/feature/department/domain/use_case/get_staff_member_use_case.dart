import 'package:sfu/src/feature/department/domain/entity/staff_member.dart';

abstract class GetStaffMemberUseCase {
  Future<StaffMember> call(String id);
}
