import 'package:sfu/src/core/error/data_exception.dart';
import 'package:sfu/src/core/error/exception_handler.dart';
import 'package:sfu/src/feature/attendance/domain/repository/attendance_repository.dart';
import 'package:sfu/src/feature/attendance/domain/use_case/close_attendance_session_use_case.dart';

class CloseAttendanceSessionUseCaseImpl
    implements CloseAttendanceSessionUseCase {
  final AttendanceRepository _repo;
  const CloseAttendanceSessionUseCaseImpl(this._repo);

  @override
  Future<void> call(String sessionId) async {
    if (sessionId.trim().isEmpty) {
      throw const ValidationException('Не указан идентификатор сессии');
    }
    return ExceptionHandler.handle(() => _repo.closeSession(sessionId));
  }
}