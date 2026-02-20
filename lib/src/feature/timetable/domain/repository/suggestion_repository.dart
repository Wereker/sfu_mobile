abstract class SuggestionRepository {
  Future<List<String>> getSuggestions(String query);
}