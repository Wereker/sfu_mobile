import 'package:freezed_annotation/freezed_annotation.dart';

part 'staff_member.freezed.dart';

@freezed
abstract class StaffMember with _$StaffMember {
  const factory StaffMember({
    required String id,
    required String name,
    required String position,
    required String degree,
    required String email,
    String? phone,
    String? telegram,
    String? office,
    String? bio,
    required List<String> tags,
    String? avatarUrl,
  }) = _StaffMember;
}
