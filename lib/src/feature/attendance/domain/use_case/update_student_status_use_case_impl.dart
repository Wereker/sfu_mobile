import 'package:sfu/src/core/error/data_exception.dart';
import 'package:sfu/src/core/error/exception_handler.dart';
import 'package:sfu/src/feature/attendance/domain/entity/attendance_student.dart';
import 'package:sfu/src/feature/attendance/domain/repository/attendance_repository.dart';
import 'package:sfu/src/feature/attendance/domain/use_case/update_student_status_use_case.dart';

class UpdateStudentStatusUseCaseImpl implements UpdateStudentStatusUseCase {
  final AttendanceRepository _repo;
  const UpdateStudentStatusUseCaseImpl(this._repo);

  @override
  Future<AttendanceStudent> call({
    required String sessionId,
    required String studentId,
    required AttendanceStatus status,
  }) async {
    if (sessionId.trim().isEmpty) {
      throw const ValidationException('Не указан идентификатор сессии');
    }
    if (studentId.trim().isEmpty) {
      throw const ValidationException('Не указан идентификатор студента');
    }

    return ExceptionHandler.handle(
      () => _repo.updateStudentStatus(sessionId, studentId, status),
    );
  }
}
