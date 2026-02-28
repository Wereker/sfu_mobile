part of 'suggestions_bloc.dart';

@freezed
class SuggestionEvent with _$SuggestionEvent {
  const factory SuggestionEvent.loadData() = _SuggestionLoadData;

  const factory SuggestionEvent.loadSuggestions(String query) = _SuggestionLoadDataForTarget;
}