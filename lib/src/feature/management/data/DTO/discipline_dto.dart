import 'package:freezed_annotation/freezed_annotation.dart';

part 'discipline_dto.freezed.dart';
part 'discipline_dto.g.dart';

@freezed
abstract class DisciplineDTO with _$DisciplineDTO {
  const factory DisciplineDTO({
    required String id,
    required String name,
    @JsonKey(name: 'teacher_id')   required String teacherId,
    @JsonKey(name: 'teacher_name') @Default('') String teacherName,
    @Default(0) int credits,
    required String level,   // 'bachelor' | 'master'
    @JsonKey(name: 'total_seats') @Default(0) int totalSeats,
    @JsonKey(name: 'taken_seats') @Default(0) int takenSeats,
    @JsonKey(name: 'is_enrolled') @Default(false) bool isEnrolled,
  }) = _DisciplineDTO;

  factory DisciplineDTO.fromJson(Map<String, dynamic> json) =>
      _$DisciplineDTOFromJson(json);
}