import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
abstract class UserDTO with _$UserDTO {
  const factory UserDTO({
    required String id,
    required String firstName,
    required String lastName,
    String? fatherName,
    DateTime? birthdate,
    String? sex,
    required String phone,
    required String role,
  }) = _UserDTO;

  factory UserDTO.fromJson(Map<String, Object?> json) => _$UserDTOFromJson(json);
}