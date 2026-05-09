// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
abstract class UserDTO with _$UserDTO {
  const factory UserDTO({
    required String id,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    @JsonKey(name: 'father_name') String? fatherName,
    DateTime? birthdate,
    String? sex,
    String? phone,
    required String role,
    String? avatarUrl,

    // Только для студента
    String? institute,
    @JsonKey(name: 'group_id') String? groupId,
    @JsonKey(name: 'group_name') String? groupName,
    String? stream,
    String? subgroup,
    @JsonKey(name: 'record_book_number') String? recordBookNumber,

    // Только для преподавателя
    String? position,
    String? degree,
    String? office,
    String? bio,
    @Default([]) List<String> tags,
  }) = _UserDTO;

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);
}
