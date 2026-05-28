import 'package:sfu/src/feature/attendance/domain/entity/attendance_student.dart';

abstract class GetSessionStudentsUseCase {
  Future<List<AttendanceStudent>> call(int lessonId);
}