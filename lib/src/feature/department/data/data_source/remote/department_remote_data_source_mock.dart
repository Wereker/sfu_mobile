import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:sfu/src/feature/department/data/data_source/remote/department_remote_data_source.dart';
import 'package:sfu/src/feature/department/data/dto/staff_member_dto.dart';

class DepartmentRemoteDataSourceMock implements DepartmentRemoteDataSource {
  @override
  Future<List<StaffMemberDTO>> getStaff() async {
    await Future.delayed(const Duration(milliseconds: 600));
    final raw = await rootBundle.loadString('lib/src/core/mock/staff.json');
    final list = jsonDecode(raw) as List<dynamic>;
    return list.map((e) => StaffMemberDTO.fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Future<StaffMemberDTO> getStaffMember(String id) async {
    final all = await getStaff();
    return all.firstWhere((s) => s.id == id, orElse: () => all.first);
  }
}