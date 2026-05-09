import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_student_dto.freezed.dart';
part 'attendance_student_dto.g.dart';

@freezed
abstract class AttendanceStudentDTO with _$AttendanceStudentDTO {
  const factory AttendanceStudentDTO({
    required String id,
    required String name,
    @JsonKey(name: 'is_headman') @Default(false) bool isHeadman,
    required String status,
    @JsonKey(name: 'marked_at') String? markedAt,
  }) = _AttendanceStudentDTO;

  factory AttendanceStudentDTO.fromJson(Map<String, dynamic> json) =>
      _$AttendanceStudentDTOFromJson(json);
}