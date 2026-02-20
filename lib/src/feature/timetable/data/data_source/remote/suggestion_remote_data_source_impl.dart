import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sfu/src/feature/timetable/data/data_source/remote/suggestion_remote_data_source.dart';

class SuggestionRemoteDataSourceImpl implements SuggestionRemoteDataSource {
  // TODO: Вынести DIO в отдельную структуру
  final Dio dio = Dio();
  final String baseUrl = dotenv.env['API_SFU_TIMETABLE_URL'] ?? '';

  @override
  Future<List<String>> getSuggestions(String query) async {
    final response = await dio.get(
      '$baseUrl/api/timetable/autocomplete_new/$query',
      options: Options(headers: {'Accept': 'application/json'}),
    );

    final data = response.data as Map<String, dynamic>;

    if (data.isEmpty) return [];

    final List<String> suggestions = [];
    for (final key in data.keys) {
      suggestions.add(data[key] as String);
    }
    return suggestions;
  }
}