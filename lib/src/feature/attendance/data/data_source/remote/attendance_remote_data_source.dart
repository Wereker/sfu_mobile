import 'package:sfu/src/feature/attendance/data/dto/attendance_record_dto.dart';
import 'package:sfu/src/feature/attendance/data/dto/attendance_session_dto.dart';
import 'package:sfu/src/feature/attendance/data/dto/attendance_student_dto.dart';

abstract class AttendanceRemoteDataSource {
  // Teacher
  Future<AttendanceSessionDTO> createSession(String lessonId, int ttlSeconds);
  Future<void> closeSession(String sessionId);
  Future<List<AttendanceStudentDTO>> getSessionStudents(String sessionId);
  Future<AttendanceStudentDTO> updateStudentStatus(
    String sessionId,
    String studentId,
    String status,
  );
  // Student
  Future<AttendanceRecordDTO> markAttendance(String token);
  Future<List<AttendanceRecordDTO>> getAttendanceHistory();
}
