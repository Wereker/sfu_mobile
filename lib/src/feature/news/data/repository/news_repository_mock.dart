import 'package:sfu/src/feature/news/data/data_source/local/news_locale_data_source.dart';
import 'package:sfu/src/feature/news/data/data_source/remote/news_remote_data_source.dart';
import 'package:sfu/src/feature/news/domain/entity/news.dart';
import 'package:sfu/src/feature/news/domain/repository/news_repository.dart';

class NewsRepositoryMock implements NewsRepository {
  final NewsLocaleDataSource _locale;
  final NewsRemoteDataSource _remote;

  const NewsRepositoryMock(this._remote, this._locale);

  @override
  Future<List<News>> getNewsForUser() async {
    final data = await _remote.getNewsForUser();

    return data.map((newsDTO) => News.fromDTO(newsDTO)).toList();
  }
}
