import 'package:sfu/src/feature/news/domain/entity/news.dart';

abstract class NewsRepository {
  Future<List<News>> getNewsForUser();
}