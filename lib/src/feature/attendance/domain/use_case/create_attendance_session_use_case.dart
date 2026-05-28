import 'package:sfu/src/feature/attendance/domain/entity/attendance_session.dart';

abstract class CreateAttendanceSessionUseCase {
  Future<AttendanceSession> call(int lessonId);
}