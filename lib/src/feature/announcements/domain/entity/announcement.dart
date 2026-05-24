import 'package:freezed_annotation/freezed_annotation.dart';

part 'announcement.freezed.dart';

@freezed
abstract class Announcement with _$Announcement {
  const factory Announcement({
    // — с сервера —
    required String id,
    required String title,
    required String content,
    required String status,
    required DateTime publishAt,
    required DateTime expiresAt,
    required String authorId,
    required DateTime createdAt,

    // — синтетика до появления на сервере —
    @Default(false) bool isPinned,
    @Default('Кафедра') String source,
    @Default('') String author,
    @Default([]) List<String> tags,
  }) = _Announcement;
}