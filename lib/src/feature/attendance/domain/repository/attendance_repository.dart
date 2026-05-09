import 'package:sfu/src/feature/attendance/domain/entity/attendance_record.dart';
import 'package:sfu/src/feature/attendance/domain/entity/attendance_session.dart';
import 'package:sfu/src/feature/attendance/domain/entity/attendance_student.dart';

abstract class AttendanceRepository {
  // Teacher
  Future<AttendanceSession> createSession(String lessonId, {int ttlSeconds});
  Future<void> closeSession(String sessionId);
  Future<List<AttendanceStudent>> getSessionStudents(String sessionId);
  Future<AttendanceStudent> updateStudentStatus(
    String sessionId,
    String studentId,
    AttendanceStatus status,
  );
  // Student
  Future<AttendanceRecord> markAttendance(String token);
  Future<List<AttendanceRecord>> getAttendanceHistory();
}
