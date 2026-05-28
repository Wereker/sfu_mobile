import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_student.freezed.dart';

@freezed
abstract class AttendanceStudent with _$AttendanceStudent {
  const factory AttendanceStudent({
    required String id,
    required String name,
    @Default(false) bool isHeadman,
    @Default(AttendanceStatus.absent) AttendanceStatus status,
    DateTime? markedAt,
  }) = _AttendanceStudent;
}

enum AttendanceStatus { present, absent, late, excused }