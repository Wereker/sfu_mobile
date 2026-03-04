import 'package:sfu/src/feature/news/data/DTO/news_dto.dart';

abstract class NewsRemoteDataSource {
  Future<List<NewsDTO>>getNewsForUser();
}