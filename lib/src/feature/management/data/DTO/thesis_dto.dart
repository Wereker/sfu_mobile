// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'thesis_dto.freezed.dart';
part 'thesis_dto.g.dart';

@freezed
abstract class ThesisDTO with _$ThesisDTO {
  const factory ThesisDTO({
    required String id,
    required String title,
    @JsonKey(name: 'teacher_id') required String teacherId,
    @JsonKey(name: 'teacher_name') @Default('') String teacherName,
    @JsonKey(name: 'is_free') required bool isFree,
    @JsonKey(name: 'taken_by') String? takenBy,
    @JsonKey(name: 'taken_by_id') String? takenById,
  }) = _ThesisDTO;

  factory ThesisDTO.fromJson(Map<String, dynamic> json) =>
      _$ThesisDTOFromJson(json);

  /// Маппинг из VKRTopicRead (API /vkr/topics).
  static ThesisDTO fromApiJson(Map<String, dynamic> json) {
    final proposedBy = json['proposed_by'] as Map<String, dynamic>?;
    final teacherName = proposedBy != null
        ? '${proposedBy['surname'] ?? ''} ${proposedBy['name'] ?? ''}'.trim()
        : '';

    return ThesisDTO(
      id: (json['id'] as int).toString(),
      title: json['title'] as String,
      teacherId: (json['proposed_by_id'] as int).toString(),
      teacherName: teacherName,
      isFree: json['student_id'] == null,
      takenBy: null,
      takenById: json['student_id'] != null
          ? (json['student_id'] as int).toString()
          : null,
    );
  }
}
