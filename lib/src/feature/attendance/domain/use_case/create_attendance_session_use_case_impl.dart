import 'package:sfu/src/core/error/data_exception.dart';
import 'package:sfu/src/core/error/exception_handler.dart';
import 'package:sfu/src/feature/attendance/domain/entity/attendance_session.dart';
import 'package:sfu/src/feature/attendance/domain/repository/attendance_repository.dart';
import 'package:sfu/src/feature/attendance/domain/use_case/create_attendance_session_use_case.dart';

class CreateAttendanceSessionUseCaseImpl
    implements CreateAttendanceSessionUseCase {
  final AttendanceRepository _repo;
  const CreateAttendanceSessionUseCaseImpl(this._repo);

  @override
  Future<AttendanceSession> call({
    required String lessonId,
    int ttlSeconds = 300,
  }) async {
    if (lessonId.trim().isEmpty) {
      throw const ValidationException('Не указан идентификатор пары');
    }
    if (ttlSeconds < 60 || ttlSeconds > 1800) {
      throw const ValidationException(
        'Время жизни QR должно быть от 1 до 30 минут',
      );
    }

    return ExceptionHandler.handle(
      () => _repo.createSession(lessonId, ttlSeconds: ttlSeconds),
    );
  }
}
