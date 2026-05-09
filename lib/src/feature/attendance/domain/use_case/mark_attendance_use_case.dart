import 'package:sfu/src/feature/attendance/domain/entity/attendance_record.dart';

abstract class MarkAttendanceUseCase {
  Future<AttendanceRecord> call(String token);
}
