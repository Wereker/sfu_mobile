import 'package:freezed_annotation/freezed_annotation.dart';

part 'announcement_dto.freezed.dart';
part 'announcement_dto.g.dart';

@freezed
abstract class AnnouncementDTO with _$AnnouncementDTO {
  const factory AnnouncementDTO({
    @JsonKey(fromJson: _intToString) required String id,
    required String title,
    required String content,
    required String status,           // 'draft' | 'published' | 'expired'
    @JsonKey(name: 'publish_at') required String publishAt,
    @JsonKey(name: 'expires_at') required String expiresAt,
    @JsonKey(name: 'author_id', fromJson: _intToString) required String authorId,
    @JsonKey(name: 'created_at') required String createdAt,
    @Default([]) List<dynamic> attachments,
  }) = _AnnouncementDTO;

  factory AnnouncementDTO.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementDTOFromJson(json);
}

String _intToString(dynamic v) => v.toString();