abstract class SuggestionRemoteDataSource {
  Future<List<String>> getSuggestions(String query);
}