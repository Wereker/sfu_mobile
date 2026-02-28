import 'package:sfu/src/feature/timetable/suggestion/domain/repository/suggestion_repository.dart';
import 'package:sfu/src/feature/timetable/suggestion/domain/use_case/suggestions_load_use_case.dart';

class SuggestionsLoadUseCaseImpl implements SuggestionsLoadUseCase {
  final SuggestionRepository suggestionsRepo;

  const SuggestionsLoadUseCaseImpl(this.suggestionsRepo);

  @override
  Future<List<String>> call(String query) async {
    final suggestions = await suggestionsRepo.getSuggestions(query);
    return suggestions;
  }

}