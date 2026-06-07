import 'package:sfu/src/feature/department/data/data_source/remote/department_remote_data_source.dart';
import 'package:sfu/src/feature/department/data/mapper/staff_member_mapper.dart';
import 'package:sfu/src/feature/department/domain/entity/staff_member.dart';
import 'package:sfu/src/feature/department/domain/repository/department_repository.dart';

class DepartmentRepositoryMock implements DepartmentRepository {
  final DepartmentRemoteDataSource _remote;
  const DepartmentRepositoryMock(this._remote);

  @override
  Future<List<StaffMember>> getStaff() async {
    final dtos = await _remote.getStaff();
    return dtos.map(StaffMemberMapper.fromDTO).toList();
  }

  @override
  Future<StaffMember> getStaffMember(String id) async {
    final dto = await _remote.getStaffMember(id);
    return StaffMemberMapper.fromDTO(dto);
  }
}