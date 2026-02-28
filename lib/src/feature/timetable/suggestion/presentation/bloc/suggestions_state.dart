part of 'suggestions_bloc.dart';


@freezed
class SuggestionState with _$SuggestionState {
  const factory SuggestionState.initial() = _SuggestionInitial;

  const factory SuggestionState.loading() = _SuggestionLoading;

  const factory SuggestionState.success({
    required List<String> suggestions,
  }) = _SuggestionSuccess;

  const factory SuggestionState.error({required String error}) = _SuggestionError;
}