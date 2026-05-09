import 'package:freezed_annotation/freezed_annotation.dart';

part 'announcement.freezed.dart';

@freezed
abstract class Announcement with _$Announcement {
  const factory Announcement({
    required String id,
    required bool isPinned,
    required String source,
    required String authorId,
    required String author,
    required DateTime date,
    required String title,
    required String preview,
    required String body,
    required String audience,
    required List<String> tags,
  }) = _Announcement;
}
