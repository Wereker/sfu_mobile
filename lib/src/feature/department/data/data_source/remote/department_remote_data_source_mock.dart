import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:sfu/src/core/mock/mock_delay.dart';
import 'package:sfu/src/feature/department/data/dto/staff_member_dto.dart';
import 'package:sfu/src/feature/department/data/data_source/remote/department_remote_data_source.dart';

class DepartmentRemoteDataSourceMock implements DepartmentRemoteDataSource {
  @override
  Future<List<StaffMemberDTO>> getStaff() async {
    await MockDelay.apply();

    final raw = await rootBundle.loadString('lib/src/core/mock/staff.json');
    final json = jsonDecode(raw) as Map<String, dynamic>;

    return (json['data'] as List)
        .map((item) => StaffMemberDTO.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<StaffMemberDTO> getStaffMember(String id) async {
    await MockDelay.apply();

    final all = await getStaff();
    return all.firstWhere(
      (s) => s.id == id,
      orElse: () => throw Exception('Преподаватель $id не найден'),
    );
  }
}
