import 'package:sfu/src/feature/attendance/domain/entity/attendance_record.dart';

abstract class UpdateStudentStatusUseCase {
  Future<AttendanceRecord> call(int lessonId, int studentId);
}