// ignore_for_file: invalid_annotation_target
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

  /// Маппинг из UserRead (API /users/teachers).
  static StaffMemberDTO fromApiJson(Map<String, dynamic> json) {
    final parts = <String>[
      json['surname'] as String? ?? '',
      json['name'] as String? ?? '',
      if ((json['patronymic'] as String?)?.isNotEmpty == true)
        json['patronymic'] as String,
    ].where((s) => s.isNotEmpty).toList();

    return StaffMemberDTO(
      id: (json['id'] as int).toString(),
      name: parts.join(' '),
      position: '',
      degree: '',
      email: json['email'] as String? ?? '',
      phone: null,
      telegram: null,
      office: null,
      bio: null,
      tags: const [],
      avatarUrl: json['avatar'] as String?,
    );
  }
}
