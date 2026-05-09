import 'package:sfu/src/core/error/exception_handler.dart';
import 'package:sfu/src/feature/timetable/suggestion/domain/repository/suggestion_repository.dart';
import 'package:sfu/src/feature/timetable/suggestion/domain/use_case/get_suggestions_use_case.dart';

class GetSuggestionsUseCaseImpl implements GetSuggestionsUseCase {
  final SuggestionRepository _repo;
  const GetSuggestionsUseCaseImpl(this._repo);

  @override
  Future<List<String>> call(String query) async {
    if (query.trim().length < 2) return const [];
    return ExceptionHandler.handle(() => _repo.getSuggestions(query.trim()));
  }
}