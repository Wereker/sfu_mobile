import 'package:sfu/src/feature/attendance/data/dto/attendance_session_dto.dart';
import 'package:sfu/src/feature/attendance/data/dto/attendance_student_dto.dart';
import 'package:sfu/src/feature/attendance/data/dto/attendance_record_dto.dart';
import 'package:sfu/src/feature/attendance/domain/entity/attendance_session.dart';
import 'package:sfu/src/feature/attendance/domain/entity/attendance_student.dart';
import 'package:sfu/src/feature/attendance/domain/entity/attendance_record.dart';

abstract class AttendanceMapper {
  static AttendanceSession sessionFromDTO(AttendanceSessionDTO dto) =>
      AttendanceSession(
        sessionId: dto.sessionId,
        token: dto.token,
        expiresAt: DateTime.parse(dto.expiresAt),
      );

  static AttendanceStudent studentFromDTO(AttendanceStudentDTO dto) =>
      AttendanceStudent(
        id: dto.id,
        name: dto.name,
        isHeadman: dto.isHeadman,
        status: AttendanceStatus.values.firstWhere(
          (e) => e.name == dto.status,
          orElse: () => AttendanceStatus.absent,
        ),
        markedAt: dto.markedAt != null ? DateTime.parse(dto.markedAt!) : null,
      );

  static AttendanceRecord recordFromDTO(AttendanceRecordDTO dto) =>
      AttendanceRecord(
        id: dto.id,
        lesson: dto.lesson,
        date: DateTime.parse(dto.date),
        status: AttendanceStatus.values.firstWhere(
          (e) => e.name == dto.status,
          orElse: () => AttendanceStatus.absent,
        ),
        markedAt: DateTime.parse(dto.markedAt),
      );
}
