import 'package:dio/dio.dart';
import 'package:sfu/src/core/error/exception_handler.dart';
import 'package:sfu/src/feature/attendance/data/data_source/remote/attendance_remote_data_source.dart';
import 'package:sfu/src/feature/attendance/data/dto/attendance_record_dto.dart';
import 'package:sfu/src/feature/attendance/data/dto/attendance_session_dto.dart';

class AttendanceRemoteDataSourceImpl implements AttendanceRemoteDataSource {
  final Dio _authorizedClient;

  const AttendanceRemoteDataSourceImpl({required Dio authorizedClient})
      : _authorizedClient = authorizedClient;

  @override
  Future<AttendanceSessionDTO> createToken(int lessonId) =>
      ExceptionHandler.handle(() async {
        final response = await _authorizedClient
            .post<Map<String, dynamic>>('/attendance/token/$lessonId');
        return AttendanceSessionDTO.fromJson(response.data!);
      });

  @override
  Future<AttendanceRecordDTO> markManual(int lessonId, int studentId) =>
      ExceptionHandler.handle(() async {
        final response = await _authorizedClient
            .post<Map<String, dynamic>>(
            '/attendance/manual/$lessonId/$studentId');
        return AttendanceRecordDTO.fromJson(response.data!);
      });

  @override
  Future<List<AttendanceRecordDTO>> getLessonAttendance(int lessonId) =>
      ExceptionHandler.handle(() async {
        final response = await _authorizedClient
            .get<List<dynamic>>('/attendance/lesson/$lessonId');
        return (response.data ?? [])
            .map((e) => AttendanceRecordDTO.fromJson(e as Map<String, dynamic>))
            .toList();
      });

  @override
  Future<AttendanceRecordDTO> scanToken(String token) =>
      ExceptionHandler.handle(() async {
        final response = await _authorizedClient
            .post<Map<String, dynamic>>('/attendance/scan/$token');
        return AttendanceRecordDTO.fromJson(response.data!);
      });

  @override
  Future<List<AttendanceRecordDTO>> getStudentHistory(int studentId) =>
      ExceptionHandler.handle(() async {
        final response = await _authorizedClient
            .get<List<dynamic>>('/attendance/student/$studentId');
        return (response.data ?? [])
            .map((e) => AttendanceRecordDTO.fromJson(e as Map<String, dynamic>))
            .toList();
      });
}