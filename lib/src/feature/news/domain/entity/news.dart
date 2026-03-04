import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/feature/news/data/DTO/news_dto.dart';

part 'news.freezed.dart';

@freezed
abstract class News with _$News {
  const factory News({
    required String title,
    required String subtitle,
    required String text,
    required String author,
    required DateTime date,
  }) = _News;

  static News fromDTO(NewsDTO dto) => News(
    title: dto.title,
    subtitle: dto.subtitle,
    text: dto.text,
    author: dto.author,
    date: DateTime.parse(dto.date),
  );
}
