import 'package:freezed_annotation/freezed_annotation.dart';

part 'managed_student.freezed.dart';

@freezed
abstract class ManagedStudent with _$ManagedStudent {
  const factory ManagedStudent({
    required String id,
    required String name,
    required String groupId,
    required String groupName,
    required String stream,
    required bool   isHeadman,
    String? phone,
    String? telegram,
    String? email,
    String? avatarUrl,
  }) = _ManagedStudent;
}