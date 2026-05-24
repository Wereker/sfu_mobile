// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
abstract class UserDTO with _$UserDTO {
  const factory UserDTO({
    required int id,
    @JsonKey(name: 'name') required String firstName,
    @JsonKey(name: 'surname') required String lastName,
    @JsonKey(name: 'patronymic') String? fatherName,
    required String email,
    required String role,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'avatar') String? avatarUrl,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _UserDTO;

  factory UserDTO.fromJson(Map<String, dynamic> json) => _$UserDTOFromJson(json);
}
