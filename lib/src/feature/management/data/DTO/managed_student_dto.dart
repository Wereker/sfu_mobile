// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'managed_student_dto.freezed.dart';
part 'managed_student_dto.g.dart';

@freezed
abstract class ManagedStudentDTO with _$ManagedStudentDTO {
  const factory ManagedStudentDTO({
    required String id,
    required String name,
    @JsonKey(name: 'group_id')   required String groupId,
    @JsonKey(name: 'group_name') @Default('') String groupName,
    @Default('') String stream,
    @JsonKey(name: 'is_headman') @Default(false) bool isHeadman,
    String? phone,
    String? telegram,
    String? email,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
  }) = _ManagedStudentDTO;

  factory ManagedStudentDTO.fromJson(Map<String, dynamic> json) =>
      _$ManagedStudentDTOFromJson(json);
}