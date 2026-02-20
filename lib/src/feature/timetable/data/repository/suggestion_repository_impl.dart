import 'package:sfu/src/feature/timetable/data/data_source/remote/suggestion_remote_data_source.dart';
import 'package:sfu/src/feature/timetable/domain/repository/suggestion_repository.dart';

class SuggestionRepositoryImpl implements SuggestionRepository {
  final SuggestionRemoteDataSource _remote;

  const SuggestionRepositoryImpl({required SuggestionRemoteDataSource remote})
    : _remote = remote;

  @override
  Future<List<String>> getSuggestions(String query) async {
    final suggestions = await _remote.getSuggestions(query);
    return suggestions;
  }
}
