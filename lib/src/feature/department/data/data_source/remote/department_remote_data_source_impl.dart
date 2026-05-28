import 'package:dio/dio.dart';
import 'package:sfu/src/core/error/exception_handler.dart';
import 'package:sfu/src/feature/department/data/data_source/remote/department_remote_data_source.dart';
import 'package:sfu/src/feature/department/data/dto/staff_member_dto.dart';

class DepartmentRemoteDataSourceImpl implements DepartmentRemoteDataSource {
  final Dio _authorizedClient;

  const DepartmentRemoteDataSourceImpl({required Dio authorizedClient})
      : _authorizedClient = authorizedClient;

  @override
  Future<List<StaffMemberDTO>> getStaff() =>
      ExceptionHandler.handle(() async {
        final response =
            await _authorizedClient.get<List<dynamic>>('/users/teachers');
        return (response.data ?? [])
            .map((e) =>
                StaffMemberDTO.fromApiJson(e as Map<String, dynamic>))
            .toList();
      });

  @override
  Future<StaffMemberDTO> getStaffMember(String id) =>
      ExceptionHandler.handle(() async {
        final response = await _authorizedClient
            .get<Map<String, dynamic>>('/users/$id');
        return StaffMemberDTO.fromApiJson(response.data!);
      });
}
