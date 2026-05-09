import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required String id,
    required String firstName,
    required String lastName,
    String? fatherName,
    DateTime? birthdate,
    String?   sex,
    String?   phone,
    required String role,  // 'student' | 'teacher'
    String?   avatarUrl,

    // Только для студента
    String? institute,
    String? groupId,
    String? groupName,
    String? stream,
    String? subgroup,
    String? recordBookNumber,

    // Только для преподавателя
    String? position,
    String? degree,
    String? office,
    String? bio,
    @Default([]) List<String> tags,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

