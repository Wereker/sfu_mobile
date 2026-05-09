import 'package:sfu/src/feature/department/domain/entity/staff_member.dart';

abstract class GetStaffUseCase {
  Future<List<StaffMember>> call();
}