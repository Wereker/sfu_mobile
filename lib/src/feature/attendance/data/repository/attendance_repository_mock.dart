import 'package:sfu/src/core/error/exception_handler.dart';
import 'package:sfu/src/feature/attendance/data/dto/attendance_record_dto.dart';
import 'package:sfu/src/feature/attendance/data/dto/attendance_student_dto.dart';
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
  Future<AttendanceSession> createSession(
      String lessonId, {
        int ttlSeconds = 300,
      }) async {
    return ExceptionHandler.handle(() async {
      final dto = await _remote.createSession(lessonId, ttlSeconds);
      return AttendanceMapper.sessionFromDTO(dto);
    });
  }

  @override
  Future<void> closeSession(String sessionId) =>
      _remote.closeSession(sessionId);

  @override
  Future<List<AttendanceStudent>> getSessionStudents(String sessionId) async {
    return ExceptionHandler.handle(() async {
      final List<AttendanceStudentDTO> dtos = await _remote.getSessionStudents(sessionId);
      return dtos.map<AttendanceStudent>(AttendanceMapper.studentFromDTO).toList();
    });
  }

  @override
  Future<AttendanceStudent> updateStudentStatus(
      String sessionId,
      String studentId,
      AttendanceStatus status,
      ) async {
    return ExceptionHandler.handle(() async {
      final dto = await _remote.updateStudentStatus(
        sessionId,
        studentId,
        status.name,
      );
      return AttendanceMapper.studentFromDTO(dto);
    });
  }

  @override
  Future<AttendanceRecord> markAttendance(String token) async {
    return ExceptionHandler.handle(() async {
      final dto = await _remote.markAttendance(token);
      return AttendanceMapper.recordFromDTO(dto);
    });
  }

  @override
  Future<List<AttendanceRecord>> getAttendanceHistory() async {
    return ExceptionHandler.handle(() async {
      final List<AttendanceRecordDTO> dtos = await _remote.getAttendanceHistory();
      return dtos.map<AttendanceRecord>(AttendanceMapper.recordFromDTO).toList();
    });
  }
}