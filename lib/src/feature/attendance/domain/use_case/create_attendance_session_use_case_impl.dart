import 'package:sfu/src/feature/attendance/domain/entity/attendance_session.dart';
import 'package:sfu/src/feature/attendance/domain/repository/attendance_repository.dart';
import 'package:sfu/src/feature/attendance/domain/use_case/create_attendance_session_use_case.dart';

class CreateAttendanceSessionUseCaseImpl
    implements CreateAttendanceSessionUseCase {
  final AttendanceRepository _repo;
  const CreateAttendanceSessionUseCaseImpl(this._repo);

  @override
  Future<AttendanceSession> call(int lessonId) => _repo.createToken(lessonId);
}