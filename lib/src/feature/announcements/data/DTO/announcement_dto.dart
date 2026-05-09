// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'announcement_dto.freezed.dart';
part 'announcement_dto.g.dart';

@freezed
abstract class AnnouncementDTO with _$AnnouncementDTO {
  const factory AnnouncementDTO({
    required String id,
    @JsonKey(name: 'is_pinned') @Default(false) bool isPinned,
    @Default('') String source,
    @JsonKey(name: 'author_id') @Default('') String authorId,
    @Default('') String author,
    required String date, // 'YYYY-MM-DD'
    required String title,
    @Default('') String preview,
    required String body,
    @Default('all') String audience,
    @Default([]) List<String> tags,
  }) = _AnnouncementDTO;

  factory AnnouncementDTO.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementDTOFromJson(json);
}
