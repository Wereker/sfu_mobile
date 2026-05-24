import 'package:intl/intl.dart';
import 'package:sfu/src/feature/announcements/data/dto/announcement_dto.dart';
import 'package:sfu/src/feature/announcements/domain/entity/announcement.dart';

abstract class AnnouncementMapper {
  static Announcement fromDTO(AnnouncementDTO dto) {
    final publishAt = DateTime.parse(dto.publishAt);

    return Announcement(
      // — серверные поля —
      id: dto.id,
      title: dto.title,
      content: dto.content,
      status: dto.status,
      publishAt: publishAt,
      expiresAt: DateTime.parse(dto.expiresAt),
      authorId: dto.authorId,
      createdAt: DateTime.parse(dto.createdAt),

      // — синтетика —
      isPinned: _mockIsPinned(dto.id),
      source: _mockSource(dto.authorId),
      author: _mockAuthor(dto.authorId),
      tags: _mockTags(dto.title, dto.content),
    );
  }

  // Первые два объявления — закреплённые (пока нет поля на сервере)
  static bool _mockIsPinned(String id) =>
      id == '1' || id == '2';

  static String _mockSource(String authorId) {
    const map = {'1': 'Кафедра ИКИТ'};
    return map[authorId] ?? 'Кафедра';
  }

  static String _mockAuthor(String authorId) {
    const map = {'1': 'Администратор'};
    return map[authorId] ?? '';
  }

  static List<String> _mockTags(String title, String content) {
    final t = '${title.toLowerCase()} ${content.toLowerCase()}';
    final tags = <String>[];
    if (t.contains('расписани') || t.contains('перенос') || t.contains('отмен'))
      tags.add('Расписание');
    if (t.contains('лаборатор') || t.contains('курсов') || t.contains('пересдач'))
      tags.add('Учёба');
    if (t.contains('хакатон') || t.contains('конференц'))
      tags.add('Мероприятие');
    if (t.contains('вкр') || t.contains('дипломн') || t.contains('выпускн'))
      tags.add('ВКР');
    if (t.contains('зачётн') || t.contains('деканат'))
      tags.add('Деканат');
    if (t.contains('эиос') || t.contains('технич'))
      tags.add('Система');
    if (t.contains('карьер') || t.contains('it') || t.contains('айти'))
      tags.add('IT');
    return tags;
  }
}