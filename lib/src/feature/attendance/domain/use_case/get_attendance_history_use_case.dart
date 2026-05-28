import 'package:sfu/src/feature/attendance/domain/entity/attendance_record.dart';

abstract class GetAttendanceHistoryUseCase {
  Future<List<AttendanceRecord>> call(int studentId);
}