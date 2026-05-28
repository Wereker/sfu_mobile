import 'package:sfu/src/feature/attendance/data/dto/attendance_record_dto.dart';
import 'package:sfu/src/feature/attendance/data/dto/attendance_session_dto.dart';

abstract class AttendanceRemoteDataSource {
  // Teacher
  /// POST /attendance/token/{lesson_id} — создать QR-токен для пары
  Future<AttendanceSessionDTO> createToken(int lessonId);

  /// POST /attendance/manual/{lesson_id}/{student_id} — ручная отметка
  Future<AttendanceRecordDTO> markManual(int lessonId, int studentId);

  /// GET /attendance/lesson/{lesson_id} — отметки по паре (для журнала)
  Future<List<AttendanceRecordDTO>> getLessonAttendance(int lessonId);

  // Student
  /// POST /attendance/scan/{token} — отметиться по QR
  Future<AttendanceRecordDTO> scanToken(String token);

  /// GET /attendance/student/{student_id} — история отметок студента
  Future<List<AttendanceRecordDTO>> getStudentHistory(int studentId);
}