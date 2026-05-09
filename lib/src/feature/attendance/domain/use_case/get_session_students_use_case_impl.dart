import 'package:sfu/src/core/error/data_exception.dart';
import 'package:sfu/src/core/error/exception_handler.dart';
import 'package:sfu/src/feature/attendance/domain/entity/attendance_student.dart';
import 'package:sfu/src/feature/attendance/domain/repository/attendance_repository.dart';
import 'package:sfu/src/feature/attendance/domain/use_case/get_session_students_use_case.dart';

class GetSessionStudentsUseCaseImpl implements GetSessionStudentsUseCase {
  final AttendanceRepository _repo;
  const GetSessionStudentsUseCaseImpl(this._repo);

  @override
  Future<List<AttendanceStudent>> call(String sessionId) async {
    if (sessionId.trim().isEmpty) {
      throw const ValidationException('Не указан идентификатор сессии');
    }
    return ExceptionHandler.handle(() => _repo.getSessionStudents(sessionId));
  }
}
