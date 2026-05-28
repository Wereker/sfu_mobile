import 'package:sfu/src/feature/attendance/domain/entity/attendance_record.dart';
import 'package:sfu/src/feature/attendance/domain/repository/attendance_repository.dart';
import 'package:sfu/src/feature/attendance/domain/use_case/update_student_status_use_case.dart';

class UpdateStudentStatusUseCaseImpl implements UpdateStudentStatusUseCase {
  final AttendanceRepository _repo;
  const UpdateStudentStatusUseCaseImpl(this._repo);

  @override
  Future<AttendanceRecord> call(int lessonId, int studentId) =>
      _repo.markManual(lessonId, studentId);
}