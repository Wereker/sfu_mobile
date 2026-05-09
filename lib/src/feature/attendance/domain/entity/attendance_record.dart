import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/feature/attendance/domain/entity/attendance_student.dart';

part 'attendance_record.freezed.dart';

@freezed
abstract class AttendanceRecord with _$AttendanceRecord {
  const factory AttendanceRecord({
    required String id,
    required String lesson,
    required DateTime date,
    required AttendanceStatus status,
    required DateTime markedAt,
  }) = _AttendanceRecord;
}
