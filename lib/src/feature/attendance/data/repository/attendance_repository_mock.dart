import 'package:sfu/src/feature/attendance/data/data_source/remote/attendance_remote_data_source.dart';
import 'package:sfu/src/feature/attendance/data/mapper/attendance_mapper.dart';
import 'package:sfu/src/feature/attendance/domain/entity/attendance_record.dart';
import 'package:sfu/src/feature/attendance/domain/entity/attendance_session.dart';
import 'package:sfu/src/feature/attendance/domain/entity/attendance_student.dart';
import 'package:sfu/src/feature/attendance/domain/repository/attendance_repository.dart';

class AttendanceRepositoryMock implements AttendanceRepository {
  final AttendanceRemoteDataSource _remote;
  const AttendanceRepositoryMock(this._remote);

  @override
  Future<AttendanceSession> createToken(int lessonId) async {
    final dto = await _remote.createToken(lessonId);
    return AttendanceMapper.sessionFromDTO(dto);
  }

  @override
  Future<AttendanceRecord> markManual(int lessonId, int studentId) async {
    final dto = await _remote.markManual(lessonId, studentId);
    return AttendanceMapper.recordFromDTO(dto);
  }

  @override
  Future<List<AttendanceStudent>> getLessonStudents(int lessonId) async {
    final records = await _remote.getLessonAttendance(lessonId);
    return AttendanceMapper.buildStudentList(records);
  }

  @override
  Future<AttendanceRecord> scanToken(String token) async {
    final dto = await _remote.scanToken(token);
    return AttendanceMapper.recordFromDTO(dto);
  }

  @override
  Future<List<AttendanceRecord>> getStudentHistory(int studentId) async {
    final dtos = await _remote.getStudentHistory(studentId);
    return dtos.map(AttendanceMapper.recordFromDTO).toList();
  }
}