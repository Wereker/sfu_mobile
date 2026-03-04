import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_dto.freezed.dart';
part 'news_dto.g.dart';

@freezed
abstract class NewsDTO with _$NewsDTO {
  const factory NewsDTO({
    required String id,
    required String title,
    required String subtitle,
    required String text,
    required String author,
    required String date,
}) = _NewsDTO;

  factory NewsDTO.fromJson(Map<String, dynamic> json) => _$NewsDTOFromJson(json);
}