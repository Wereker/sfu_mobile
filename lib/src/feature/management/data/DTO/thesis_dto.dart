import 'package:freezed_annotation/freezed_annotation.dart';

part 'thesis_dto.freezed.dart';
part 'thesis_dto.g.dart';

@freezed
abstract class ThesisDTO with _$ThesisDTO {
  const factory ThesisDTO({
    required String id,
    required String title,
    @JsonKey(name: 'teacher_id')   required String teacherId,
    @JsonKey(name: 'teacher_name') @Default('') String teacherName,
    @JsonKey(name: 'is_free')      required bool isFree,
    @JsonKey(name: 'taken_by')     String? takenBy,
    @JsonKey(name: 'taken_by_id')  String? takenById,
  }) = _ThesisDTO;

  factory ThesisDTO.fromJson(Map<String, dynamic> json) =>
      _$ThesisDTOFromJson(json);
}