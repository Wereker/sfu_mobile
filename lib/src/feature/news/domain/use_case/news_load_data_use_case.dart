import 'package:sfu/src/feature/news/domain/entity/news.dart';

abstract class NewsLoadDataUseCase {
  Future<List<News>>call();
}