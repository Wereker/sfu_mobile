import 'package:sfu/src/core/error/data_exception.dart';
import 'package:sfu/src/core/error/exception_handler.dart';
import 'package:sfu/src/feature/attendance/domain/entity/attendance_record.dart';
import 'package:sfu/src/feature/attendance/domain/repository/attendance_repository.dart';
import 'package:sfu/src/feature/attendance/domain/use_case/mark_attendance_use_case.dart';

class MarkAttendanceUseCaseImpl implements MarkAttendanceUseCase {
  final AttendanceRepository _repo;
  const MarkAttendanceUseCaseImpl(this._repo);

  @override
  Future<AttendanceRecord> call(String token) async {
    if (token.trim().isEmpty) {
      throw const ValidationException('QR-токен не может быть пустым');
    }

    return ExceptionHandler.handle(() => _repo.markAttendance(token));
  }
}
