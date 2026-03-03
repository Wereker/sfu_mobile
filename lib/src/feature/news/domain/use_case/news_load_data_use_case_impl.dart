import 'package:sfu/src/feature/news/domain/entity/news.dart';
import 'package:sfu/src/feature/news/domain/repository/news_repository.dart';
import 'package:sfu/src/feature/news/domain/use_case/news_load_data_use_case.dart';

class NewsLoadDataUseCaseImpl implements NewsLoadDataUseCase {
  final NewsRepository repo;

  const NewsLoadDataUseCaseImpl(this.repo);

  @override
  Future<List<News>> call() async {
    return await repo.getNewsForUser();
  }

}