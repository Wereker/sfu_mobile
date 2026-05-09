import 'package:freezed_annotation/freezed_annotation.dart';

part 'staff_member_dto.freezed.dart';
part 'staff_member_dto.g.dart';

@freezed
abstract class StaffMemberDTO with _$StaffMemberDTO {
  const factory StaffMemberDTO({
    required String id,
    required String name,
    required String position,
    @Default('') String degree,
    required String email,
    String? phone,
    String? telegram,
    String? office,
    String? bio,
    @Default([]) List<String> tags,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
  }) = _StaffMemberDTO;

  factory StaffMemberDTO.fromJson(Map<String, dynamic> json) =>
      _$StaffMemberDTOFromJson(json);
}