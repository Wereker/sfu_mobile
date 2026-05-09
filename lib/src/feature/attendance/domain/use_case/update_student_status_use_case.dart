import 'package:sfu/src/feature/attendance/domain/entity/attendance_student.dart';

abstract class UpdateStudentStatusUseCase {
  Future<AttendanceStudent> call({
    required String          sessionId,
    required String          studentId,
    required AttendanceStatus status,
  });
}