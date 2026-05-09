import 'package:sfu/src/feature/announcements/data/dto/announcement_dto.dart';
import 'package:sfu/src/feature/announcements/domain/entity/announcement.dart';

abstract class AnnouncementMapper {
  static Announcement fromDTO(AnnouncementDTO dto) => Announcement(
    id:       dto.id,
    isPinned: dto.isPinned,
    source:   dto.source,
    authorId: dto.authorId,
    author:   dto.author,
    date:     DateTime.parse(dto.date),
    title:    dto.title,
    preview:  dto.preview,
    body:     dto.body,
    audience: dto.audience,
    tags:     dto.tags,
  );
}