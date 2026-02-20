import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/feature/timetable/domain/use_case/suggestions_load_use_case.dart';

part 'suggestions_bloc.freezed.dart';
part 'suggestions_event.dart';
part 'suggestions_state.dart';

class SuggestionsBloc extends Bloc<SuggestionEvent, SuggestionState> {
  final SuggestionsLoadUseCase timetableLoadSearchSuggestionsUseCase;
  SuggestionsBloc(this.timetableLoadSearchSuggestionsUseCase)
    : super(SuggestionState.initial()) {
    on<SuggestionEvent>(_onEvent);
  }

  Future<void> _onEvent(
    SuggestionEvent event,
    Emitter<SuggestionState> emit,
  ) async {
    await event.when(
      loadData: () async {
        emit(SuggestionState.success(suggestions: []));
      },
      loadSuggestions: (String query) async {
        final suggestions = await timetableLoadSearchSuggestionsUseCase.call(
          query,
        );
        emit(SuggestionState.success(suggestions: suggestions));
      },
    );
  }
}
