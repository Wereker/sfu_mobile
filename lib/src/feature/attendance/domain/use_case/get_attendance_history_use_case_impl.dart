import 'package:sfu/src/core/error/exception_handler.dart';
import 'package:sfu/src/feature/attendance/domain/entity/attendance_record.dart';
import 'package:sfu/src/feature/attendance/domain/repository/attendance_repository.dart';
import 'package:sfu/src/feature/attendance/domain/use_case/get_attendance_history_use_case.dart';

class GetAttendanceHistoryUseCaseImpl implements GetAttendanceHistoryUseCase {
  final AttendanceRepository _repo;
  const GetAttendanceHistoryUseCaseImpl(this._repo);

  @override
  Future<List<AttendanceRecord>> call() =>
      ExceptionHandler.handle(_repo.getAttendanceHistory);
}