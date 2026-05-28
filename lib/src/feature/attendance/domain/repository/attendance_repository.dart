import 'package:sfu/src/feature/attendance/domain/entity/attendance_record.dart';
import 'package:sfu/src/feature/attendance/domain/entity/attendance_session.dart';
import 'package:sfu/src/feature/attendance/domain/entity/attendance_student.dart';

abstract class AttendanceRepository {
  // Teacher
  Future<AttendanceSession> createToken(int lessonId);
  Future<AttendanceRecord> markManual(int lessonId, int studentId);
  Future<List<AttendanceStudent>> getLessonStudents(int lessonId);

  // Student
  Future<AttendanceRecord> scanToken(String token);
  Future<List<AttendanceRecord>> getStudentHistory(int studentId);
}