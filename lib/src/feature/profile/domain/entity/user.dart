import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
abstract class User with _$User {
  const factory User({
    // — с сервера —
    required int id,
    required String firstName,
    required String lastName,
    String? fatherName,
    required String email,
    required UserRole role,
    required bool isActive,
    String? avatarUrl,
    required DateTime createdAt,
    required DateTime updatedAt,

    // — контакты (UI + будущий API) —
    String? phone,
    String? telegram,

    // — общие UI-поля —
    DateTime? birthdate,
    String? sex,

    // — студент —
    String? institute,
    String? groupId,
    String? groupName,
    String? stream,
    String? subgroup,
    String? recordBookNumber,

    // — преподаватель —
    String? position,
    String? degree,
    String? department,
    String? bio,
    @Default([]) List<String> tags,

    // — настройки уведомлений —
    @Default(true)  bool notifyChats,
    @Default(true)  bool notifyNews,
    @Default(false) bool notifyEvents,
  }) = _User;
}

enum UserRole { student, teacher, admin, unknown }
